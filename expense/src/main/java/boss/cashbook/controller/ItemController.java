package boss.cashbook.controller;

import java.io.IOException;
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

import boss.cashbook.dao.ExpenseDAOImpl;
import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.model.ItemBean;
import boss.com.vs.dao.BudgetDaoImpl;
import boss.income.dao.IncomeDao;

@Controller
public class ItemController {
	
	@Autowired
	private ItemDAOImpl itemDao;
	
	@Autowired
	private ExpenseDAOImpl expenseDao;
	
	@Autowired
	private IncomeDao incomeDao;
	
	@Autowired
	private BudgetDaoImpl budgetDao;
	
	// ajax에서 사용하는 것으로 item을 추가하는 메소드
	@RequestMapping(value="item_modify.do", method=RequestMethod.POST)
	public ModelAndView itemModify(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		//int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		// 파라메터 value 호출 및 변수에 저장
		String item_code = request.getParameter("item_code");
		String parent_code = request.getParameter("parent_code");
		String item_name = request.getParameter("item_name");
		String item_level = request.getParameter("item_level");
		
		//String idn = rootIdn+"";
		ModelAndView mv = new ModelAndView("/expense/item_detail");
		//int seq = 0;
		if(item_code != null) {
			if(item_code.equals("new_code")) {
				//System.out.println(parent_code.substring(0, (parent_code.length()-3)));
				ItemBean item = new ItemBean();
				item.setItem_code(itemCodeCreate(parent_code.substring(0, (parent_code.length()-3))));
				item.setParent_code(parent_code);
				item.setItem_name(item_name);
				item.setItem_level(Integer.parseInt(item_level));
				//String parSub = parent_code.substring(0, (parent_code.length()-3));
				//System.out.println("parSub : "+parSub+"\tparent_code : "+parent_code);
				//int maxSeq = itemDao.maxSeq(parent_code.substring(0, (parent_code.length()-3))+"%");
				int cntSeq = itemDao.itemCount(parent_code+"%");
				int maxSeq = 0;
				if(cntSeq > 0){
					maxSeq = itemDao.maxSeq(parent_code+"%");
				}
				//System.out.println("countSeq : "+cntSeq+"\tmaxSeq : "+maxSeq);
				item.setItem_seq(maxSeq+1);
				//System.out.println(item.getItem_code()+" / "+item.getItem_name()+" / "+item.getParent_code()+" / "+item.getItem_level()+" / "+item.getItem_seq());
				itemDao.addItem(item);
			}
		}
		
		List<ItemBean> iList = itemDao.itemDetailList(parent_code.substring(0, (parent_code.length()-3))+"%");
		
		mv.addObject("itemDetailList", iList);
		
		//System.out.println("list개수 : "+iList.size());
		return mv;
	}
	
	// ajax에서 사용하는 것으로 세부항목을 삭제하는 메소드
	@RequestMapping(value="item_remove.do", method=RequestMethod.POST)
	public ModelAndView itemRemove(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		// 파라메터 value 호출 및 변수에 저장
		String itemCode = request.getParameter("item_code");
		
		String idn = rootIdn+"";
		
		Map<String, String> itemMap = new HashMap<String, String>();
		itemMap.put("item_code", itemCode.substring(6));
		
		int expenseCnt = 0;
		int incomeCnt = 0;
		int budgetCnt = 0;
		
		try {
			expenseCnt = expenseDao.itemUsedCount(itemMap);
			incomeCnt = incomeDao.incomeCodeCount(itemMap);
			budgetCnt = budgetDao.budgetItemCount(itemMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		int countResult = expenseCnt + incomeCnt + budgetCnt;
		//System.out.println("countResult : "+countResult);
		
		//response.sendRedirect("item_list.do");
		ModelAndView mv = new ModelAndView("expense/item_remove");
		itemCode = itemCode.substring(6);
		
		// 예산, 소득, 지출 항목에서 사용중인 계정이 있으면 삭제하지 못하게 하는 구문
		if(countResult == 0) {
			int seq = 0;
			if(itemCode != null) {
				//itemCode = itemCode.substring(6);
				//System.out.println("before item_code : "+item_code+"\t / after item_code : "+item_code.substring(0, (idn.length()+4)));
				
				List<ItemBean> list = itemDao.itemDetailList((itemCode.substring(0, (idn.length()+4))+"%"));
				
				// 삭제하는 코드를 삭제해주는 구문
				for(ItemBean i : list) {
					if(i.getItem_code().equals(itemCode)){
						seq = i.getItem_seq();
						itemDao.deleteItem(itemCode);
					}
				}
				if(list == null && list.size() == 0) {} else { list.remove(seq-1); }
				
				// 삭제후 item_seq를 재정의하는 구문
				for(ItemBean i : list) {
					if(i.getItem_seq() > seq){
						i.setItem_seq(seq++);
						itemDao.updateItem(i);
					};
				}
				// 분류 항목을 신규로 생성하는 코드
				
			}
		}
		
		
		
		List<ItemBean> iList = itemDao.itemDetailList((itemCode.substring(0, (idn.length()+4))+"%"));
		
		//System.out.println("itemBeanList 개수 : "+iList.size());
		
		mv.addObject("itemDetailList", iList);
		mv.addObject("countResult", countResult);
		
		return mv;
		
	}
	
	// 전체 분류 항목 목록을 가져오기 위한 메소드
	@RequestMapping(value="item_list.do")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
		
		String item_code = rootIdn + "";
		
		ModelAndView mv = new ModelAndView("expense/item_list");
		List<ItemBean> iList = itemDao.itemList(item_code+"%");
		mv.addObject("itemList", iList);
		
		return mv;
	}

	// expense_id의 중복 검사를 마친 최종 expense_id 생성 메서드
	private String itemCodeCreate(String parent_code) {
		// expense_id를 입력하기 위한 코드
		String uid = uniqId();
		String item_code = null;
		String itemCode = parent_code;
		
		item_code = itemCode + uid;
		boolean condit = true;
		int cnt = itemDao.itemCount(itemCode+"%");
		
		List<ItemBean> iList = null;
		if(cnt > 0) {
			iList = itemDao.itemDetailList((itemCode+"%"));
		}
		
		// item_code가 중복되었을 경우 다시 uuid를 생성해주는 구문
		if(iList != null) {
			for(ItemBean i : iList) {
				while(condit) {
					if(i.getItem_code().equals(item_code)) {
						uid = uniqId();
						item_code = itemCode + uid;
						condit = true;
					} else {
						condit = false;
					}
				}
			}
		}
		return item_code;
	}
	
	// unique ID를 생성하기 위한 메서드
	private String uniqId() {
		UUID uuid = UUID.randomUUID();
		String uid = uuid.toString();
		uid = uid.replace("-", "");
		int start = (int) (Math.random()*6);
		String uId = uid.substring(start, start+5);
		return uId;
	}
}
