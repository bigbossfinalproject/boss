package boss.cashbook.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import boss.cashbook.dao.AssetDAOImpl;
import boss.cashbook.dao.CardDAOImpl;
import boss.cashbook.dao.ExpenseDAOImpl;
import boss.cashbook.dao.ItemAuthDAOImpl;
import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.dao.TradeDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.CardBean;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.ItemBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.model.TradeBean;
import boss.cashbook.service.ExpenseViewBean;

@Controller
public class ExpenseController {
	
	@Autowired
	private ExpenseDAOImpl expenseDao;
	
	@Autowired
	private AssetDAOImpl assetDao;
	
	@Autowired
	private ItemDAOImpl itemDao;
	
	@Autowired
	private TradeDAOImpl tradeDao;
	
	@Autowired
	private CardDAOImpl cardDao;
	
	@Autowired
	private ItemAuthDAOImpl itemAuthDao;
	
	// 지출 데이터를 입력, 수정, 삭제하는 메서드
	@RequestMapping(value="expense_write_ok.do", method=RequestMethod.POST)
	public ModelAndView expenseInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		String[] expense_remove = request.getParameterValues("expense_remove");					// 삭제할 지출 값
		String[] expense_id = request.getParameterValues("expense_id");									// 추가, 수정할 지출 아이디
		String[] root_idn = request.getParameterValues("root_idn");											// 추가, 수정할 사용자 고유번호
		String[] root_id = request.getParameterValues("root_id");												// 추가, 수정할 사용자 아이디
		String[] expense_date = request.getParameterValues("expense_date");							// 추가, 수정할 지출 일자
		String[] parent_code = request.getParameterValues("parent_code");								// 추가, 수정할 지출 중분류 항목 코드
		String[] item_code = request.getParameterValues("item_code");									// 추가, 수정할 지출 상세항목 코드
		String[] trade_code = request.getParameterValues("trade_code");									// 추가, 수정할 지출 유형 코드
		String[] asset_code = request.getParameterValues("asset_code");									// 추가, 수정할 지불 계좌, 지불 카드 코드
		String[] expense_discription = request.getParameterValues("expense_discription");			// 추가, 수정할 지출 상세 정보
		String[] expense_amount = request.getParameterValues("expense_amount");					// 추가, 수정할 지출 금액
		
		// 삭제할 지출 정보를 DB에 적용시키는 구문
		if(expense_remove != null) {
			System.out.println("삭제할 지출 코드 개수 : "+expense_remove.length);
			for(String str : expense_remove) {
				/*System.out.println("삭제할 파라미터값 : "+str);
				System.out.println("삭제할 실제 코드값 : "+str.substring(6));*/
				expenseDao.expenseDelete(str.substring(6));
			}
		}
		
		List<ExpenseBean> eList = new ArrayList<ExpenseBean>();
		if(expense_id != null) {
			
			for(int i = 0; i < expense_id.length; i++) {
				ExpenseBean expense = new ExpenseBean();
				expense.setExpense_id(expense_id[i]);
				expense.setRoot_idn(Integer.parseInt(root_idn[i]));
				expense.setRoot_id(root_id[i]);
				expense.setExpense_date(Date.valueOf(expense_date[i]));
				expense.setParent_code(parent_code[i]);
				expense.setItem_code(item_code[i]);
				expense.setTrade_code(trade_code[i]);
				expense.setAsset_code(asset_code[i]);
				if(expense_discription[i] != null){
					expense.setExpense_discription(expense_discription[i]);
				} else {
					expense.setExpense_discription("");
				}
				expense.setExpense_amount(Integer.parseInt(expense_amount[i].replace(",", "")));
				
				eList.add(expense);
			}
			
			for(ExpenseBean info : eList) {
				if(info.getExpense_id().equals("new_code")) {								// 자산 코드가 new_code로 지정되어 있으면 실행되는 구문
					info.setExpense_id(expenseIdCreate(info.getRoot_idn()));			// 새로운 expense_id를 생성하여 setter로 입력
					expenseDao.expenseInsert(info);											// Dao Insert SQL문 실행
				} else {
					expenseDao.expenseUpdate(info);											// Dao Update SQL문 실행
				}
			}
			
		}
		
