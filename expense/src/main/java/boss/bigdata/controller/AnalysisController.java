package boss.bigdata.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnalysisController {
	
	@RequestMapping("/income-analysis.do")
	public ModelAndView income_analysis(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bigdata/total_analysis/main_income_page");
        return mav;
	}
	
	@RequestMapping("/expense-analysis.do")
	public ModelAndView expense_analysis(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bigdata/total_analysis/main_expense_page");
        return mav;
	}
	
}
