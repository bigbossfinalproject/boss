package boss.cashbook.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;
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
import boss.cashbook.model.ItemAuthBean;
import boss.cashbook.model.ItemBean;
import boss.cashbook.model.LoanBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.model.TradeBean;
import boss.cashbook.service.ExpenseViewBean;
import boss.cashbook.service.MemberItemViewBean;

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
	
	@RequestMapping(value="expense_write.do")
	public ModelAndView expenseWriteView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
		
		Calendar cal = Calendar.getInstance();			// 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		request.setAttribute("date", date);
		
		// 사용자의 개인별 지출 품목 목록 가져와서 scope 영역에 올리기
		ItemAuthBean itemAuth = itemAuthDao.userItem(user.getRoot_idn());								
		
		// 사용자 개인별 지출 목록이 합쳐진 문자열을 개별 목록으로 입력 
		List<String> myItemList = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(itemAuth.getItem_list(), "|");
		while(st.hasMoreTokens()){
			myItemList.add(st.nextToken());
		}
		
		String item_code = user.getRoot_idn()+"e%";
		
		// 개인별 품목을 목록화해서 scope 영역에 올리기
		List<ItemBean> itemList = itemDao.itemList(item_code);
		
		// 사용자가 사용 가능한 목록을 가져오기 위해 리스트 변수 선언
		List<MemberItemViewBean> memItemList = new ArrayList<MemberItemViewBean>();
		
		for(String itemCode : myItemList) {					// 사용자 개인별 분류 항목 목록 개수만큼 반복
			for(ItemBean itemBean : itemList){				// 전체 분류항목개수에서 목록 작성
				if(itemCode.equals(itemBean.getItem_code())) {
					MemberItemViewBean memItem = new MemberItemViewBean();
					memItem.setItemCode(itemCode);
					memItem.setItemName(itemBean.getItem_name());
					memItem.setItemLevel(itemBean.getItem_level());
					memItemList.add(memItem);
					break;
				}
			}
		}
		request.setAttribute("memItemList", memItemList);
		
		// 지출 분류 정보 가져와서 scope 영역에 정보 올리기
		List<TradeBean> tradeList = tradeDao.tradeList();
		request.setAttribute("tradeList", tradeList);
		
		// 지출 분류 항목에 대한 자산 세부 목록 가져와서 scope영역에 올리기
		List<AssetBean> assetList = assetDao.assetList();
		request.setAttribute("assetList", assetList);
		
		List<CardBean> cardList = cardDao.cardList(user.getRoot_idn());
		request.setAttribute("cardList", cardList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/expense_write");
		return mv;
	}
	
	// 지출 데이터 입력
	@RequestMapping(value="expense_write_ok.do", method=RequestMethod.POST)
	public ModelAndView expenseInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		//ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		int root_idn = Integer.parseInt(request.getParameter("root_idn"));
		String root_id = request.getParameter("root_id");
		Date expense_date = Date.valueOf(request.getParameter("expense_date"));
		String item_code = request.getParameter("item_code");
		String trade_code = request.getParameter("trade_code");
		String expense_code = request.getParameter("expense_code");
		String expense_discription = request.getParameter("expense_discription");
		int expense_amount = Integer.parseInt(request.getParameter("expense_amount"));
		
		// expense_id를 입력하기 위한 코드
		String uid = uniqId();
		String expense_id = null;
		String expenseId = root_idn+"e";
		
		int cnt = expenseDao.expenseCount(root_idn);
		
		List<ExpenseBean> eList = null;
		if(cnt > 0){
			eList = expenseDao.expenseAllList(root_idn);
		}
		expense_id = expenseId + uid;
		boolean condit = true;
		while(condit) {
			if(eList == null) break;
			for(ExpenseBean s : eList) {
				if(expense_id.equals(s.getExpense_id())) {
					uid = uniqId();
					expense_id = expenseId + uid;
					condit = true;
					break;
				} else {
					condit = false;
				}
			}
		}
		
		ExpenseBean expense = new ExpenseBean();
		expense.setExpense_id(expense_id);
		expense.setRoot_idn(root_idn);
		expense.setRoot_id(root_id);
		expense.setExpense_date(expense_date);
		expense.setItem_code(item_code);
		expense.setTrade_code(trade_code);
		expense.setExpense_code(expense_code);
		expense.setExpense_discription(expense_discription);
		expense.setExpense_amount(expense_amount);
		
		
		expenseDao.expenseInsert(expense);
		
		response.sendRedirect("expense_all_list.do");
		
		return null;
	}
	
	@RequestMapping(value="expense_all_list.do")
	public ModelAndView expenseAllList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		List<ExpenseBean> list = expenseDao.expenseAllList(user.getRoot_idn());					// 지출 항목
		List<ExpenseViewBean> expenseList = new ArrayList<ExpenseViewBean>();
		
		//System.out.println(user.getRoot_name()+"님의 지출 개수는 "+list.size()+"개 입니다.");
		int seq = 1;
		String item_code = user.getRoot_idn()+"%";
		
		for(ExpenseBean expense : list) {
			List<ItemBean> itemList = itemDao.itemList(item_code);													// 지출 품목 항목 - 식료품비, 주거비, ... 등에 해당
			TradeBean trade = tradeDao.tradeOne(expense.getTrade_code());							// 지출 수단 항목 - 현금, 통장, 신용카드, 체크카드 등에 해당
			CardBean card = null;
			AssetBean asset = null;
			//System.out.println("카드 문자열 포함 여부 check : "+expense.getTrade_code().contains("card"));
			if(expense.getTrade_code().contains("card")){
				card = cardDao.cardOne(expense);														// 지출 카드 항목 - 신용카드에 해당
			} else {
				asset = assetDao.assetOne(expense);												// 지출 자산 항목 - 현금, 통장, 계좌이체, 체크카드 사용시에 해당
			}
			
			System.out.println("itemList 개수 : "+itemList.size());
			ItemBean item = null;
			for(ItemBean iList : itemList) {
				if(iList.getItem_code().equals(expense.getItem_code())) {
					item = iList;
				}
			}
			
			ExpenseViewBean evb = new ExpenseViewBean();
			evb.setExpense_seq(seq++);
			evb.setExpense_id(expense.getExpense_id());
			evb.setRoot_id(expense.getRoot_id());
			evb.setRoot_idn(expense.getRoot_idn());
			evb.setExpense_date(expense.getExpense_date());
			evb.setItem_name(item.getItem_name());
			evb.setTrade_name(trade.getTrade_name());
			if(asset != null){
				evb.setExpense_name(asset.getAsset_name());
			} else if (card != null){
				evb.setExpense_name(card.getCard_name());
			}
			evb.setExpense_discription(expense.getExpense_discription());
			evb.setExpense_amount(expense.getExpense_amount());
			expenseList.add(evb);
			
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("expense/expense_list");
		mv.addObject("expenseList", expenseList);
		
		return mv;
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
