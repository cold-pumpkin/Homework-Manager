package com.NtoS.myapp.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.NtoS.myapp.model.HomeworkVO;

public interface IHomeworkRepository {

		int getMaxFileId();
		void uploadFile(HomeworkVO file);
		void deleteFile(int fileId);
		void updateFile(HomeworkVO file);
		HomeworkVO getFile(int fileId);//파일 다운로드
		String getHomeworkTitle(HomeworkVO homework);//업로드시 파일 제목을 정해주는 메소드
		List<HomeworkVO> getFileList(@Param("email") String email);//내꺼 전부
		List<HomeworkVO> getAllFileList();// 관리자 모드에서 모든 회원의 모든 파일리스트
		String getHomeworkTitle(int fileId);
		void updateDirectory(HashMap<String,Object>map);
		List<HomeworkVO> getAlList(@Param("email") String email);
		List<HomeworkVO> getNewsList(@Param("email") String email);
		List<HomeworkVO> getWalkList(@Param("email") String email);
		HomeworkVO getAlSubmit(@Param("email") String email, @Param("submitDate") Date sumbitDate);
		HomeworkVO getNewsSubmit(@Param("email") String email, @Param("submitDate") Date sumbitDate);
		HomeworkVO getWalkSubmit(@Param("email") String email, @Param("submitDate") Date sumbitDate);
		
		
		
}
