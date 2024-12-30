package com.ssafy.member.model.service;

import java.sql.SQLException;

import com.ssafy.member.model.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws Exception;
	int joinMember(MemberDto memberDto) throws Exception;
	MemberDto loginMember(String userId, String userPwd) throws Exception;
	void updateMember(MemberDto memberDto) throws Exception;
	void getMemberService(MemberDto memberDto);
	void deleteMember(String userId) throws SQLException; 
}
