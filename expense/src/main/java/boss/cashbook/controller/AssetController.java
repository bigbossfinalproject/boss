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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import boss.cashbook.dao.AssetDAOImpl;
import boss.cashbook.dao.BankCorpDAOImpl;
import boss.cashbook.dao.ExpenseDAOImpl;
import boss.cashbook.dao.TradeDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.BankCorpBean;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.TradeBean;
import boss.cashbook.model.header_infoBean;
import boss.cashbook.service.AssetViewBean;

@Controller
public class AssetController {

	@Autowired
	private AssetDAOImpl assetDao;

	@Autowired
	private BankCorpDAOImpl bankCorpDao;

	@Autowired
	private TradeDAOImpl tradeDao;

	@Autowired
	private ExpenseDAOImpl expenseDao;

	// 자산 정보를 입력, 수정, 삭제를 한번에 실행해주는 구문
	@RequestMapping(value = "asset_write_ok.do", method = RequestMethod.POST)
	public ModelAndView assetWriteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();

		Calendar cal = Calendar.getInstance(); // 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);

		// 브라우저에서 받은 파라메터를 변수에 저장
		String[] idn = request.getParameterValues("root_idn");
		// Integer[] idn = ((Integer)
		// request.getAttribute("root_idn")).intValue();
		String[] id = request.getParameterValues("root_id");
		String[] code = request.getParameterValues("asset_code");
		String[] name = request.getParameterValues("asset_name");
		String[] purpose = request.getParameterValues("asset_purpose");
		String[] trade = request.getParameterValues("trade_code");
		String[] date = request.getParameterValues("asset_date");
		String[] bank = request.getParameterValues("bank_code");
		String[] amount = request.getParameterValues("basic_amount");
		String[] use = request.getParameterValues("asset_use");
		String[] remove = request.getParameterValues("asset_remove");

		// 삭제할 자산 정보를 가져와서 dao에서 delete SQL문 실행
		if (remove != null) {
			for (String str : remove) {

				AssetBean asset = new AssetBean();
				asset.setAsset_code(str.substring(6).trim());

				// dao delete SQL문을 실행
				assetDao.userAssetDelete(asset);
			}
		}

		// 자산 코드 파라메터 값이 null이 아니면 실행
		List<AssetBean> abList = new ArrayList<AssetBean>();
		if (code != null) {
			// 추가, 수정 정보를 List 변수에 저장
			for (int i = 0; i < code.length; i++) {
				AssetBean ab = new AssetBean();
				ab.setRoot_idn(Integer.parseInt(idn[i]));
				ab.setRoot_id(id[i]);
				ab.setAsset_code(code[i]);
				if (name[i] != null) {
					ab.setAsset_name(name[i]);
				} else {
					ab.setAsset_name("");
				}
				if (purpose[i] != null) {
					ab.setAsset_purpose(purpose[i]);
				} else {
					ab.setAsset_purpose("");
				}
				if (trade[i] != null) {
					ab.setTrade_code(trade[i]);
				} else {
					ab.setTrade_code("");
				}
				if (date[i] != null) {
					ab.setAsset_date(Date.valueOf(date[i]));
				} else {
					ab.setAsset_date(Date.valueOf(today));
				}
				if (bank[i] != null) {
					ab.setBank_code(bank[i]);
				} else {
					ab.setBank_code("");
				}
				if (amount[i] != null) {
					ab.setBasic_amount(Integer.parseInt(amount[i].replace(",", "")));
					ab.setNow_amount(Integer.parseInt(amount[i].replace(",", "")));
				} else {
					ab.setBasic_amount(0);
					ab.setNow_amount(0);
				}
				if (use[i] != null) {
					ab.setAsset_use(use[i]);
				} else {
					ab.setAsset_use("");
				}

				abList.add(ab);
			}

			// List에 저장된 정보를 필터링을 통해 자산 정보를 추가, 수정
			for (AssetBean info : abList) {
				if (info.getAsset_code().equals("new_code")) { // 자산 코드가
																// new_code로
																// 저장되어 있으면 입력하고
																// 아니면 수정
					info.setAsset_code(assetCodeCreate(info.getRoot_idn(), info.getTrade_code())); // 새로운
																									// asset_code를
																									// 부여받는
																									// 구문
					assetDao.userAssetInsert(info); // dao insert SQL문 실행
				} else { // 기존 자산 정보 수정
					assetDao.userAssetUpdate(info); // dao update SQL문 실행
				}
			}

		}

