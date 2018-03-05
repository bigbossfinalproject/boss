package boss.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boss.user.dao.User_Dao;
import boss.user.model.User_Bean;

@Controller
public class User_Controller {
		
		@Autowired
		User_Dao dao; //dao 연결 
		
		//로그인 체크
		@RequestMapping(value="/userLogin.uo")
		public String userLogin(Model model, HttpServletRequest request, HttpServletResponse reponse,HttpSession session,
				@RequestParam(value="loginId", required=false, defaultValue="") String loginId, 
				@RequestParam(value="loginPwd", required=false,defaultValue="") String loginPwd) {
			
			User_Bean dto = dao.loginCheck(loginId, loginPwd);
			if(dto!=null) {
			
			session.setAttribute("root_Id", dto.getRoot_Id());
			session.setAttribute("root_Idn", dto.getRoot_Idn());
			session.setAttribute("root_Grade", dto.getRoot_Grade());			
//			return "redirect:mainBoard.bo";
			return "testMain";
		}
			return "user/userLogin";
	}
		//회원가입 폼 제출		
		@RequestMapping(value="/userJoin_write.uo")
		public String userJoin_write() {
			return "user/userJoin_write";
		}		
		
		//회원가입진행
		@RequestMapping(value="/userJoin.uo")
		public String userJoin(HttpServletRequest request, 
				@RequestParam(value="root_Id") String root_Id, 
				@RequestParam(value="root_Pwd") String root_Pwd,
				@RequestParam(value="root_Name") String root_Name,				
				@RequestParam(value="root_Email") String root_Email,
				@RequestParam(value="root_Address", defaultValue="") String root_Address
				){		
			
			System.out.println("주소 "+root_Address);
			dao.userJoin(root_Id, root_Pwd, root_Name ,root_Email);
			
			return "redirect:mainBoard.bo";
		}
		
		
		
		//회원탈퇴
		@RequestMapping(value="/userDelete.uo")
		public String userDelete(HttpServletRequest request, @RequestParam(value="root_Id") String root_Id) {
			
			dao.userDelete(root_Id);
			
			return "redirect:userLogin.uo";
			
		}
			
		
		//정보 수정 화면
		@RequestMapping(value="/userModify_view.uo")
		public ModelAndView userModify_view(HttpServletRequest request, @RequestParam(value="root_Id")String root_Id) {
			
			System.out.println("수정 시 : id 값" + root_Id);
			ModelAndView mv = new ModelAndView();
			User_Bean dto = dao.userModify_view(root_Id);
			mv.addObject("dto", dto);
			
			mv.setViewName("user/userModify_view");
			
			return mv;
		}
		
		//정보 수정
		@RequestMapping(value="/userModify.uo")
		public ModelAndView userModify(HttpServletRequest request,
				@RequestParam(value="root_Id") String root_Id,
				@RequestParam(value="root_Pwd") String root_Pwd,
				@RequestParam(value="root_Email") String root_Email,
				@RequestParam(value="root_Job") String root_Job,
				@RequestParam(value="root_Address") String root_Address) {
			
			ModelAndView mv = new ModelAndView();
			dao.userModify(root_Id, root_Pwd, root_Email, root_Job, root_Address);
			
			
			mv.setViewName("/resources/include/header");
			return mv;
			
		}		
		//로그아웃
		@RequestMapping(value="userLogout.uo")
		public String userLogout(HttpSession session){
			session.invalidate();
			
			return "redirect:mainBoard.bo";
		}
}

