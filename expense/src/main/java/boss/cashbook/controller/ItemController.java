package boss.cashbook.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.model.ExpenseBean;
import boss.cashbook.model.ItemBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.service.ItemViewBean;

@Controller
public class ItemController {
	
	@Autowired
	private ItemDAOImpl itemDao;
	/*
	@RequestMapping(value="item_write.do")
	public ModelAndView itemWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		String item_code = user.getRoot_idn() + "%";
		
		// 분류 항목을 가져와서 Attribute로 보내기
		List<ItemBean> iList = itemDao.itemList(item_code);
		List<ItemBean> highList = new ArrayList<ItemBean>();
		List<ItemBean> midList = new ArrayList<ItemBean>();
		List<ItemBean> lowList = new ArrayList<ItemBean>();
		
		for(ItemBean i : iList) {
			if(i.getItem_level() == 1) {
				highList.add(i);
			} else if(i.getItem_level() == 2) {
				midList.add(i);
			} else if(i.getItem_level() == 3) {
				lowList.add(i);
			}
		}
		
		request.setAttribute("highList", highList);
		request.setAttribute("midList", midList);
		request.setAttribute("lowList", lowList);
		
		ModelAndView mv = new ModelAndView("expense/item_write");
		
		return mv;
	}
	
	@RequestMapping(value="item_write_ok.do", method=RequestMethod.POST)
	public ModelAndView itemAdd(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		String highItem = request.getParameter("high_item");
		String midItem = request.getParameter("mid_item");
		String lowName = request.getParameter("low_name");
		String itemHead = null;
		String itemCode = null;
		int userLeng = 0;
		if(user.getRoot_idn() < 10) {
			userLeng = 1;
		} else if(user.getRoot_idn() < 100) {
			userLeng = 2;
		} else {
			userLeng = 3;
		}
		
		itemHead = midItem.substring(0, (userLeng+4));
		
		String item_code = itemHead + "%";
		
		int seq = 1;
		int cnt = itemDao.itemCount(item_code);
		
		if(cnt > 0) {
			seq = itemDao.maxSeq(item_code)+1;
		}
		
		
		if(seq < 10) {
			itemCode = itemHead+"00"+seq;
		} else if(seq < 100) {
			itemCode = itemHead+"0"+seq;
		} else {
			itemCode = itemHead+seq;
		}
		//System.out.println("item_code : "+itemCode);
		ItemBean item = new ItemBean();
		item.setItem_code(itemCode);
		item.setParent_code(midItem);
		item.setItem_level(3);
		item.setItem_name(lowName);
		item.setItem_seq(seq);
		
		itemDao.addItem(item);
		
		response.sendRedirect("item_list.do");
		return null;
	}
	*/
	/*
	private String item_code;			// 아이템 코드
	private String parent_code;		// 부모 코드			
	private int item_level;				// 아이템 레벨
	private String item_name;		// 아이템 이름
	private int item_seq;				// 아이템 순번
	*/
	
	@RequestMapping(value="item_modify.do", method=RequestMethod.POST)
	public ModelAndView itemModify(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		// 파라메터 value 호출 및 변수에 저장
		String item_code = request.getParameter("item_code");
		String parent_code = request.getParameter("parent_code");
		String item_name = request.getParameter("item_name");
		String item_level = request.getParameter("item_level");
		
		String idn = user.getRoot_idn()+"";
		ModelAndView mv = new ModelAndView("/expense/item_detail");
		int seq = 0;
		if(item_code != null) {
			if(item_code.equals("new_code")) {
				//System.out.println(parent_code.substring(0, (parent_code.length()-3)));
				ItemBean item = new ItemBean();
				item.setItem_code(itemCodeCreate(parent_code.substring(0, (parent_code.length()-3))));
				item.setParent_code(parent_code);
				item.setItem_name(item_name);
				item.setItem_level(Integer.parseInt(item_level));
				String parSub = parent_code.substring(0, (parent_code.length()-3));
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
	@RequestMapping(value="item_remove.do", method=RequestMethod.POST)
	public ModelAndView itemRemove(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		// 파라메터 value 호출 및 변수에 저장
		String item_code = request.getParameter("item_code");
		
		String idn = user.getRoot_idn()+"";
		
		int seq = 0;
		if(item_code != null) {
			item_code = item_code.substring(6);
			//System.out.println("before item_code : "+item_code+"\t / after item_code : "+item_code.substring(0, (idn.length()+4)));
			List<ItemBean> list = itemDao.itemDetailList((item_code.substring(0, (idn.length()+4))+"%"));
			
			// 삭제하는 코드를 삭제해주는 구문
			for(ItemBean i : list) {
				if(i.getItem_code().equals(item_code)){
					seq = i.getItem_seq();
					itemDao.deleteItem(item_code);
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
		//response.sendRedirect("item_list.do");
		ModelAndView mv = new ModelAndView("expense/item_detail");
		
		List<ItemBean> iList = itemDao.itemDetailList((item_code.substring(0, (idn.length()+4))+"%"));
		
		mv.addObject("itemDetailList", iList);
		return mv;
	}
	
	// 전체 분류 항목 목록을 가져오기 위한 메소드
	@RequestMapping(value="item_list.do")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		String item_code = user.getRoot_idn() + "";
		
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
