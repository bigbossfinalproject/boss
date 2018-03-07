package boss.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boss.cashbook.dao.AssetDAOImpl;
import boss.cashbook.dao.ItemDAOImpl;
import boss.cashbook.model.AssetBean;
import boss.cashbook.model.ItemBean;
import boss.user.dao.User_Dao;
import boss.user.model.User_Bean;

@Controller
public class User_Controller {
		
		@Autowired
		User_Dao dao; //dao 연결 
		
		@Autowired
		ItemDAOImpl itemDao;
		
		@Autowired
		AssetDAOImpl assetDao;
		
		//로그인 체크
		@RequestMapping(value="/userLogin.uo")
		public String userLogin(Model model, HttpServletRequest request, HttpServletResponse reponse,HttpSession session,
				@RequestParam(value="loginId", required=false, defaultValue="") String loginId, 
				@RequestParam(value="loginPwd", required=false,defaultValue="") String loginPwd) {
			
			User_Bean dto = dao.loginCheck(loginId, loginPwd);
			if(dto!=null) {
			
			session.setAttribute("root_Id", dto.getRoot_Id());
			session.setAttribute("root_Idn", dto.getRoot_Idn());
			session.setAttribute("root_Grade", dto.getRoot_Grade());  //일반회원 0 빅데이터 1			
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
		
		//id 체크
		@RequestMapping(value="/userId_Check.uo", method= RequestMethod.POST)
		public void userId_Check(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "root_Id") String root_Id) throws IOException{
			int result=dao.userId_Check(root_Id);
			response.getWriter().write(result);
		}
		
		//회원가입진행
		@RequestMapping(value="/userJoin.uo")
		public String userJoin(HttpServletRequest request,
				@RequestParam(value="root_Id") String root_Id, 
				@RequestParam(value="root_Pwd") String root_Pwd,
				@RequestParam(value="root_Name") String root_Name,				
				@RequestParam(value="root_Email") String root_Email,
				@RequestParam(value="root_Address", defaultValue="") String root_Address,
				@RequestParam(value="root_Birth", defaultValue="") String root_Birth,
				@RequestParam(value="root_Gender", defaultValue="") String root_Gender,				
				@RequestParam(value="root_Edu", defaultValue="") String root_Edu,
				@RequestParam(value="root_Marry", defaultValue="") String root_Marry,
				@RequestParam(value="root_Job", defaultValue="") String root_Job){		
			
			if(root_Birth.equals("")){ //일반 회원가입
				String root_Grade = "0"; //일반회원 등급
				dao.userJoin(root_Id, root_Pwd, root_Name ,root_Email, root_Grade);
				itemCreate(root_Id);
				assetCreate(root_Id);
				//System.out.println("userController - root_Id : "+root_Id);
				return "redirect:mainBoard.bo";
			}
			String root_Grade = "1"; //빅데이터 회원 등급
			dao.userJoin(root_Id, root_Pwd, root_Name ,root_Email, root_Grade);
			dao.bigDataJoin(root_Address, root_Birth, root_Gender, root_Edu, root_Marry, root_Job);
			
			itemCreate(root_Id);
			assetCreate(root_Id);
			
			return "redirect:mainBoard.bo";
		}
		
		
		//회원탈퇴
		@RequestMapping(value="/userDelete.uo")
		public String userDelete(HttpSession session ,@RequestParam(value="root_Idn") String root_Idn) {
			
			String root_Grade = String.valueOf(session.getAttribute("root_Grade"));
			int root_idn = Integer.parseInt(root_Idn);
			if(root_Grade.equals("0")){
				dao.userDelete(root_Idn);
				itemDao.idnDeleteItem(root_idn);
				assetDao.idnAssetDelete(root_idn);
				session.invalidate();
				return "redirect:mainBoard.bo";
			}
			dao.userDelete(root_Idn);
			dao.bigDataDelete(root_Idn);
			itemDao.idnDeleteItem(root_idn);
			assetDao.idnAssetDelete(root_idn);
			session.invalidate();
			return "redirect:mainBoard.bo";
			
		}
			
		
		//정보 수정 화면
		@RequestMapping(value="/userModify_view.uo")
		public ModelAndView userModify_view(HttpServletRequest request, HttpSession session, 
				@RequestParam(value="root_Idn")String root_Idn) {
			
			ModelAndView mv = new ModelAndView();
			User_Bean dto = dao.userModify_view(root_Idn);//일반 사용자 정보
			User_Bean dto2 = dao.userModify_view2(root_Idn);//빅데이터 정보
			
			mv.addObject("dto", dto);					
			mv.addObject("dto2", dto2);			
			mv.setViewName("user/userModify_view");
			
			return mv;
		}
		
		//정보 수정
		@RequestMapping(value="/userModify.uo")
		public ModelAndView userModify(
				@RequestParam(value="root_Idn") String root_Idn,
				@RequestParam(value="root_Pwd") String root_Pwd,
				@RequestParam(value="root_Email") String root_Email,
				@RequestParam(value="root_Address", defaultValue="") String root_Address,  //jsp 에서 일반 사용자로 가입한 경우 null 값이 넘어오는 것을 방지하기위해
				@RequestParam(value="root_Job", defaultValue="") String root_Job) {  //새로입력될 값
			
			
			ModelAndView mv = new ModelAndView();
			dao.userModify(root_Idn, root_Pwd, root_Email,  root_Address, root_Job);  //정보 수정을 위한 파라메터값 전달  
			
			
			mv.setViewName("testMain");
			return mv;
			
		}		
		//로그아웃
		@RequestMapping(value="userLogout.uo")
		public String userLogout(HttpSession session){
			session.invalidate();
			
			return "redirect:mainBoard.bo";
		}
		
		// 세부항목 계정 생성
		private void itemCreate(String root_Id){
			
			int root_idn = dao.userIdnValue(root_Id);
			System.out.println("itemCreate - root_idn : "+root_idn);
			List<ItemBean> item = itemDao.basicItemList();
			for(ItemBean i : item) {
				i.setItem_code(root_idn+i.getItem_code());
				if(i.getParent_code() == null) {
					i.setParent_code("");
				} else {
					i.setParent_code(root_idn+i.getParent_code());
				}
				i.setRoot_idn(root_idn);
				itemDao.addItem(i);
			}
		}
		
		// 자산 항목 생성
		private void assetCreate(String root_Id) {
			int root_idn = dao.userIdnValue(root_Id);
			List<AssetBean> asset = assetDao.basicAssetList();
			for(AssetBean a : asset) {
				a.setAsset_code(root_idn+a.getAsset_code());
				a.setRoot_idn(root_idn);
				a.setRoot_id(root_Id);
				assetDao.userAssetInsert(a);
			}
		}
}

