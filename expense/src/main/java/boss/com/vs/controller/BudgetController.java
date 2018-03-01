package boss.com.vs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		int budget_amount_spent=Integer.parseInt(request.getParameter("budget_amount_spent"));
		String item_code=request.getParameter("item_code");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
	
		System.out.println("1="+item_code);
		System.out.println("2="+budget_amount);
		System.out.println("3="+budget_code);
		System.out.println("4="+budget_amount_spent);
		
		bean.setBudget_code(budget_code);
		bean.setBudget_amount(budget_amount);
		bean.setBudget_amount_spent(budget_amount_spent);
		bean.setItem_code(item_code);
		
		this.budgetService.modifyBudget(bean);
	
		response.getWriter().write(1+"");	
		
		
		return null;
	}
	
		
	
	
	@RequestMapping(value="/write_view")
	public String write_view(Model model){
		System.out.println("jsp/budget/write_view");
		
		return "jsp/budget/write_view";
	}
	
	@RequestMapping(value="/graphy")
	public String graphy(Model model){
		System.out.println("jsp/budget/graphy");
		
		return "jsp/budget/graphy";
	}
	
	@RequestMapping(value="/practice")
	public String practice(Model model){
		System.out.println("jsp/budget/practice");
		
		return "jsp/budget/practice";
	}
	@RequestMapping(value = "/budget_insert", method = RequestMethod.POST)
	public void budget_insert(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		System.out.println("인서트");
		BudgetBean bean=new BudgetBean(); 
		response.setContentType("text/html;charset=UTF-8");
	
		String item_code=request.getParameter("item_code");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
		
		
		//bean.setRoot_idn(root_idn);
		bean.setBudget_amount(budget_amount);
		bean.setItem_code(item_code);
		int insert_check=this.budgetService.insert_check(item_code);
		if(insert_check>0){
			response.getWriter().write(1+"");	
		}else{
			this.budgetService.insertBudget(bean);
			response.getWriter().write(0+"");
		}
		
		
		System.out.println("인서트체크 ="+insert_check);
		
	}
	@RequestMapping(value ="/budget_delete")
	public void budget_delete(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("삭제");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		//String budget_code=request.getParameter("budget_code");
		
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		
		
		System.out.println("budget_code = "+budget_code);	
		System.out.println("budget_code  = "+budget_code);
		this.budgetService.deleteBudget(budget_code);
		
	}
	
	@RequestMapping(value ="/budget_copy")
	public void budget_copy(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("카피");
		response.setContentType("text/html;charset=UTF-8");
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		
		
	}
	@RequestMapping(value ="/budget_excel")
	public void budget_excel(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String budget_date= request.getParameter("date");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<BudgetBean> bean=this.budgetService.budget_excel_list();
		new poi().poiExecute(bean,response);
		
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
		return "jsp/budget/index";
	}
	@RequestMapping(value="/newList",method = RequestMethod.GET)
	public String newList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "jsp/budget/newList";
	}

	@RequestMapping(value="/dynamicTable",method = RequestMethod.GET)
	public String dynamicTable(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "jsp/budget/dynamicTable";
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
		String budget_date= request.getParameter("date");
		//budget_date="2018-02";
		System.out.println(budget_date);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(getBudget_JSON(budget_date));
		
		
		
	}
	/*@RequestMapping(value = "/budget_list_total", method = RequestMethod.GET)
	public void budget_list_total(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<BudgetBean> list=null; 
		
		list=this.budgetService.budget_total_list();
		
		JSONArray amount_list = new JSONArray();
		JSONArray amount_spent_list = new JSONArray();
		JSONArray date_list = new JSONArray();

		JSONObject obj = new JSONObject();
		
		JSONObject obj2 = new JSONObject();

		for (int i = 0; i < list.size(); i++) {
			BudgetBean bean=list.get(i);
			amount_list.add(bean.getBudget_amount());
			amount_spent_list.add(bean.getBudget_amount_spent());
			date_list.add(bean.getBudget_date());
			
		}

		obj.put("amount_list", amount_list);
		obj.put("amount_spent_list", amount_spent_list);
		
		obj.put("date_list", date_list);

		System.out.println(obj.toString());
	
		response.getWriter().write(obj.toString());
		//response.getWriter().write(getBudget_JSON());	
	}*/
	
	public String getTotal_JSON() {
	      StringBuffer str = new StringBuffer("");
	      str.append("{\"result\":[");
	      // 로그인 유지 기능을 세션으로 한다면 매개변수로 request 받아와야함.
	      int root_idn = 1;
	      List<BudgetBean> list = this.budgetService.budget_total_list();
	      for (int i = 0; i < list.size(); i++) {
	         str.append("[{\"value\": \"" + list.get(i).getBudget_amount() + "\"},");
	         str.append("{\"value\": \"" + list.get(i).getBudget_amount_spent() + "\"},");
	       
	         if (i == list.size() - 1) {

	            str.append("{\"value\": \"" + list.get(i).getBudget_date().substring(4, 6) + "\"}]");
	         } else {
	            str.append("{\"value\": \"" + list.get(i).getBudget_date().substring(4, 6) + "\"}],");
	         }
	      }
	      str.append("]}");
	    
	      System.out.println(str.toString());
	      return str.toString();
	   }
	
	@RequestMapping(value = "/budget_list_total", method = RequestMethod.GET)
	public void budget_list_total(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(getTotal_JSON());
		
	}
	@RequestMapping(value = "/item_list", method = RequestMethod.GET)
	public void item_list(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<String> list=null; 
		list=this.budgetService.item_list();
		JSONArray item_list = new JSONArray();
		JSONObject obj = new JSONObject();
		for (int i = 0; i < list.size(); i++) {
			item_list.add(list.get(i));
		}
		obj.put("item_list", item_list);
		System.out.println(obj.toString());
		response.getWriter().write(obj.toString());
	
	}
	
	
	public String getBudget_JSON(String budget_date){
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		
		List<BudgetBean> bean=null; 
		bean=this.budgetService.budget_list(budget_date);
		for (int i = 0; i < bean.size(); i++) {
			result.append("[{\"value\": \""+bean.get(i).getItem_code()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_code()+"\"},");
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
			result.append("{\"value\": \""+bean.get(i).getUserEmail()+"\"}],");
			
		}
		result.append("]}");
		
		
		return result.toString();
	}
	
}
