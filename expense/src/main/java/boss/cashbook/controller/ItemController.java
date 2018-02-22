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
import boss.cashbook.model.ItemBean;
import boss.cashbook.model.ObjectRootBean;
import boss.cashbook.service.ItemViewBean;

@Controller
public class ItemController {
	
	@Autowired
	private ItemDAOImpl itemDao;
	
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
	
	/*
	private String item_code;			// 아이템 코드
	private String parent_code;		// 부모 코드			
	private int item_level;				// 아이템 레벨
	private String item_name;		// 아이템 이름
	private int item_seq;				// 아이템 순번
	*/
	
	@RequestMapping(value="item_list.do")
	public ModelAndView itemList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
		ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
		
		String item_code = user.getRoot_idn() + "%";
		
		List<ItemBean> list = itemDao.itemList(item_code);
		List<ItemViewBean> ivList = new ArrayList<ItemViewBean>();
		int seq = 1;
		for(ItemBean i : list) {
			ItemViewBean ivb = new ItemViewBean();
			ivb.setSeq(seq++);
			/*if(i.getItem_level() == 1) {
				ivb.setHigh_item(i.getItem_name());
				ivb.setMid_item("-");
				ivb.setLow_item("-");
			} else */if(i.getItem_level() == 2) {
				for(ItemBean i2 : list) {
					if(i.getParent_code().equals(i2.getItem_code())) {
						ivb.setHigh_item(i2.getItem_name());
					}
				}
				ivb.setMid_item(i.getItem_name());
				ivb.setLow_item("-");
			} else if(i.getItem_level() == 3) {
				for(ItemBean i2 : list) {
					if(i.getParent_code().equals(i2.getItem_code())) {
						ivb.setMid_item(i.getItem_name());
						for(ItemBean i3 : list) {
							if(i2.getParent_code().equals(i3.getItem_code())){
								ivb.setHigh_item(i3.getItem_name());
							}
						}
					}
				}
				ivb.setLow_item(i.getItem_name());
			}
			if(ivb.getHigh_item() != null) {
				ivList.add(ivb);
			} else {
				seq--;
			}
		}
		
		ModelAndView mv = new ModelAndView("expense/item_list");
		mv.addObject("ivList", ivList);
		
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
