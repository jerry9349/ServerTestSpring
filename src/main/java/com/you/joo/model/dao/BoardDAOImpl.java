package com.you.joo.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.you.joo.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> boardlist() {
		return sqlSession.selectList("board.selectList");
	}
	@Override
	public void boardinsert(BoardDTO dto) {
		sqlSession.insert("board.boardinsert",dto);
	}
	@Override
	public BoardDTO boardview(int num) {
		return sqlSession.selectOne("board.boardview",num);
	}
	@Override
	public void boardDelete(int num) {
		sqlSession.delete("board.boardDelete",num);
	}
	@Override
	public BoardDTO boardUpdatePage(int num) {
		return sqlSession.selectOne("board.boardUpdatePage",num);
	}
	@Override
	public void boardUpdate(BoardDTO dto) {
		sqlSession.update("board.boardUpdate",dto);
	}
	@Override
	public BoardDTO boardReplyPage(int num) {
		return sqlSession.selectOne("board.boardReplyPage",num);
	}
	@Override
	public void boardCount(int num) {
		sqlSession.selectOne("board.boardCount",num);
	}
	@Override
	public int boardMaxNum() {
		int num = sqlSession.selectOne("board.boardMaxNum");
		return num+1;
	}
	
/*	원래@Override
	public int boardMaxNum() {
		return sqlSession.selectOne("board.boardMaxNum");
	}
*/	@Override
	public void boardReplyUpdate(BoardDTO dto) {
		sqlSession.update("board.boardReplyUpdate",dto);
		dto.setBOARD_RE_SEQ(dto.getBOARD_RE_SEQ()+1);
		dto.setBOARD_RE_LEV(dto.getBOARD_RE_LEV()+1);
	}
	@Override
	public void boardReply(BoardDTO dto) {
		sqlSession.insert("board.boardReply",dto);
	}

	
	
}