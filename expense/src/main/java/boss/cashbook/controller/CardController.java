package boss.cashbook.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import boss.cashbook.dao.CardCorpDAOImpl;
import boss.cashbook.dao.CardDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.BankCorpBean;
import boss.cashbook.model.CardBean;
import boss.cashbook.model.CardCorpBean;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.service.CardViewBean;

@Controller
public class CardController {
	
	@Autowired
	private CardDAOImpl cardDao;
	
	@Autowired
	private CardCorpDAOImpl cardCorpDao;
	
	@Autowired
	private BankCorpDAOImpl bankCorpDao;
	
	@Autowired
	private AssetDAOImpl assetDao;
	
	@RequestMapping(value="card_write.do")
	public ModelAndView memCardInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
		
		List<BankCorpBean> bList = bankCorpDao.bankList();
		request.setAttribute("bankCorp", bList);
		
		List<CardCorpBean> ccList = cardCorpDao.cardCorpList();
		request.setAttribute("cardCorp", ccList);
		
		List<AssetBean> aList = assetDao.memAssetList(user.getRoot_idn());
		request.setAttribute("asset", aList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/card_write");
		
		return mv;
	}
	
	@RequestMapping(value="card_write_ok.do", method=RequestMethod.POST)
	public ModelAndView cardWriteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
		CardBean bean = new CardBean();
		
		int root_idn = Integer.parseInt(request.getParameter("root_idn"));
		String card_name = request.getParameter("card_name");
		String card_corp_code = request.getParameter("card_corp_code");
		String card_type_code = request.getParameter("card_type_code");
		String card_type_name = null;
		int card_expense_date = Integer.parseInt(request.getParameter("card_expense_date"));
		String card_use_term = request.getParameter("card_use_term");
		String bank_code = request.getParameter("bank_code");
		String asset_code = request.getParameter("asset_code");
		String root_id = request.getParameter("root_id");	
		Map<String, String> cardMap = new HashMap<String, String>();
		
		if(card_type_code.equals("checkcard")) {
			card_type_name = "체크카드";
			cardMap.put("card_type_code", card_type_code);
			cardMap.put("root_id", root_id);
		} else if (card_type_code.equals("creditcard")) {
			card_type_name = "신용카드";
			cardMap.put("card_type_code", card_type_code);
			cardMap.put("root_id", root_id);
		}
		
		// card_code를 입력하기 위한 코드
		String uid = uniqId();
		String card_code = null;
		String cardCode = root_idn+"";
		
		int cnt = cardDao.cardCount(cardMap);
		
		List<CardBean> cList = null;
		if(cnt > 0){
			cList = cardDao.cardTypeList(cardMap);
		}
		
		if(card_type_code.equals("checkcard")) {
			card_code = root_idn + "ch" + uid;
		} else if(card_type_code.equals("creditcard")) {
			card_code = root_idn + "cd" + uid;
		}
		
		boolean condit = true;
		while(condit) {
			if(cList == null) break;
			for(CardBean s : cList) {
				if(asset_code.equals(s.getAsset_code())) {
					uid = uniqId();
					if(card_type_code.equals("checkcard")) {
						card_code = root_idn + "ch" + uid;
					} else if(card_type_code.equals("creditcard")) {
						card_code = root_idn + "cd" + uid;
					}
					condit = true;
					break;
				} else {
					condit = false;
				}
			}
		}
		
		bean.setCard_code(card_code);
		bean.setRoot_idn(root_idn);
		bean.setCard_name(card_name);
		bean.setCard_corp_code(card_corp_code);
		bean.setCard_type_code(card_type_code);
		bean.setCard_type_name(card_type_name);
		bean.setCard_expense_date(card_expense_date);
		bean.setCard_use_term(card_use_term);
		bean.setBank_code(bank_code);
		bean.setAsset_code(asset_code);
		bean.setRoot_id(root_id);
		
		cardDao.cardInsert(bean);
		
		/*ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/card_list");*/
		
		response.sendRedirect("card_list.do");
		return null;
	}
	
	
	@RequestMapping(value="card_list.do")
	public ModelAndView memCardList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
		
		List<CardBean> cList = cardDao.cardList(user.getRoot_idn());
		List<CardViewBean> card = new ArrayList<CardViewBean>();
		for(CardBean c : cList) {
			CardViewBean cvb = new CardViewBean();
			cvb.setCard_name(c.getCard_name());
			cvb.setCard_type_name(c.getCard_type_name());
			cvb.setCard_expense_date(c.getCard_expense_date());
			String term = c.getCard_use_term();
			term = term.replace("말", "말일");
			term = term.replace("sdm", "전전월");
			term = term.replace("edm", "전전월");
			term = term.replace("ssm", "전월");
			term = term.replace("esm", "전월");
			term = term.replace("snm", "당월");
			term = term.replace("enm", "당월");
			term = term.replace("~", "일 ~ ");
			term += "일";
			cvb.setCard_use_term(term);
			cvb.setBank_name(bankCorpDao.bankOne(c.getBank_code()).getBank_name());
			cvb.setAccount_name(assetDao.assetCodeOne(c.getAsset_code()).getAsset_name());
			card.add(cvb);
		}
		
		request.setAttribute("cardList", card);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/card_list");
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
