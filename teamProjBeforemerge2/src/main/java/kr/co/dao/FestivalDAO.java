package kr.co.dao;

import java.util.List;

import kr.co.vo.FestivalVO;
import kr.co.vo.SearchCriteria;

public interface FestivalDAO {
	
	// 행사 목록 조회
		public List<FestivalVO> list(SearchCriteria scri) throws Exception;
		
	// 행사 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
}
