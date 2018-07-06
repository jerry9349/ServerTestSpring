package com.you.joo.model.dao;

import java.util.List;

import com.you.joo.model.dto.BoardDTO;

public interface BoardDAO {

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