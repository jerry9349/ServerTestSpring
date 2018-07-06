package com.you.joo.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.you.joo.model.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> boardlist();
	public void boardinsert(BoardDTO dto);
	public BoardDTO boardview(int num);
	public void boardDelete(int num);
	public BoardDTO boardUpdatePage(int num);
	public void boardUpdate(BoardDTO dto);
	public BoardDTO boardReplyPage(int num);
	public void boardCount(int num);
	public int boardMaxNum();
	public void boardReplyUpdate(BoardDTO dto);
	public void boardReply(BoardDTO dto);
}