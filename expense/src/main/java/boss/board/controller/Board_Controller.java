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

	//게시판 목록 확인
	@RequestMapping(value="/boardList.bo")
	public ModelAndView boardList(HttpServletRequest request, HttpSession session) {
		
		String root_Grade = String.valueOf(session.getAttribute("root_Grade"));
		System.out.println("사용자 권한  :" +  root_Grade);
		
		ModelAndView mv = new ModelAndView();
		List<Board_Bean> list = dao.boardList(root_Grade);
		mv.addObject("list", list);
		
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	//글작성 뷰 
	@RequestMapping(value="/boardWrite_view.bo")
	public String boardWrite_view() {
		
		
		return "board/boardWrite_view";
	}

	//글작성
		@RequestMapping(value="/boardWrite.bo")
		public String boardWrite(HttpSession session, @RequestParam(value="root_Id")String root_Id, @RequestParam(value="bTitle")String bTitle, @RequestParam(value="bContent") String bContent) {
			
			if(root_Id.equals("Admin")) {
				dao.boardWrite(root_Id, bTitle, bContent);
				return "redirect:boardList.bo";
			}
			
			
			dao.boardWrite(root_Id, bTitle, bContent);
			
			return "redirect:boardList.bo";
		}
	
	//글보기
		@RequestMapping(value="boardContent.bo")
		public ModelAndView boardContent(HttpServletRequest request,@RequestParam(value="bId")String bId) {
			ModelAndView mv = new ModelAndView();
			Board_Bean dto = dao.boardContent(bId);
			mv.addObject("dto", dto);
			request.setAttribute("writer", dto.getRoot_Id());
			mv.setViewName("board/boardContent");
			
			return mv;
		}
		
		//글삭제
		@RequestMapping(value="/boardDelete.bo")
		public String boardDelete(@RequestParam(value="bId")String bId) {
			
			
			dao.boardDelete(bId);
			
			return "redirect:boardList.bo";
		}
		
		//글 수정
		@RequestMapping(value="/board_modify.bo")
		public String boardModify(@RequestParam(value="bId")String bId, @RequestParam(value="bTitle") String bTitle, @RequestParam(value="bContent") String bContent) {
			
			dao.boardModify(bId, bTitle, bContent);
			
			return "redirect:boardList.bo";
		}
		//답글 시 현재 게시글 정보 가져오기
		@RequestMapping(value="/board_reply_view.bo")
		public ModelAndView boardReply_view(@RequestParam(value="bId")String bId) {
			
			ModelAndView mv = new ModelAndView();
			Board_Bean dto = dao.boardReply_view(bId);
			mv.addObject("dto", dto);
			
			mv.setViewName("board/board_reply_view");
			return mv;
		}
		//답글
		@RequestMapping(value="/boardReply.bo")
		public String boardReply(@RequestParam(value="bId")String bId, 
				@RequestParam(value="bGroup")String bGroup,
				@RequestParam(value="bStep")String bStep,
				@RequestParam(value="bIndent")String bIndent,
				@RequestParam(value="root_Id")String root_Id,
				@RequestParam(value="bTitle")String bTitle,
				@RequestParam(value="bContent")String bContent) {
			
			dao.boardReply(bId, bGroup, bStep, bIndent,root_Id, bTitle, bContent);
			
			return "redirect:boardList.bo";
		}
}
