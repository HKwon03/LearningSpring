package kr.co.dao;

import java.util.List;

import kr.co.vo.ReplyVO;

public interface ReplyDAO {
	
	// ��� ��ȸ
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	// ��� �ۼ�
	public void writeReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void updateReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// ���õ� ��� ��ȸ
	public ReplyVO selectReply(int rno) throws Exception;

}
