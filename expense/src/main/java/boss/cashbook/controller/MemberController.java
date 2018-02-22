package boss.cashbook.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import boss.cashbook.dao.ItemAuthDAOImpl;
import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.dao.MemberDAOImpl;
import boss.cashbook.dao.TradeDAOImpl;
import boss.cashbook.model.ObjectRootBean;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAOImpl memberDao;
	
	@Autowired
	private ItemAuthDAOImpl itemAuthDao;
	
	@Autowired
	private ItemDAOImpl itemDao;
	
	@Autowired
	private TradeDAOImpl tradeDao;
	
	@Autowired
	private AssetDAOImpl assetDao;
	
	@Autowired
	private CardDAOImpl cardDao;
	
	/* 로그인 인증 체크 */
	@RequestMapping(value="/Login_ok.do", method=RequestMethod.POST)
	public ModelAndView login_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();							// 화면에 출력할 메세지를 사용하기 위해 인스턴스 생성
		String id = request.getParameter("id").trim();					// id의 인수값을 저장
		String pwd = request.getParameter("pwd").trim();			// pwd의 인수값을 저장
		session = request.getSession();
		
		
		// MemberDAOImpl에 있는 idSearch() 메서드를 호출하여 로그인 결정
		ObjectRootBean bean = this.memberDao.idSearch(id);
		
		session.setAttribute("user", bean);
		
		/*
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		session.setAttribute("date", date);
		
		// 사용자의 개인별 지출 품목 목록 가져와서 scope 영역에 올리기
		ItemAuthBean itemAuth = itemAuthDao.userItem(bean.getRoot_idn());								
		
		List<String> myItemList = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(itemAuth.getItem_list(), "|");
		while(st.hasMoreTokens()){
			myItemList.add(st.nextToken());
		}
		
		// 전체 지출 품목 목록 가져와서 scope 영역에 올리기
		List<ItemBean> itemList = itemDao.itemList();
		List<MemberItemViewBean> memItemList = new ArrayList<MemberItemViewBean>();
		
		for(String itemCode : myItemList) {
			for(ItemBean itemBean : itemList){
				if(itemCode.equals(itemBean.getItem_code()) && itemBean.getItem_code().substring(0, 1).equals("e")) {
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
		//System.out.println("지출 분류 항목의 개수 : "+tradeList.size());
		request.setAttribute("tradeList", tradeList);
		
		// 지출 분류 항목에 대한 자산 세부 목록 가져와서 scope영역에 올리기
		List<AssetBean> assetList = assetDao.assetList();
		request.setAttribute("assetList", assetList);
		
		List<CardBean> cardList = cardDao.cardList();
		request.setAttribute("cardList", cardList);*/
		
		// 저장되어 있는 비밀번호 검색
		if(bean != null) {
			if(bean.getRoot_password().equals(pwd)) {
				session.setAttribute("user", bean);
				response.sendRedirect("expense_write.do");
				//ModelAndView mv = new ModelAndView("expense/expense_write");  // expense_write.jsp 페이지로 이동
				//return mv;
				// response.sendRedirect("expense_main.do");
			} else {  // 비밀번호가 틀린 경우
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script>");
				out.println("alert('비번이 틀립니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else { // 저장된 id가 없는 경우
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('가입 회원이 아닙니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}
	
}
