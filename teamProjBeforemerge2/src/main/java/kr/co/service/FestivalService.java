package kr.co.service;

import java.util.List;

import kr.co.vo.FestivalVO;
import kr.co.vo.SearchCriteria;

public interface FestivalService {
	// 축제 목록 조회
	public List<FestivalVO> list(SearchCriteria scri) throws Exception;

	//축제 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
		
}