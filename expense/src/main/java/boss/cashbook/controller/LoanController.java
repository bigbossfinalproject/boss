package boss.cashbook.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
import boss.cashbook.dao.CapitalCorpDAOImpl;
import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.dao.LoanDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.CapitalCorpBean;
import boss.cashbook.model.ItemBean;
import boss.cashbook.model.LoanBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.service.LoanViewBean;

@Controller
public class LoanController {
	
	@Autowired
	private LoanDAOImpl loanDao;
	
	@Autowired
	private ItemDAOImpl itemDao;
	
	@Autowired
	private AssetDAOImpl assetDao;
	
	@Autowired
	private CapitalCorpDAOImpl capitalCorpDao;
	
	@RequestMapping(value="loan_write.do")
	public ModelAndView loanWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		Calendar cal = Calendar.getInstance();			// 오늘 날짜 호출
		Date d = new Date(cal.getTimeInMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		
		// 분류 항목 정보 가져오기
		String item_code = rootIdn+"l001";
		int icnt = itemDao.itemCount((item_code+"%"));
		List<ItemBean> iList = null;
		if(icnt > 0) {
			iList = itemDao.detailItemList((item_code+"%"));
		}
		
		// 자산 목록 정보 가져오기
		String asset_code = rootIdn + "bk";
		List<AssetBean> aList = assetDao.codeConList((asset_code+"%"));
		
		// 대출 금융사 목록 정보 가져오기
		List<CapitalCorpBean> cList = capitalCorpDao.capitalList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/loan_write");
		mv.addObject("date", today);
		mv.addObject("iList", iList);
		mv.addObject("aList", aList);
		mv.addObject("cList", cList);
		return mv;
	}
	
	// 대출 정보를 받아와서 DB에 입력
	@RequestMapping(value="loan_write_ok.do", method=RequestMethod.POST)
	public ModelAndView loanInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		String item_code = request.getParameter("item_code");
		int root_idn = Integer.parseInt(request.getParameter("root_idn"));
		String root_id = request.getParameter("root_id");
		Date loan_date = Date.valueOf(request.getParameter("loan_date"));
		String loan_name = request.getParameter("loan_name");
		String loan_purpose = request.getParameter("loan_purpose");
		Date loan_begin_date = Date.valueOf(request.getParameter("loan_begin_date"));
		int loan_expense_date = Integer.parseInt(request.getParameter("loan_expense_date"));
		String asset_code = request.getParameter("asset_code");
		String capital_code = request.getParameter("capital_code");
		int loan_term = Integer.parseInt(request.getParameter("loan_term"));
		double loan_rate = Double.parseDouble(request.getParameter("loan_rate"));
		String loan_mean_code = request.getParameter("loan_mean_code");
		int loan_amount = Integer.parseInt(request.getParameter("loan_amount"));
		
		// 품목 분류코드가 null인 경우 정보 입력하기
		
		
		// loan_code를 입력하기 위한 코드
		String uid = uniqId();
		String loan_code = null;
		String loanCode = root_idn+"lo";
		
		int cnt = loanDao.userLoanCount((loanCode+"%"));
		
		List<LoanBean> lcList = null;
		if(cnt > 0){
			lcList = loanDao.userLoanList((loanCode+"%"));
			System.out.println("loanCode 저장개수 : "+lcList.size());
		}
		loan_code = loanCode + uid;
		boolean condit = true;
		while(condit) {
			for(LoanBean s : lcList) {
				if(loan_code.equals(s.getLoan_code())) {
					uid = uniqId();
					loan_code = loanCode + uid;
					condit = true;
					break;
				} else {
					condit = false;
				}
			}
		}
		
		
		// 대출 종료일을 입력하기 위한 코드
		int year = loan_term / 12;
		int month = loan_term % 12;
		Calendar cal = Calendar.getInstance();
		cal.setTime(loan_begin_date);
		
		if(loan_begin_date.getDate() > loan_expense_date){
			if(loan_begin_date.getMonth() < 12) {
				cal.add(Calendar.YEAR, year);	
			} else {
				cal.add(Calendar.YEAR, year+1);
			}
			cal.add(Calendar.MONTH, (month));
		} else {
			cal.add(Calendar.MONTH, month-1);
		}
		cal.set(Calendar.DATE, loan_expense_date);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(cal.getTime());
		
		Date loan_end_date = Date.valueOf(date);
		
		String loan_mean = null;			// 대출금 상환 방식 이름을 입력하기 위한 변수
		
