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
				@RequestParam(value="root_Id", required=false, defaultValue="") String root_Id, 
				@RequestParam(value="root_Pwd", required=false,defaultValue="") String root_Pwd) {
			
			System.out.println("id" + root_Id);
			System.out.println("pwd" + root_Pwd);
			User_Bean dto = dao.loginCheck(root_Id, root_Pwd);
			
			if(dto!=null) {
			session.setAttribute("root_Id", dto.getRoot_Id());
			session.setAttribute("root_Idn", dto.getRoot_Idn());
			session.setAttribute("root_Grade", dto.getRoot_Grade());
			return "redirect:item_list.do";
			
		}
/*		int loginCheck = dao.loginCheck(root_Id, root_Pwd); //파라메터 2개 전달 가능
		
		if(loginCheck==1) {
			model.addAttribute("loginCheck", loginCheck);
			model.addAttribute("root_Id", root_Id);
			return "include/header";
			
		}*/
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
				@RequestParam(value="root_Gender") String root_Gender,
				@RequestParam(value="root_Email") String root_Email,
				@RequestParam(value="root_Birth") String root_Birth,
				@RequestParam(value="root_Job") String root_Job,
				@RequestParam(value="root_Address") String root_Address){		
		
			
			dao.userJoin(root_Id, root_Pwd, root_Name ,root_Gender ,root_Email ,root_Birth ,root_Job , root_Address);
			
			
			
			return "redirect:userLogin.uo";
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
}

