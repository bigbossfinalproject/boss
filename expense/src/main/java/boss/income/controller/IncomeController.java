package boss.income.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import boss.income.bean.IncomeBean;
import boss.income.dao.IncomeDaoImpl;

@Controller
public class IncomeController {

	@Autowired
	private IncomeDaoImpl incomeService;

	@RequestMapping(value = "/list.io")
	public ModelAndView income_Boardlist(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		// 로그인 유지 기능을 세션으로 한다면 매개변수로 request 받아와야함.
		int root_idn = 1;
		List<IncomeBean> list = incomeService.getAllIncomeList(root_idn);

		ModelAndView mav = new ModelAndView("income/income_main");
		mav.addObject("incomeList", list);

		return mav;
	}

	@RequestMapping(value = "/list2.io", method = RequestMethod.POST)
	public void getIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(getIncome_JSON());
	}

	public String getIncome_JSON() {
		StringBuffer str = new StringBuffer("");
		str.append("{\"result\":[");
		// 로그인 유지 기능을 세션으로 한다면 매개변수로 request 받아와야함.
		int root_idn = 1;
		List<IncomeBean> list = incomeService.getAllIncomeList(root_idn);
		for (int i = 0; i < list.size(); i++) {
			str.append("[{\"value\": \"" + list.get(i).getIncome_Date() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getIncome_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getTrade_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getBank_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getIncome_Amount() + "\"},");

			if (i == list.size() - 1) {

				str.append("{\"value\": \"" + list.get(i).getIncome_Description() + "\"}]");
			} else {
				str.append("{\"value\": \"" + list.get(i).getIncome_Description() + "\"}],");
			}
		}
		str.append("]}");
		return str.toString();
	}

	/*@RequestMapping(value = "addIncomeList.io", method = RequestMethod.POST)
	public void addIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam(value=""))
			throws IOException {

	}*/
}
