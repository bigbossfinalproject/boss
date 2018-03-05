package boss.com.vs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

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

import boss.com.vs.dao.BudgetDaoImpl;
import boss.com.vs.model.BudgetBean;
import boss.com.vs.model.Budget_excelBean;

@Controller
public class BudgetController {

	@Autowired
	private BudgetDaoImpl budgetService;
	
	@RequestMapping(value ="/budget_modify.bg")
	public ModelAndView budget_modify(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("수정");
		BudgetBean bean=new BudgetBean(); 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		session = request.getSession();
		
		String item_code=request.getParameter("item_code");
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		int budget_amount_spent=Integer.parseInt(request.getParameter("budget_amount_spent"));
		String budget_date=request.getParameter("budget_date");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		
		BudgetBean bean2=new BudgetBean(); 
		bean2.setItem_code(item_code);
		bean2.setRoot_idn(rootIdn);
		bean2.setBudget_date(budget_date.substring(0,7));
		bean2.setBudget_code(budget_code);
		
		System.out.println("=============");
		System.out.println(item_code);
		System.out.println(rootIdn);
		System.out.println(budget_date);
		System.out.println(budget_code);
		System.out.println("=============");
		
		bean.setBudget_code(budget_code);
		bean.setBudget_amount(budget_amount);
		bean.setBudget_amount_spent(budget_amount_spent);
		bean.setBudget_date(budget_date);
		
		int modify_check=0;
		
		modify_check=this.budgetService.modify_check(bean2);
		System.out.println("중복수 ="+modify_check);
		
		
		
		if(modify_check>0){
			response.getWriter().write(1+"");	
		}else{
			this.budgetService.modifyBudget(bean);
			response.getWriter().write(0+"");
		}
	
		return null;
	}
	
	
	@RequestMapping(value = "/budget_insert.bg", method = RequestMethod.POST)
	public void budget_insert(HttpServletRequest request, HttpServletResponse response, HttpSession session
			) throws Exception{
		System.out.println("인서트");
		
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		String budget_date=request.getParameter("budget_date");
		String item_code=request.getParameter("item_code");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));		
		
		
		BudgetBean bean2=new BudgetBean(); 
		bean2.setItem_code(item_code);
		bean2.setRoot_idn(rootIdn);
		bean2.setBudget_date(budget_date.substring(0,7));
		
		
		BudgetBean bean=new BudgetBean(); 
		bean.setBudget_amount(budget_amount);
		bean.setItem_code(item_code);
		bean.setRoot_idn(rootIdn);
		bean.setBudget_date(budget_date);
		
		
		int insert_check=this.budgetService.insert_check(bean2);
		
		if(insert_check>0){
			response.getWriter().write(1+"");	
		}else{
			this.budgetService.insertBudget(bean);
			response.getWriter().write(0+"");
		}
			
	}
	@RequestMapping(value ="/budget_delete.bg")
	public void budget_delete(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("삭제");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
	
		this.budgetService.deleteBudget(budget_code);
		
	}
	
	@RequestMapping(value ="/budget_copy.bg")
	public void budget_copy(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("카피");
		response.setContentType("text/html;charset=UTF-8");
		int budget_code=Integer.parseInt(request.getParameter("budget_code"));
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		
	}
	@RequestMapping(value ="/budget_excel.bg")
	public void budget_excel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		Budget_excelBean excel_bean= new Budget_excelBean();
		
	
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		excel_bean.setFirstDate(request.getParameter("firstDate"));
		excel_bean.setLastDate(request.getParameter("lastDate"));
		excel_bean.setRoot_idn(rootIdn);
		
	
		System.out.println("퍼스트 "+request.getParameter("firstDate"));
		System.out.println("라스트 "+ request.getParameter("lastDate"));
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<BudgetBean> bean=this.budgetService.budget_excel_list(excel_bean);
		new poi().poiExecute(bean,response);
		
		
		
	}
	
	@RequestMapping(value ="/budget_excel_import.xls.bg")
	public void budget_excel_import(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
	 poiImport poi=new poiImport();
	
		
	}
		
	
	
	@RequestMapping(value="/budget_page.bg",method = RequestMethod.GET)
	public String newList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("newList");
		return "budget/budget_page";
	}

	@RequestMapping(value = "/budget_list.bg",method=RequestMethod.POST)
	public void budget_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("zzzzzzzzzzzzzzzzzzzzzz");
		
		String budget_date= request.getParameter("date");
		System.out.println("budget_date ="+budget_date);
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		BudgetBean bean=new BudgetBean();
		
		
		bean.setBudget_date(budget_date);
		bean.setRoot_idn(rootIdn);
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		response.getWriter().write(getBudget_JSON(bean));
		
		
		
	}

	public String getTotal_JSON(int rootIdn) {
	      StringBuffer str = new StringBuffer("");
	      str.append("{\"result\":[");
	      // 로그인 유지 기능을 세션으로 한다면 매개변수로 request 받아와야함.
	     
	      List<BudgetBean> list = this.budgetService.budget_total_list(rootIdn);
	      for (int i = 0; i < list.size(); i++) {
	         str.append("[{\"value\": \"" + list.get(i).getBudget_amount() + "\"},");
	         str.append("{\"value\": \"" + list.get(i).getBudget_amount_spent() + "\"},");
	       
	         if (i == list.size() - 1) {

	            str.append("{\"value\": \"" + list.get(i).getBudget_date().substring(0, 7) + "\"}]");
	         } else {
	            str.append("{\"value\": \"" + list.get(i).getBudget_date().substring(0, 7) + "\"}],");
	         }
	      }
	      str.append("]}");
	    
	      System.out.println(str.toString());
	      return str.toString();
	   }
	
	@RequestMapping(value = "/budget_list_total.bg", method = RequestMethod.GET)
	public void budget_list_total(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();

		response.getWriter().write(getTotal_JSON(rootIdn));
		
	}
	@RequestMapping(value = "/item_list.bg", method = RequestMethod.GET)
	public void item_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
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
		
		response.getWriter().write(obj.toString());
	
	}
	
	public String getBudget_JSON(BudgetBean bean2){
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		
		List<BudgetBean> bean=null; 
		bean=this.budgetService.budget_list(bean2);
		for (int i = 0; i < bean.size(); i++) {
			result.append("[{\"value\": \""+bean.get(i).getItem_code()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_code()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount_spent()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_date().substring(0,10)+"\"}],");
			
		}
		
		result.append("]}");
		


	      System.out.println("이거 값 모지? "+result.toString());
		return result.toString();
	}
	
}
