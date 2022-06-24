package com.springbook.biz.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.util.SqlSessionFactoryBean;

public class BoardDAOMyBatis {
	
	private SqlSession mybatis;
	
	public BoardDAOMyBatis() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void insertBoard(BoardVO vo) {
		
		mybatis.insert("BoardDAO.insertBoard",vo);
		mybatis.commit();
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard",vo);
		mybatis.commit();
	}
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard",vo);
		mybatis.commit();
	}
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard",vo);
	}
	public List<BoardVO> getBoardList(BoardVO vo){
		
		System.out.println("MyBatis를 사용해서 getBoardLIst() 메소드 호출");

		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	
	// getBoard getBoardLIst는 select type이라서 return이 필요하다.
}
