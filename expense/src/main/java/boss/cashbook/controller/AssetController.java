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
import boss.cashbook.dao.BankCorpDAOImpl;
import boss.cashbook.dao.ExpenseDAOImpl;
import boss.cashbook.dao.TradeDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.BankCorpBean;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.model.TradeBean;
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
	private ExpenseDAOImpl expenceDao;
	
	@RequestMapping(value="asset_write.do")
	public ModelAndView assetWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		
		Calendar cal = Calendar.getInstance();			// 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		
		List<TradeBean> tList = tradeDao.tradeList();
		for(int i = 0; i < tList.size(); i++) {
			if(!tList.get(i).getTrade_code().equals("cash") && !tList.get(i).getTrade_code().equals("account")) {
				tList.remove(i--);
			}
		}
		
		request.setAttribute("trade", tList);
		
		List<BankCorpBean> bList = bankCorpDao.bankList();
		request.setAttribute("bank", bList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/asset_write");
		mv.addObject("date", date);
		/*mv.addObject("trae", tList);
		mv.addObject("bank", bList);*/
		return mv;
	}
	
	@RequestMapping(value="asset_write_ok.do", method=RequestMethod.POST)
	public ModelAndView assetWriteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int root_idn = Integer.parseInt(request.getParameter("root_idn"));
		String root_id = request.getParameter("root_id");
		Date asset_date = Date.valueOf(request.getParameter("asset_date"));
		String trade_code = request.getParameter("trade_code");
		String asset_name = request.getParameter("asset_name");
		String asset_purpose = request.getParameter("asset_purpose");
		String bank_code = request.getParameter("bank_code");
		int basic_amount = Integer.parseInt(request.getParameter("basic_amount"));
		int now_amount = basic_amount;
		
		Map<String, String> info = new HashMap<String, String>();
		info.put("root_id", root_id);
		info.put("trade_code", trade_code);
		
		// asset_code를 입력하기 위한 코드
		String uid = uniqId();
		String asset_code = null;
		String assetCode = root_idn+"%";
		
		int cnt = assetDao.codeConOne(assetCode);
		
		List<AssetBean> aList = null;
		if(cnt > 0){
			aList = assetDao.codeConList(assetCode);
		}
		if(trade_code.equals("cash")) {
			asset_code = root_idn + "cs" + uid;
		} else if(trade_code.equals("account")) {
			asset_code = root_idn + "bk" + uid;
		}
		boolean condit = true;
		while(condit) {
			if(aList == null) break;
			for(AssetBean s : aList) {
				if(asset_code.equals(s.getAsset_code())) {
					uid = uniqId();
					if(trade_code.equals("cash")) {
						asset_code = root_idn + "cs" + uid;
					} else if(trade_code.equals("account")) {
						asset_code = root_idn + "bk" + uid;
					}
					condit = true;
					break;
				} else {
					condit = false;
				}
			}
		}
		
		
		AssetBean asset = new AssetBean();
		asset.setAsset_code(asset_code);
		asset.setRoot_idn(root_idn);
		asset.setRoot_id(root_id);
		asset.setAsset_date(asset_date);
		asset.setTrade_code(trade_code);
		asset.setAsset_name(asset_name);
		asset.setAsset_purpose(asset_purpose);
		asset.setBank_code(bank_code);
		asset.setBasic_amount(basic_amount);
		asset.setNow_amount(now_amount);
		
		assetDao.userAssetInsert(asset);
		
		//ModelAndView mv = new ModelAndView("expense/asset_list.do");
		response.sendRedirect("asset_list.do");
		return null;
	}
	
	@RequestMapping(value="asset_list.do", method=RequestMethod.GET)
	public ModelAndView assetList(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
		
		List<AssetBean> assetList = assetDao.memAssetList(user.getRoot_idn());
		List<BankCorpBean> bankList = bankCorpDao.bankList();
		List<TradeBean> tradeList = tradeDao.tradeList();
		List<AssetViewBean> viewList = new ArrayList<AssetViewBean>();
		
		int seq = 1;
		for(AssetBean a : assetList) {
			AssetViewBean view = new AssetViewBean();
			view.setAsset_seq(seq++);
			if(a.getRoot_idn() == user.getRoot_idn()) {
				view.setRoot_id(user.getRoot_id());
			}
			view.setRoot_idn(a.getRoot_idn());
			view.setAsset_name(a.getAsset_name());
			view.setAsset_purpose(a.getAsset_purpose());
			view.setAsset_date(a.getAsset_date());
			view.setBasic_amount(a.getBasic_amount());
			view.setNow_amount(a.getNow_amount());
			for(TradeBean t : tradeList){
				if(a.getTrade_code().equals(t.getTrade_code())) {
					view.setTrade_name(t.getTrade_name());
				}
			}
			for(BankCorpBean b : bankList) {
				if(a.getBank_code().equals(b.getBank_code())) {
					view.setBank_name(b.getBank_name());
				}
			}
			Map<String, String> assetInfo = new HashMap<String, String>();
			assetInfo.put("id", view.getRoot_id());
			assetInfo.put("startDate", view.getAsset_date().toString());
			List<ExpenseBean> expenseList = expenceDao.expenseTermList(assetInfo);
			//System.out.println("지출 내역 개수 : "+expenseList.size());
			int sum = 0;
			for(ExpenseBean e : expenseList) {
				if(a.getAsset_code().equals(e.getExpense_code())) {
					sum += e.getExpense_amount();
				}
			}
			view.setNow_amount((a.getNow_amount()-sum));
			viewList.add(view);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("expense/asset_list");
		mv.addObject("assetList", viewList);
		
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
