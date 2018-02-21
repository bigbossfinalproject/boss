package boss.com.vs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import boss.com.vs.dao.BudgetDaoImpl;
import boss.com.vs.model.BudgetBean;
import boss.com.vs.model.User;

@Controller
public class BudgetController {

	@Autowired
	private BudgetDaoImpl budgetService;
	
	@RequestMapping(value ="/budget_modify")
	public ModelAndView budget_modify(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("수정");
		BudgetBean bean=new BudgetBean(); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
		String item_code=request.getParameter("item_code");
		
		bean.setBudget_code(budget_code);
		bean.setBudget_amount(budget_amount);
		bean.setItem_code(item_code);
		
		
		
		
		System.out.println("???????????");
		this.budgetService.modifyBudget(bean);
		
		response.sendRedirect("budget_list");
		
		System.out.println("budget_code = "+budget_code);
		System.out.println("item_code = "+item_code);
		
		return null;
	}
	
	
	
	@RequestMapping(value ="/budget_delete")
	public ModelAndView budget_delete(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("삭제");
		BudgetBean bean=new BudgetBean(); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		System.out.println("budget_code  = "+budget_code);
		this.budgetService.deleteBudget(budget_code);
		response.sendRedirect("budget_list");
		return null;
	}
	
	

	
	@RequestMapping(value = "/budget_list_total")
	public ModelAndView budget_list_total(HttpServletRequest request, HttpServletResponse response){
		System.out.println("Total_List");
		BudgetBean bean=null; 
		ModelAndView m = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		bean=this.budgetService.budget_list_total();
		m.addObject("list",bean);
		System.out.println("bean ="+bean.getBudget_amount_spent());
		System.out.println("bean ="+bean.getBudget_amount());
		
		
		m.setViewName("list_total");
	
		
		return m;
		
	}
	

	
	
	
	@RequestMapping(value="/write_view")
	public String write_view(Model model){
		System.out.println("write_view");
		
		return "write_view";
	}
	
	@RequestMapping(value="/practice")
	public String practice(Model model){
		System.out.println("practice");
		
		return "practice";
	}
	@RequestMapping(value = "/budget_insert", method = RequestMethod.POST)
	public void budget_insert(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		System.out.println("인서트");
		BudgetBean bean=new BudgetBean(); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//session = request.getSession();
		//String admin_id = (String) session.getAttribute("admin_id");
		
		//int root_idn=Integer.parseInt(request.getParameter("root_idn"));
		String item_code=request.getParameter("item_code");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
		
		
		//bean.setRoot_idn(root_idn);
		bean.setBudget_amount(budget_amount);
		bean.setItem_code(item_code);
		
		this.budgetService.insertBudget(bean);
		response.getWriter().write(1+"");
		
	}
	
	
	@RequestMapping(value = "/UserInsert", method = RequestMethod.POST)
	public void user_insert(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		System.out.println("인서트");
		User bean=new User(); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//session = request.getSession();
		//String admin_id = (String) session.getAttribute("admin_id");
		
		
		String userName= request.getParameter("userName");
		String userAge= request.getParameter("userAge");
		String userGender= request.getParameter("userGender");
		String userEmail= request.getParameter("userEmail");
		
		
		bean.setUserName(userName);
		bean.setUserAge(Integer.parseInt(userAge));
		bean.setUserGender(userGender);
		bean.setUserEmail(userEmail);
		
		
		this.budgetService.insertUser(bean);
	
		response.getWriter().write(1+"");
		
	
	}
	
	@RequestMapping(value="/index",method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "index";
	}

	@RequestMapping(value="/dynamicTable",method = RequestMethod.GET)
	public String dynamicTable(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "dynamicTable";
	}
	
	@RequestMapping(value="/UserSearch",method = RequestMethod.POST)
	public void userSearch(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("유저서치");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName=request.getParameter("userName");
		response.getWriter().write(getJSON(userName));
	}
	@RequestMapping(value = "/budget_list",method=RequestMethod.POST)
	public void budget_list(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(getBudget_JSON());
	}
	
	public String getBudget_JSON(){
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		List<BudgetBean> bean=null; 
		bean=this.budgetService.budget_list();
		for (int i = 0; i < bean.size(); i++) {
			result.append("[{\"value\": \""+bean.get(i).getItem_code()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount_spent()+"\"}],");	
		}
		result.append("]}");
			
		return result.toString();
	}
	
	public String getJSON(String userName){
			System.out.println("확인용1");
		if(userName==null)userName="";
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		List<User> bean=null; 
		bean=this.budgetService.user_search(userName);
		for (int i = 0; i < bean.size(); i++) {
			result.append("[{\"value\": \""+bean.get(i).getUserName()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getUserAge()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getUserGender()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getUserName()+"\"}],");
		System.out.println("젠더 확인 ="+bean.get(i).getUserGender());	
		}
		result.append("]}");
		
		
		return result.toString();
	}
	
}
