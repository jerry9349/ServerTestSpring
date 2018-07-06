package com.you.joo.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.you.joo.model.dto.MemberDTO;

public interface MemberService {
	public void insert(MemberDTO dto);
	public String loginCheck(MemberDTO dto, HttpSession session);
	public MemberDTO myinfo(String name);
	public void update(MemberDTO dto);
	public List<MemberDTO> allinfo();
	public void delete(String id);
	public void testInsert(MemberDTO dto);
}
