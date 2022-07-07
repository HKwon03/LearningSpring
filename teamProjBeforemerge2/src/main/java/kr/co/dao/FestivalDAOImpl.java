package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.FestivalVO;
import kr.co.vo.SearchCriteria;

@Repository
public class FestivalDAOImpl implements FestivalDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 축제 목록 조회
	@Override
	public List<FestivalVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("festivalMapper.listPage", scri);
	}
	
	
	// 축제 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("festivalMapper.listCount", scri);
	}
	
}
