package com.you.joo.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.you.joo.model.dao.BoardDAO;
import com.you.joo.model.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	BoardDAO boarddao;
	
	@Override
	public List<BoardDTO> boardlist() {
		return boarddao.boardlist();
	}

	@Override
	public void boardinsert(BoardDTO dto) {
		boarddao.boardinsert(dto);
	}

	@Override
	public BoardDTO boardview(int num) {
		return boarddao.boardview(num);
	}

	@Override
	public void boardDelete(int num) {
		boarddao.boardDelete(num);
	}

	@Override
	public BoardDTO boardUpdatePage(int num) {
		return boarddao.boardUpdatePage(num);
	}

	@Override
	public void boardUpdate(BoardDTO dto) {
		boarddao.boardUpdate(dto);
	}

	@Override
	public BoardDTO boardReplyPage(int num) {
		return boarddao.boardReplyPage(num);
	}

	@Override
	public void boardCount(int num) {
		boarddao.boardCount(num);
	}

	@Override
	public int boardMaxNum() {
		return boarddao.boardMaxNum();
	}

	@Override
	public void boardReplyUpdate(BoardDTO dto) {
		boarddao.boardReplyUpdate(dto);
	}
	@Override
	public void boardReply(BoardDTO dto) {
		boarddao.boardReply(dto);
	}
}