		response.sendRedirect("expense_list.do");
		
		return null;
	}
	
	// 지출 목록을가져오기 위한 메소드
	@RequestMapping(value="expense_list.do")
	public ModelAndView expenseList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		String item_code = rootIdn+"e";
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/expense_list");
		
		// 오늘 날짜를 scope영역에 올리기
		Calendar cal = Calendar.getInstance();			// 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		mv.addObject("today", date);
		
		// 지출 분류항목(item) 코드를 불러와서 scope영역에 올리기
		List<ItemBean> iList = itemDao.itemList((item_code+"%"));
		mv.addObject("itemList", iList);
		
		// 거래 유형(trade) 코드를 불러와서 scope영역에 올리기
		List<TradeBean> tList = tradeDao.tradeList();
		mv.addObject("tradeList", tList);
		
		// 자산계좌(asset) 코드를 불러와서 scope영역에 올리기
		List<AssetBean> aList = assetDao.memAssetList(rootIdn);
		mv.addObject("assetList", aList);
		
		// 카드(card) 코드를 불러와서 scope영역에 올리기
		List<CardBean> cList = cardDao.cardList(rootIdn);
		mv.addObject("cardList", cList);
		
		// 지출 목록을 보여주기 위해 자바빈에 등록하고 리스트로 만들어서 scope영역에 올리기
		List<ExpenseBean> list = expenseDao.expenseList(rootIdn);
		int seq = 1;
		List<ExpenseViewBean> expenseList = new ArrayList<ExpenseViewBean>();
		for(ExpenseBean expense : list) {
			List<ItemBean> itemList = itemDao.itemList((item_code+"%"));							// 지출 품목 항목 - 식료품비, 주거비, ... 등에 해당
			TradeBean trade = tradeDao.tradeOne(expense.getTrade_code());							// 지출 수단 항목 - 현금, 통장, 신용카드, 체크카드 등에 해당
			//System.out.println("itemList 개수 : "+itemList.size());
			CardBean card = null;
			AssetBean asset = null;
			//System.out.println("카드 문자열 포함 여부 check : "+expense.getTrade_code().contains("card"));
			if(expense.getTrade_code().contains("card")){
				card = cardDao.cardOne(expense);														// 지출 카드 항목 - 신용카드에 해당
			} else {
				asset = assetDao.assetOne(expense);												// 지출 자산 항목 - 현금, 통장, 계좌이체, 체크카드 사용시에 해당
			}
			
			ItemBean item = null;
			for(ItemBean myList : itemList) {
				if(myList.getItem_code().equals(expense.getItem_code())) {
					item = myList;
				}
			}
			
			
			ExpenseViewBean evb = new ExpenseViewBean();
			evb.setExpense_seq(seq++);
			evb.setExpense_id(expense.getExpense_id());
			evb.setRoot_id(expense.getRoot_id());
			evb.setRoot_idn(expense.getRoot_idn());
			evb.setExpense_date(expense.getExpense_date());
			evb.setItem_code(item.getItem_code());
			evb.setParent_code(item.getParent_code());
			evb.setItem_name(item.getItem_name());
			evb.setTrade_code(trade.getTrade_code());
			evb.setTrade_name(trade.getTrade_name());
			if(asset != null){
				evb.setAsset_code(asset.getAsset_code());
				evb.setAsset_name(asset.getAsset_name());
			} else if (card != null){
				evb.setAsset_code(card.getCard_code());
				evb.setAsset_name(card.getCard_name());
			}
			evb.setExpense_discription(expense.getExpense_discription());
			evb.setExpense_amount(expense.getExpense_amount());
			expenseList.add(evb);
			
		}
		mv.addObject("expenseList", expenseList);
		
		return mv;
	}
	
	// 지출 중분류항목을 선택하면 세부항목을 보여주는 메소드
	@RequestMapping(value="exp_detail_item.do", method=RequestMethod.POST)
	public ModelAndView expenseDetailItem(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String parent_code = request.getParameter("parent_code");
		String children_code = request.getParameter("children_code");
		
		//System.out.println("parent_code : "+parent_code+"\t / children_code : "+children_code);
		ModelAndView mv = new ModelAndView("expense/expense_detail_item");
		
		List<ItemBean> list = itemDao.itemDetailList((parent_code.substring(0, (parent_code.length()-3))+"%"));
		//System.out.println("itemDetailList 개수 : "+list.size());
		mv.addObject("expenseItemDetailList", list);
		mv.addObject("item_code", children_code);
		
		return mv;
	}
	
	// 지출유형을 선택하면 계좌 상세정보를 보여주는 메소드
	@RequestMapping(value="exp_detail_asset.do", method=RequestMethod.POST)
	public ModelAndView expenseDetailAsset(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String trade_code = request.getParameter("trade_code");
		String asset_code = request.getParameter("asset_code");
		
		//System.out.println("trade_code : "+trade_code+"\t / asset_code : "+asset_code);
		ModelAndView mv = new ModelAndView("expense/expense_detail_asset");
		
		//List<ItemBean> list = itemDao.itemDetailList((as+"%"));
		List<AssetBean> list = assetDao.tradeAssetList(trade_code);
		//System.out.println("assetDetailList 개수 : "+list.size());
		mv.addObject("expenseAssetDetailList", list);
		mv.addObject("asset_code", asset_code);
		
		return mv;
	}
	
	// 지출유형을 선택하면 카드 상세정보를 보여주는 메소드
	@RequestMapping(value="exp_detail_card.do", method=RequestMethod.POST)
	public ModelAndView expenseDetailCard(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		String rootId = (String) session.getAttribute("root_Id");
		
		String trade_code = request.getParameter("trade_code");
		String card_code = request.getParameter("asset_code");
		
		//System.out.println("parent_code : "+parent_code+"\t / children_code : "+children_code);
		ModelAndView mv = new ModelAndView("expense/expense_detail_card");
		Map<String, String> cardMap = new HashMap<String, String>();
		cardMap.put("card_type_code", trade_code);
		cardMap.put("root_id", rootId);
		
		
		List<CardBean> list = cardDao.cardTypeList(cardMap);
		//System.out.println("cardDetailList 개수 : "+list.size());
		mv.addObject("expenseCardDetailList", list);
		mv.addObject("card_code", card_code);
		
		return mv;
	}
		
	// expense_id의 중복 검사를 마친 최종 expense_id 생성 메서드
	private String expenseIdCreate(int root_idn) {
		// expense_id를 입력하기 위한 코드
		String uid = uniqId();
		String expense_id = null;
		String expenseId = root_idn+"e";
		
		expense_id = expenseId + uid;
		boolean condit = true;
		
		int cnt = expenseDao.expenseCount(root_idn);
		
		List<ExpenseBean> eList = null;
		if(cnt > 0) {
			eList = expenseDao.expenseList(root_idn);
		}
		
		// expense_id가 중복되었을 경우 다시 uuid를 생성해주는 구문
		if(eList == null) return null;
		for(ExpenseBean e : eList) {
			while(condit) {
				if(e.getExpense_id().equals(expense_id)) {
					uid = uniqId();
					expense_id = expenseId + uid;
					condit = true;
				} else {
					condit = false;
				}
			}
		}
		return expense_id;
	}
	
	// unique ID를 생성하기 위한 메서드
	private String uniqId() {
		UUID uuid = UUID.randomUUID();
		String uid = uuid.toString();
		uid = uid.replace("-", "");
		int start = (int) (Math.random()*16);
		String uId = uid.substring(start, start+15);
		return uId;
	}
}
