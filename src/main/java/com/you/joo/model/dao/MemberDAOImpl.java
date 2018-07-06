package com.you.joo.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.you.joo.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert",dto);
	}
	@Override
	public String loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.login_check",dto);
		
		if(name!=null) {
			System.out.println("이름뽑기 성공 in (DAOImpl)");
			return name;
		}
		return null;
	}
	@Override
	public MemberDTO myinfo(String name) {
		return sqlSession.selectOne("member.myinfo", name);
	}
	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("member.update", dto);
	}
	@Override
	public List<MemberDTO> list() {	
		return sqlSession.selectList("member.allinfo");
	}
	@Override
	public void delete(String id) {
		sqlSession.delete("member.delete", id);
	}
	@Override
	public void testInsert(MemberDTO dto) {
		sqlSession.insert("member.testInsert",dto);
	}
}
