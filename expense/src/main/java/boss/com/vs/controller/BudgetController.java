package boss.com.vs.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		String budget_date=request.getParameter("budget_date");
		int budget_amount=Integer.parseInt(request.getParameter("budget_amount"));
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		
		BudgetBean bean2=new BudgetBean(); 
		bean2.setItem_code(item_code);
		bean2.setRoot_idn(rootIdn);
		bean2.setBudget_date(budget_date.substring(0,7));
		bean2.setBudget_code(budget_code);
		
		
		bean.setBudget_code(budget_code);
		bean.setBudget_amount(budget_amount);
		
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
		
	
		session = request.getSession();
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		Budget_excelBean excel_bean= new Budget_excelBean();
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

	public String getTotal_JSON(Budget_excelBean bean) {
	      StringBuffer str = new StringBuffer("");
	      str.append("{\"result\":[");
	      // 로그인 유지 기능을 세션으로 한다면 매개변수로 request 받아와야함.
	     
	      List<BudgetBean> list = this.budgetService.budget_total_list(bean);
	      List<BudgetBean> list2 = this.budgetService.budget_expense_list(bean);
	      int cnt=0;

	      for (int i = 0; i < list.size(); i++) {
	         str.append("[{\"value\": \"" + list.get(i).getBudget_amount() + "\"},");
	         
	         for (int j = 0; j < list2.size(); j++) {		
	        	 if(list.get(i).getBudget_date().equals(list2.get(j).getBudget_date())){
	        		 str.append("{\"value\": \"" + list2.get(j).getBudget_amount_spent() + "\"},");
	        		 System.out.println("중복된거 몇개임?"+list.size()+list2.size());	
	        		 System.out.println(list2.get(j).getBudget_amount_spent());
	        		 cnt++;
	        	 }
	         }
	         if(cnt==0){
	        	 str.append("{\"value\": \"" + 0 + "\"},");
	         }
	         cnt=0;
	         
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
		Budget_excelBean bean= new Budget_excelBean();
		bean.setFirstDate(request.getParameter("firstDate"));
		bean.setLastDate(request.getParameter("lastDate"));
		bean.setRoot_idn(rootIdn);
		
		System.out.println("========================");
		System.out.println(request.getParameter("firstDate"));
		System.out.println(request.getParameter("lastDate"));
		System.out.println("========================");
		
		
		response.getWriter().write(getTotal_JSON(bean));
		
	}
	@RequestMapping(value = "/item_list.bg", method = RequestMethod.GET)
	public void item_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		List<String> list=null; 
		int root_idn=(int) session.getAttribute("root_Idn");
		list=this.budgetService.item_list(root_idn);
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
		List<BudgetBean> bean3=null; 
		
		bean3=this.budgetService.budget_item_list(bean2);
		bean=this.budgetService.budget_list(bean2);
		
		int num=0;
		
		int cnt=0;

		
		int cnt2=0;
		for (int i = 0; i < bean3.size(); i++) {
				for (int j = 0; j < bean.size(); j++) {
					if(bean3.get(i).getItem_code().equals(bean.get(j).getItem_code())){
						cnt2++;
					}
				}
				if(cnt2==0){
					num+=bean3.get(i).getBudget_amount_spent();
				}
					cnt2=0;
			}

		
		for (int i = 0; i < bean.size(); i++) {
			result.append("[{\"value\": \""+bean.get(i).getItem_code()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_amount()+"\"},");
			result.append("{\"value\": \""+bean.get(i).getBudget_code()+"\"},");
			
			for (int j = 0; j < bean3.size(); j++) {
			 BudgetBean item= new BudgetBean();
			item=bean3.get(j);
			if(item.getItem_code().equals(bean.get(i).getItem_code())){
				result.append("{\"value\": \""+item.getBudget_amount_spent()+"\"},");
				
				cnt++;
					}
			}	
						if(cnt==0){
						result.append("{\"value\": \""+0+"\"},");				
						}
						
						cnt=0;
			
			
			result.append("{\"value\": \""+bean.get(i).getBudget_date().substring(0,10)+"\"}],");
			
		}
		
		result.append("[{\"value\": \"미지정예산\"},");
		result.append("{\"value\": \""+0+"\"},");
		result.append("{\"value\": \""+0+"\"},");
		result.append("{\"value\": \""+num+"\"},");
		result.append("{\"value\": \""+"2018-02-03"+"\"}],");
		
		

		

	      System.out.println("이거 값 모지? "+result.toString());
	      result.append("]}");
		return result.toString();
	}
	
}
