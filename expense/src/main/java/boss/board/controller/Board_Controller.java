package boss.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boss.board.dao.Board_Dao;
import boss.board.model.Board_Bean;

@Controller
public class Board_Controller {

	@Autowired
	private Board_Dao dao;
	//home
	@RequestMapping(value="testMain.bo")
	public String testMain(){
		
		
		return "testMain";
	}
	
	
	//메인화면(notice + communite + login + join) 
	@RequestMapping(value="/mainBoard.bo")
	public ModelAndView notice(HttpSession session, HttpServletRequest request){
		
		request.setAttribute("loginId", "");  //초기 로그인 id 파라메터값 null 생성		
		session.getAttribute("root_Id");//로그인 이후 저장된 session 값 받아오기
		
		ModelAndView mv = new ModelAndView();
		
		
		if(session.getAttribute("root_Id")!=null){ //브라우저 미종료 시 index 접속으로 인해 index 가 접근되는것을 방지
			mv.setViewName("testMain");
			return mv;
		}
		
		
		List<Board_Bean> list = dao.noticeList(); //공지사항 리스트
		List<Board_Bean> list2 = dao.boardList(); //일반 게시판 리스트
		
		String noticeSize =String.valueOf(list.size()); //각 게시물 사이즈
		String communiteSize = String.valueOf(list2.size());
		
		mv.addObject("list", list);  
		mv.addObject("list2", list2); 
		mv.addObject("loginId"); // jsp 에 "" 전달
		mv.addObject("root_Id"); //jsp 에 세션 값 전달
		mv.addObject("noticeSize", noticeSize);//게시물 수량 반환
		mv.addObject("communiteSize", communiteSize);
		
		mv.setViewName("board/mainBoard");
		return mv;
	}
	//읽기 전용(notice) - 비 로그인
	@RequestMapping(value="noticeBoard_view.bo")
	public ModelAndView noticeBoard_view(@RequestParam(value="bId")String bId){
		ModelAndView mv = new ModelAndView();
		Board_Bean dto = dao.noticeBoard_view(bId);
		mv.addObject("dto", dto);
		mv.setViewName("board/noticeBoard_view");
		
		
		return mv;
	}
	
