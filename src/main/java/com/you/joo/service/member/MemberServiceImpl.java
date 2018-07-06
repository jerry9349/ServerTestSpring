package com.you.joo.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.you.joo.model.dao.MemberDAO;
import com.you.joo.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberdao;
	
	//회원 등록
	@Override
	public void insert(MemberDTO dto) {
		memberdao.insert(dto);
	}
	
	//로그인 체크
	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		String name = memberdao.loginCheck(dto);
		if(name!=null) {
			session.setAttribute("name", name);
						System.out.println("세션에 이름넣기 성공 (ServiceImpi)");
			return name;
		}
		return null;
	}

	//회원정보보기
	@Override
	public MemberDTO myinfo(String name) {
		return memberdao.myinfo(name);
	}

	//회원정보수정
	@Override
	public void update(MemberDTO dto) {
		memberdao.update(dto);
	}
	
	//모든회원정보보기
	@Override
	public List<MemberDTO> allinfo() {
		return memberdao.list();
	}

	@Override
	public void delete(String id) {
		memberdao.delete(id);
	}
	
	@Override
	public void testInsert(MemberDTO dto) {
		memberdao.testInsert(dto);
	}
	
}
