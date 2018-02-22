package boss.income.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
