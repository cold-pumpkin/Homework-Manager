package com.NtoS.myapp.dao;

import java.util.List;

import com.NtoS.myapp.model.BoardVO;

public interface IWritingRepository {
	void insertWriting(BoardVO writing);
	List<BoardVO> selectBoardList();
	void insertCommunityBoard(BoardVO boardInfo);
	BoardVO selectCommunityBoard(int brdno);
	
	void updateCommunityBoard(BoardVO boardInfo);
	void deleteCommunityBoard(int brdno);
	void updateBoard2Read(int brdno);

}
