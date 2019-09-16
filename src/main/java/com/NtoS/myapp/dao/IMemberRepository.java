package com.NtoS.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.NtoS.myapp.model.MemberVO;

public interface IMemberRepository {
	void insertMember(MemberVO member);	//회원 가입 	 
	void deleteMember(@Param("memberName") String memberName, @Param("email") String email);		//회원 탈퇴
	//탈퇴시 작성한 글, 업로드한 파일도 삭제하려면 메서드 하나 더 필요(Service에서 메서드 2개 실행)
	void updateMember(MemberVO member);		//회원 정보 수정
	List<MemberVO> getMemberInfoList();		//모든 회원 정보 조회	
	MemberVO getMemberInfo(@Param("email")String email,@Param("password")String password);	//로그인 함수
	
	
}