		response.sendRedirect("asset_list.do");
		return null;
	}

	// 자산 목록 출력하는 메소드
	@RequestMapping(value="asset_list.do", method=RequestMethod.GET)
	public ModelAndView assetList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		String rootId = (String) session.getAttribute("root_Id");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/asset_list");

		// 오늘 날짜를 yyyy-MM-dd 형식으로 브라우저로 보내는 문법
		Calendar cal = Calendar.getInstance();			// 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		mv.addObject("date", today);
		
		// 거래 유형 정보 목록을 가져와서 브라우저로 보내주는 문법 
		List<TradeBean> tList = tradeDao.tradeList();
		for(int i = 0; i < tList.size(); i++) {
			if(!tList.get(i).getTrade_code().equals("cash") && !tList.get(i).getTrade_code().equals("account")) {
				tList.remove(i--);
			}
		}
		mv.addObject("trade", tList);
		
		// 은행 정보 목록을 가져와서 브라우저로 보내주는 문법
		List<BankCorpBean> bList = bankCorpDao.allBankList();
		mv.addObject("bank", bList);
		
		// DB에 저장되어 있는 자산 목록을 브라우저로 보내주는 문법
		List<AssetBean> assetList = assetDao.memAssetList(rootIdn);
		//System.out.println("assetList개수 : "+assetList.size());
		List<AssetViewBean> viewList = new ArrayList<AssetViewBean>();
		int seq = 1;
		for(AssetBean a : assetList) {
			AssetViewBean view = new AssetViewBean();
			view.setAsset_seq(seq++);
			if(a.getRoot_idn() == rootIdn) {
				view.setRoot_id(rootId);
			}
			view.setRoot_idn(a.getRoot_idn());
			view.setAsset_name(a.getAsset_name());
			view.setAsset_purpose(a.getAsset_purpose());
			view.setAsset_date(a.getAsset_date());
			view.setBasic_amount(a.getBasic_amount());
			view.setNow_amount(a.getNow_amount());
			for(TradeBean t : tList){
				if(a.getTrade_code().equals(t.getTrade_code())) {
					view.setTrade_code(a.getTrade_code());
					view.setTrade_name(t.getTrade_name());
				}
			}
			for(BankCorpBean b : bList) {
				if(a.getBank_code().equals(b.getBank_code())) {
					view.setBank_name(b.getBank_name());
					view.setBank_code(b.getBank_code());
				}
			}
			view.setAsset_code(a.getAsset_code());
			
			
			Map<String, Object> assetInfo = new HashMap<String, Object>();
			assetInfo.put("idn", view.getRoot_idn());
			assetInfo.put("startDate", view.getAsset_date().toString());
			assetInfo.put("trade", view.getTrade_code());
			assetInfo.put("asset", view.getAsset_code());
			int nowAmount = assetDao.nowAmount(assetInfo);
			/*if(expenseDao.expenseAssetCount(assetInfo) > 0) {
				nowAmount = expenseDao.expenseTermAmount(assetInfo);
			} else {
				nowAmount = view.getNow_amount();
			}
			System.out.println("AssetController - nowAmount : " + nowAmount);
			//List<ExpenseBean> expenseList = expenceDao.expenseTermList(assetInfo);
			*/
			
			view.setNow_amount(nowAmount);
			view.setAsset_use(a.getAsset_use());
			viewList.add(view);
		}
		mv.addObject("assetList", viewList);
		
		return mv;
	}

	// 자산 유형을 선택하면 해당 거래 은행을 보여주는 메소드
	@RequestMapping(value = "asset_detail_bank.do", method = RequestMethod.POST)
	public ModelAndView expenseDetailAsset(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String trade_code = request.getParameter("trade_code");
		String bank_code = request.getParameter("bank_code");

		ModelAndView mv = new ModelAndView("expense/asset_detail_bank");

		// System.out.println(trade_code+" / "+bank_code);
		// List<ItemBean> list = itemDao.itemDetailList((as+"%"));
		List<BankCorpBean> list = null;
		if (trade_code.equals("cash")) {
			list = bankCorpDao.unBankList();
		} else {
			list = bankCorpDao.bankList();
		}
		// System.out.println("assetDetailList 개수 : "+list.size());
		mv.addObject("bankList", list);
		mv.addObject("bank_code", bank_code);

		return mv;
	}

	// 자산 코드를 신규 생성해주는 메소드
	private String assetCodeCreate(int root_idn, String trade_code) {

		// asset_code를 입력하기 위한 코드
		String uid = uniqId();
		String asset_code = null;
		String assetCode = root_idn + "";

		int cnt = assetDao.codeConOne((assetCode + "%"));

		List<AssetBean> aList = null;
		if (cnt > 0) {
			aList = assetDao.codeConList((assetCode + "%"));
		}
		if (trade_code.equals("cash")) {
			asset_code = root_idn + "cs" + uid;
		} else if (trade_code.equals("account")) {
			asset_code = root_idn + "bk" + uid;
		}

		// asset_code가 혹시 중복될 경우를 대비한 조건 문법
		boolean condit = true;
		while (condit) {
			if (aList == null)
				break;
			for (AssetBean s : aList) {
				if (asset_code.equals(s.getAsset_code())) {
					uid = uniqId();
					if (trade_code.equals("cash")) {
						asset_code = root_idn + "cs" + uid;
					} else if (trade_code.equals("account")) {
						asset_code = root_idn + "bk" + uid;
					}
					condit = true;
					break;
				} else {
					condit = false;
				}
			}
		}

		return asset_code;
	}

	// unique ID를 생성하기 위한 메서드
	private String uniqId() {
		UUID uuid = UUID.randomUUID();
		String uid = uuid.toString();
		uid = uid.replace("-", "");
		int start = (int) (Math.random() * 16);
		String uId = uid.substring(start, start + 15);
		return uId;
	}

	// headerInfo를 생성하는 메서드
	@RequestMapping(value = "header_info.do", method = RequestMethod.GET)
	public void item_list(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		int info[] = new int[3];
		// System.out.println("헤더인포");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		header_infoBean bean = null;
		int root_idn = ((Integer) session.getAttribute("root_Idn")).intValue();
<<<<<<< HEAD
		//System.out.println("AssetController - root_idn : "+root_idn);
		
=======
>>>>>>> refs/remotes/origin/master
		bean = assetDao.header_info(root_idn);
		JSONArray list = new JSONArray();
		JSONObject obj = new JSONObject();
<<<<<<< HEAD
		
		int value1 = 0;
		int value2 = 0;
		int value3 = 0;
		
		try {
			value1=bean.getTotal_amount();
			value2=bean.getAccount_amount();
			value3=bean.getCash_amount();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		list.add(value1);
		list.add(value2);
		list.add(value3);
		
		
=======

		
		int a=0;
		int b=0;
		int c=0;
		try {
			 a=bean.getTotal_amount();
			 b=bean.getAccount_amount();
			 c=bean.getCash_amount();
			
			
		} catch (Exception e) {
			System.out.println();
		}

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		
		
		list.add(a);
		list.add(b);
		list.add(c);

>>>>>>> refs/remotes/origin/master
		obj.put("list", list);

		System.out.println(obj.toString());
		response.getWriter().write(obj.toString());

	}

}
