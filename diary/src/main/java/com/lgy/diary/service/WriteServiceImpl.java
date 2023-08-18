package com.lgy.diary.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.diary.dao.WriteDao;
import com.lgy.diary.dto.CommentDto;
import com.lgy.diary.dto.Criteria;
import com.lgy.diary.dto.Criteria2;
import com.lgy.diary.dto.WriteDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("WriteService")
public class WriteServiceImpl implements WriteService {
	@Autowired
	private SqlSession sqlSession;
	
	/* 일기작성 */
	@Override
	public void diaryWrite(HashMap<String, String> param) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		dao.diaryWrite(param);
	}

//	@Override
//	public WriteDto writeView(HashMap<String, String> param) {
//		WriteDao dao = sqlSession.getMapper(WriteDao.class);
//		WriteDto dto = dao.writeView(param);
//		log.info("임플 writeView param"+param);
//		log.info("임플 writeView dto"+dto);
//		return dto;
//	}

	@Override
	public WriteDto contentView(HashMap<String, String> param) {
		log.info("@# BServiceImpl.contentView() start");
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		WriteDto dto = dao.contentView(param);
		log.info("임플 contentView param"+param);
		log.info("임플 contentView dto"+dto);
		
		log.info("@# BServiceImpl.contentView() end");
		return dto;
	}
	
	@Override
	public void diaryModify(HashMap<String, String> param) {
		log.info("@# WriteServiceImpl.modify() start");
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		dao.diaryModify(param);
		
		log.info("@# WriteServiceImpl.modify() end");
		
	}
	@Override
	public WriteDto writeView2(HashMap<String, String> param) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		WriteDto dto = dao.writeView2(param);
		return dto;
	}

	@Override
	public void diaryDelete(HashMap<String, String> param) {
		log.info("@# 임플diaryDelete() start");
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		//dao.delete(request.getParameter("bid"));
		dao.diaryDelete(param);
	}

	@Override
	public ArrayList<WriteDto> diaryList() {
		log.info("@# 임플ArrayList start");
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		ArrayList<WriteDto> list = dao.diaryList();
		
		log.info("@# 임플ArrayList end");
		
		return list;
	}

	@Override
	public ArrayList<WriteDto> list(Criteria cri) {
		log.info("@# 임플.list(Criteria cri) start");
		log.info("@# cri ===>"+cri);
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		//ArrayList<WriteDto> list = dao.listWithPaging(cri);
		log.info("@# BServiceImpl.list(Criteria cri) end");
		
		return dao.listWithPaging(cri);
	}

	@Override
	public ArrayList<WriteDto> everyDiarylist(Criteria cri) {
		log.info("@# 임플.list(Criteria cri) start");
		log.info("@# cri ===>"+cri);
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		//ArrayList<WriteDto> list = dao.everyDiaryListWithPaging(cri);
		log.info("@# 임플.list(Criteria cri) end");
		
		return dao.everyDiaryListWithPaging(cri);
	}

	@Override
	public int getTotalCount1(String id) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		return dao.getTotalCount1(id);
	}

	@Override
	public int getTotalCount2(Criteria cri) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		return dao.getTotalCount2(cri);	
	}

	@Override
	public String topicContent(int topic) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		return dao.topicContent(topic);	
	}

	@Override
	public void topicWrite(HashMap<String, String> param) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		dao.topicWrite(param);
	}

	@Override
	public ArrayList<WriteDto> topicDiaryListWithPaging(Criteria2 cri2) {
		log.info("@# 임플.topicDlist(Criteria2 cri2) start");
		log.info("@# cri2 ===>"+cri2);
		
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		log.info("@# 임플.list(Criteria2 cri2) end");
		
		return dao.topicDiaryListWithPaging(cri2);	}

	@Override
	public int getTotalCount3(int topic) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		return dao.getTotalCount3(topic);	
	}

	/* 댓글 작성 */
	@Override
	public void commentWrite(HashMap<String, String> param) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		dao.commentWrite(param);
	}

	@Override
	public int commentCount(int bid) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		return dao.commentCount(bid);
	}
	/* 댓글 리스트 */
	@Override
	public ArrayList<CommentDto> commentList(int bid) {
		log.info("@# 임플commentList start");
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
	
		ArrayList<CommentDto> list = dao.commentList(bid);
		
		log.info("@# 임플commentList end");
		return list;
	}

	@Override
	public void commentDelete(HashMap<String, String> param) {
		WriteDao dao = sqlSession.getMapper(WriteDao.class);
		dao.commentDelete(param);
	}

//@Override
//public int maxBid() {
//	WriteDao dao = sqlSession.getMapper(WriteDao.class);
//	return dao.maxBid();
//}

}
