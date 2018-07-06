package com.you.joo.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.you.joo.model.dto.BoardDTO;
import com.you.joo.service.board.BoardService;

//@Controller
@RequestMapping("board/*")	//怨듯넻�쟻�씤 Mapping
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	//안드
	@RequestMapping(value="boardTest", method=RequestMethod.GET)
	@ResponseBody
	public String boardTest() {
	System.out.println("아 이걸");
		String str = "test success";
		return str;
	}
	
	//寃뚯떆�뙋 紐⑸줉
	@RequestMapping("boardlist.do")
	public ModelAndView boardlist() {
		ModelAndView mav = new ModelAndView();
		List <BoardDTO> list = boardService.boardlist();
		System.out.println(list+"�뿬湲곗뿬湲�");
		mav.setViewName("board/board_list");
		mav.addObject("boardlist",list);
		
		return mav;
	}
	
	//寃뚯떆湲��벐湲고럹�씠吏�
	@RequestMapping("boardinsertpage.do")
	public String boardinsertpage() {
		return "board/board_write";
	}
	
	//寃뚯떆湲��벐湲� action
	@RequestMapping("boardinsert.do")
	public String boardinsert(@ModelAttribute BoardDTO dto) {
		boardService.boardinsert(dto);
		return "redirect:/board/boardlist.do";
	}
	
	//寃뚯떆湲�議고쉶	
	@RequestMapping("boardview/{BOARD_NUM}")
	public ModelAndView boardview(@PathVariable int BOARD_NUM) {
		BoardDTO boarddto = new BoardDTO();
		ModelAndView mav = new ModelAndView();
		//寃뚯떆湲�議고쉶�닔利앷�
		boardService.boardCount(BOARD_NUM);
		boarddto = boardService.boardview(BOARD_NUM);
		mav.setViewName("board/board_view");
		mav.addObject("dto",boarddto);
		return mav;
	}
	
	//寃뚯떆湲��닔�젙�럹�씠吏�
	@RequestMapping("boardUpdatePage/{BOARD_NUM}")
	public ModelAndView boardUpdatePage(@PathVariable int BOARD_NUM, @ModelAttribute BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto = boardService.boardUpdatePage(BOARD_NUM);
		mav.setViewName("board/board_update");
		mav.addObject("dto",dto);
		return mav;
	}
	
	//寃뚯떆湲��닔�젙 action
	@RequestMapping("boardUpdate/{BOARD_NUM}")
	public String boardUpdate(@ModelAttribute BoardDTO dto) {
		ModelAndView mav = new ModelAndView(); 
		boardService.boardUpdate(dto);
		return "redirect:../boardview/{BOARD_NUM}";
	}
	
	//寃뚯떆湲��궘�젣 action
	@RequestMapping("boardDelete/{BOARD_NUM}")
	public String boardDelete(@PathVariable int BOARD_NUM) {
		boardService.boardDelete(BOARD_NUM);
		return "redirect:/board/boardlist.do";
	}
	
	//寃뚯떆湲��떟湲��럹�씠吏�
	@RequestMapping("boardReplyPage/{BOARD_NUM}")
	public ModelAndView boardReplyPage(@PathVariable int BOARD_NUM) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = new BoardDTO();
		dto = boardService.boardReplyPage(BOARD_NUM);
		mav.setViewName("board/board_reply");
		mav.addObject("dto",dto);
		return mav;
	}
	
	//寃뚯떆湲��떟湲� action
		@RequestMapping("boardReplyView/{BOARD_NUM}")
		public String boardReply(@PathVariable int BOARD_NUM, @ModelAttribute BoardDTO dto) {
			System.out.println("�뱾�뼱�샃�땲�떎");
			int num = boardService.boardMaxNum();
			//num += 1;
			dto.setBOARD_NUM(num);
			//dto.setBOARD_RE_REF(dto.getBOARD_RE_REF());
			boardService.boardReplyUpdate(dto);
			dto.setBOARD_RE_SEQ(dto.getBOARD_RE_SEQ()+1);
			dto.setBOARD_RE_LEV(dto.getBOARD_RE_LEV()+1);
			boardService.boardReply(dto);
			//int BOARD_NUM = dto.getBOARD_NUM();
			return "redirect:../boardview/{BOARD_NUM}";
		}
		/*//寃뚯떆湲��떟湲� action
		@RequestMapping("boardReplyView.do")
		public ModelAndView boardReply(@ModelAttribute BoardDTO dto) {
			System.out.println("�뱾�뼱�샃�땲�떎");
			ModelAndView mav = new ModelAndView();
			int num = boardService.boardMaxNum();
			//num += 1;
			dto.setBOARD_NUM(num);
			//dto.setBOARD_RE_REF(dto.getBOARD_RE_REF());
			boardService.boardReplyUpdate(dto);
			dto.setBOARD_RE_SEQ(dto.getBOARD_RE_SEQ()+1);
			dto.setBOARD_RE_LEV(dto.getBOARD_RE_LEV()+1);
			boardService.boardReply(dto);
			mav.setViewName("board/boardview/{dto.BOARD_NUM}");
			mav.addObject("dto",dto);
			return mav;
		}*/
}
