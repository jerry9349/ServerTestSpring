package com.you.joo.model.dao;

import java.util.List;

import com.you.joo.model.dto.MemberDTO;

public interface MemberDAO {

	public void insert(MemberDTO dto);

	public String loginCheck(MemberDTO dto);

	public MemberDTO myinfo(String name);

	public void update(MemberDTO dto);

	public List<MemberDTO> list();

	public void delete(String id);
	
	public void testInsert(MemberDTO dto);
}
	