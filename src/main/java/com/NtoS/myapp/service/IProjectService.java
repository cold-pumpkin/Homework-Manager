package com.NtoS.myapp.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.NtoS.myapp.model.HomeworkVO;
import com.NtoS.myapp.model.MemberVO;
import com.NtoS.myapp.model.BoardVO;

public interface IProjectService {
	
	
	//MemberMapper.xml에 구현 
	void insertMember(MemberVO member);	//회원 가입 	 
	void deleteMember(@Param("memberName") String memberName, @Param("email") String email);		//회원 탈퇴
	void updateMember(MemberVO member);		//회원 정보 수정
	List<MemberVO> getMemberInfoList();		//모든 회원 정보 조회	
	//MemberVO getMemberInfo(String email);
	MemberVO getMemberInfo(@Param("email")String email,@Param("password")String password);	//내 정보 조회

	
	
	
	//homeworkMapper.xml
	void uploadFile(HomeworkVO homework);
	void deleteFile(int fileId);
	HomeworkVO getFile(int fileId);
	List<HomeworkVO> getAlList(@Param("email") String email);
	List<HomeworkVO> getNewsList(@Param("email") String email);
	List<HomeworkVO> getWalkList(@Param("email") String email);
	HomeworkVO getAlSubmit(@Param("email") String email, @Param("submitDate") Date submitDate);
	HomeworkVO getNewsSubmit(@Param("email") String email, @Param("submitDate") Date submitDate);
	HomeworkVO getWalkSubmit(@Param("email") String email, @Param("submitDate") Date submitDate);
		
	//WritingMapper.xml에 구현
	
		void insertWriting(BoardVO writing);
		void insertCommunityBoard(BoardVO boardInfo);
		List<BoardVO> selectBoardList();//일단 게시판이 여러개니까 선택하는것
		BoardVO selectCommunityBoard(int brdno);
		void updateCommunityBoard(BoardVO boardInfo);
		void deleteCommunityBoard(int brdno);
		void updateBoard2Read(int brdno);
}
