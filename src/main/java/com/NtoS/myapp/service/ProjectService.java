package com.NtoS.myapp.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.NtoS.myapp.dao.IHomeworkRepository;
import com.NtoS.myapp.dao.IMemberRepository;
import com.NtoS.myapp.dao.IWritingRepository;
import com.NtoS.myapp.model.HomeworkVO;
import com.NtoS.myapp.model.MemberVO;
import com.NtoS.myapp.model.BoardVO;

@Service
public class ProjectService implements IProjectService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Autowired
	IWritingRepository writingRepository;
	
	@Autowired
	IHomeworkRepository homeworkRepository;
	
	@Autowired
    IWritingRepository sqlSession;

	
	@Override
	public void insertMember(MemberVO member) {
		memberRepository.insertMember(member);
	}

	@Override
	public void deleteMember(String memberName, String email) {
		memberRepository.deleteMember(memberName, email);
	}

	@Override
	public void updateMember(MemberVO member) {
		memberRepository.updateMember(member);
		
	}

	@Override
	public List<MemberVO> getMemberInfoList() {
		return memberRepository.getMemberInfoList();
	}

	@Override
	public MemberVO getMemberInfo(String email, String password) {
		return memberRepository.getMemberInfo(email,password);
	}
	

	

	
	//HomeworkMapper.xml  부분
	public void uploadFile(HomeworkVO homework) {
		homeworkRepository.uploadFile(homework);
	}
	
	@Override
	public void deleteFile(int fileId) {
		homeworkRepository.deleteFile(fileId);
	}
	@Override
	public HomeworkVO getFile(int fileId) {
		return homeworkRepository.getFile(fileId);
	}
	
	@Override
	public List<HomeworkVO> getAlList(String email){
		return homeworkRepository.getAlList(email);
	}
	
	@Override
	public List<HomeworkVO> getNewsList(String email){
		return homeworkRepository.getNewsList(email);
	}
	
	@Override
	public List<HomeworkVO> getWalkList(String email){
		return homeworkRepository.getWalkList(email);
	}
	@Override
	public HomeworkVO getAlSubmit(@Param("email") String email, @Param("submitDate") Date submitDate) {
		System.out.println(email);
		System.out.println(submitDate);
		return homeworkRepository.getAlSubmit(email, submitDate);
	}
	@Override
	public HomeworkVO getNewsSubmit(@Param("email") String email, @Param("submitDate") Date submitDate) {
		System.out.println(email);
		System.out.println(submitDate);
		return homeworkRepository.getNewsSubmit(email, submitDate);
	}
	@Override
	public HomeworkVO getWalkSubmit(@Param("email") String email, @Param("submitDate") Date submitDate) {
		System.out.println(email);
		System.out.println(submitDate);
		return homeworkRepository.getWalkSubmit(email, submitDate);
	}
	
	// WritingMapper.xml 확인
	@Override
	public void insertWriting(BoardVO writing) {
		writingRepository.insertWriting(writing);
	}
	@Override
	public List<BoardVO> selectBoardList()  {
        return writingRepository.selectBoardList();
    }
	@Override
	public void insertCommunityBoard(BoardVO boardInfo) {
		writingRepository.insertCommunityBoard(boardInfo);
	}
	@Override
	public BoardVO selectCommunityBoard(int brdno) {
		return writingRepository.selectCommunityBoard(brdno);
	}
	
	@Override
	public void updateCommunityBoard(BoardVO boardInfo) {
		writingRepository.updateCommunityBoard(boardInfo);
	}
	@Override
	public void deleteCommunityBoard(int brdno) {
		writingRepository.deleteCommunityBoard(brdno);
	}
	public void updateBoard2Read(int brdno) {
	    writingRepository.updateBoard2Read(brdno);
	}

	
}