		/* 원리금 균등상환 방식
		매월상환액 = A*b*(1+b)^n / (1+b)^n-1
		A : 대출원금 , b : 대출이자율(연이자율/12) , n : 상환기간(실제상환개월수)
		상환이자 = 대출잔액 * 대출이자율 */
		// 대출금 상환방식을 계산하기 위한 코드
		int amount = loan_amount;						// 대출원금
		double rate = (loan_rate/100) / 12;			// 이율
		int term = loan_term;								// 상환기간
		int pandi_calc = (int) (Math.floor(amount * rate * Math.pow((1+rate), term) / (Math.pow((1+rate), term) - 1) / 10) * 10);		// 원리금균등상환 금액
		int princ_calc = (int) (Math.floor((amount / term) / 10) * 10);			// 원금 균등 상환 금액
		int left_amt = amount;				// 대출잔액
		int principal = 0;						// 상환원금
		int interest = 0;							// 상환이자
		
		StringBuffer sb_p = new StringBuffer();
		StringBuffer sb_i = new StringBuffer();
		
		for(int i = 1; i <= loan_term; i++) {
			interest =  (int) (Math.round((left_amt * rate)/10)*10);							// 대출 잔액에 대한 이자
			if(loan_mean_code.equals("pandi")) {
				loan_mean = "원리금균등상환";
				if(i < loan_term){
					principal = pandi_calc - interest;													// 상환금액에서 대출이자를 뺀 대출 원금
				} else {
					principal = left_amt;																	// 마지막 달에 남은 대출 원금
				}
			} else if(loan_mean_code.equals("princ")) {
				loan_mean = "원금균등상환";
				if(i < loan_term) {
					principal = princ_calc;																	// 상환금액에서 대출이자를 뺀 대출 원금
				} else {
					principal = left_amt;																	// 마지막 달에 남은 대출 원금
				}
			} else if(loan_mean_code.equals("expir")) {
				loan_mean = "만기일시상환";
			}
			left_amt -= principal;																			// 대출 잔액에서 대출 원금을 뺀 대출 잔액
			
			sb_p.append(principal).append("|");
			sb_i.append(interest).append("|");
		}
		String loan_principal = sb_p.toString();
		String loan_interest = sb_i.toString();
		
		LoanBean loan = new LoanBean();
		loan.setLoan_code(loan_code);
		loan.setItem_code(item_code);
		loan.setRoot_idn(root_idn);
		loan.setRoot_id(root_id);
		loan.setLoan_date(loan_date);
		loan.setLoan_name(loan_name);
		loan.setLoan_purpose(loan_purpose);
		loan.setLoan_begin_date(loan_begin_date);
		loan.setLoan_expense_date(loan_expense_date);
		loan.setLoan_end_date(loan_end_date);
		loan.setAsset_code(asset_code);
		loan.setCapital_code(capital_code);
		loan.setLoan_term(loan_term);
		loan.setLoan_rate(loan_rate);
		loan.setLoan_mean_code(loan_mean_code);
		loan.setLoan_mean(loan_mean);
		loan.setLoan_amount(loan_amount);
		loan.setLoan_principal(loan_principal);
		loan.setLoan_interest(loan_interest);
		
		loanDao.loanAdd(loan);
		
		response.sendRedirect("loan_list.do");
		return null;
	}
	
	@RequestMapping(value="loan_list.do")
	public ModelAndView loanList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		String loanCode = rootIdn+"lo";
		List<LoanBean> lList = loanDao.userLoanList((loanCode+"%"));
		List<LoanViewBean> lvList = new ArrayList<LoanViewBean>();
		
		for(LoanBean l : lList) {
			LoanViewBean lvb = new LoanViewBean();
			lvb.setItem_name(itemDao.itemOne(l.getItem_code()).getItem_name());
			lvb.setLoan_name(l.getLoan_name());
			lvb.setLoan_purpose(l.getLoan_purpose());
			lvb.setLoan_begin_date(l.getLoan_begin_date());
			lvb.setLoan_term(l.getLoan_term());
			lvb.setLoan_end_date(l.getLoan_end_date());
			lvb.setCapital_name(capitalCorpDao.capitalOne(l.getCapital_code()).getCapital_name());
			lvb.setLoan_mean(l.getLoan_mean());
			lvb.setLoan_amount(l.getLoan_amount());
			lvb.setLoan_rate(l.getLoan_rate());
			lvb.setLoan_interest_date(l.getLoan_expense_date());
			lvb.setAsset_name(assetDao.codeAssetOne(l.getAsset_code()).getAsset_name());
			
			lvList.add(lvb);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("expense/loan_list");
		mv.addObject("lvList", lvList);
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