	//글 목록(notice)
	@RequestMapping(value="/noticeBoard.bo")
	public ModelAndView noticeList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
			List<Board_Bean> list = dao.noticeList();
			String noticeSize =String.valueOf(list.size());
			mv.addObject("list", list);		
			mv.addObject("noticeSize", noticeSize);
			mv.setViewName("board/noticeBoard");	
			return mv;
	}
	//글 목록(communite)
		@RequestMapping(value="/communiteBoard.bo")
		public ModelAndView boardList(HttpServletRequest request, HttpSession session	) {
			ModelAndView mv = new ModelAndView();
			List<Board_Bean> list = dao.boardList();		
			String communiteSize =String.valueOf(list.size());
			mv.addObject("list", list);		
			mv.addObject("communiteSize", communiteSize);
			mv.setViewName("board/communiteBoard");	
			return mv;
		}
	
	//글 내용(notice)
	@RequestMapping(value="noticeBoard_content.bo")
	public ModelAndView noticeContent(@RequestParam(value="bId")String bId){
		ModelAndView mv = new ModelAndView();
		Board_Bean dto = dao.noticeContent(bId);
		mv.addObject("dto", dto);
		mv.setViewName("board/noticeBoard_content");		
		return mv;		
	}
		
	//글 내용(communite)
	@RequestMapping(value="communiteBoard_content.bo")
	public ModelAndView boardContent(HttpServletRequest request,@RequestParam(value="bId")String bId) {
		ModelAndView mv = new ModelAndView();
		Board_Bean dto = dao.boardContent(bId);
		mv.addObject("dto", dto);		
		request.setAttribute("writer", dto.getRoot_Id());//글쓴이만 삭제 가능하도록		
		mv.setViewName("board/communiteBoard_content");		
		return mv;
	}
	
	//글작성 뷰(notice) 
	@RequestMapping(value="/noticeBoard_Write_view.bo")
	public String noticeWrite_view() {		
		
		return "board/noticeBoard_Write_view";
	}
	//글작성 뷰(communite) 
	@RequestMapping(value="/communiteBoard_Write_view.bo")
	public String boardWrite_view() {
		
		
		return "board/communiteBoard_Write_view";
	}
	
	//글작성(notice)
	@RequestMapping(value="noticeBoard_Write.bo")
	public String noticeWrite(@RequestParam(value="root_Id")String root_Id,
			@RequestParam(value="bTitle")String bTitle,
			@RequestParam(value="bContent")String bContent){
		
		dao.noticeWrite(root_Id, bTitle, bContent);
		return "redirect:noticeBoard.bo";
	}

	//글작성(communite)
		@RequestMapping(value="/communiteBoard_Write.bo")
		public String boardWrite(@RequestParam(value="root_Id")String root_Id,
				@RequestParam(value="bTitle")String bTitle,
				@RequestParam(value="bContent")String bContent){
					
			dao.boardWrite(root_Id, bTitle, bContent);			
			return "redirect:communiteBoard.bo";
		}
	//게시판 글 삭제(notice)
		@RequestMapping(value="/noticeBoard_delete.bo")
		public String noticeDelete(@RequestParam(value="bId")String bId) {
				dao.noticeDelete(bId);
					
		return "redirect:noticeBoard.bo";
		}
		
		//게시판 글 삭제(communite)
		@RequestMapping(value="/communiteBoard_delete.bo")
		public String boardDelete(@RequestParam(value="bId")String bId) {
				dao.boardDelete(bId);
			
			return "redirect:communiteBoard.bo";
		}
		//글 수정(notice)
				@RequestMapping(value="/noticeBoard_modify.bo")
				public String noticeModify(@RequestParam(value="bId")String bId, @RequestParam(value="bTitle") String bTitle, @RequestParam(value="bContent") String bContent) {
					
					dao.noticeModify(bId, bTitle, bContent);
					
					return "redirect:noticeBoard.bo";
				}		
		//글 수정(communite)
		@RequestMapping(value="/communiteBoard_modify.bo")
		public String boardModify(@RequestParam(value="bId")String bId, @RequestParam(value="bTitle") String bTitle, @RequestParam(value="bContent") String bContent) {
			
			dao.boardModify(bId, bTitle, bContent);
			
			return "redirect:communiteBoard.bo";
		}
		//답글(notice 선택 글 정보 가져오기)
		@RequestMapping(value="/noticeBoard_reply_view.bo")
		public ModelAndView noticeReply_view(@RequestParam(value="bId")String bId) {
			
			ModelAndView mv = new ModelAndView();
			Board_Bean dto = dao.noticeReply_view(bId);
			mv.addObject("dto", dto);
			
			mv.setViewName("board/noticeBoard_reply_view");
			return mv;
		}
		//답글(communite 선택 글 정보 가져오기)
		@RequestMapping(value="/communiteBoard_reply_view.bo")
		public ModelAndView communiteReply_view(@RequestParam(value="bId")String bId) {
			
			ModelAndView mv = new ModelAndView();
			Board_Bean dto = dao.boardReply_view(bId);
			mv.addObject("dto", dto);
			
			mv.setViewName("board/communiteBoard_reply_view");
			return mv;
		}
		//답글(notice)
		@RequestMapping(value="/noticeBoard_reply.bo")
		public String noticeReply(@RequestParam(value="bId")String bId, 
				@RequestParam(value="bGroup")String bGroup,
				@RequestParam(value="bStep")String bStep,
				@RequestParam(value="bIndent")String bIndent,
				@RequestParam(value="root_Id")String root_Id,
				@RequestParam(value="bTitle")String bTitle,
				@RequestParam(value="bContent")String bContent) {			
			dao.noticeReply(bId, bGroup, bStep, bIndent,root_Id, bTitle, bContent);
			
			return "redirect:noticeBoard.bo";
		}
		//답글(communite)
				@RequestMapping(value="/communiteBoard_reply.bo")
				public String boardReply(@RequestParam(value="bId")String bId, 
						@RequestParam(value="bGroup")String bGroup,
						@RequestParam(value="bStep")String bStep,
						@RequestParam(value="bIndent")String bIndent,
						@RequestParam(value="root_Id")String root_Id,
						@RequestParam(value="bTitle")String bTitle,
						@RequestParam(value="bContent")String bContent) {			
					dao.boardReply(bId, bGroup, bStep, bIndent,root_Id, bTitle, bContent);
					
					return "redirect:communiteBoard.bo";
				}
		
}
