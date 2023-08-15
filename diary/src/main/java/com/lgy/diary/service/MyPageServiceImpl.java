package com.lgy.diary.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.diary.dao.MyPageDao;
import com.lgy.diary.dto.MemDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	  public MemDto loginYn(HashMap<String, String> param) {
	      log.info("@# MemServiceImpl.loginYn() start");
	      
	      log.info("@@@###"+param.get("id"));
		  log.info("@@@###"+param.get("pwd"));
		  
	      MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
	      MemDto dto = dao.loginYn(param);
	      log.info("@@@###"+dto);
	      log.info("@# MemServiceImpl.loginYn() end");
	      
	      return dto;
	   }

	@Override
	public MemDto myPageView(HashMap<String, String> param) {
		log.info("@# MyPageServiceImpl.myPageView() start");
		log.info("@#@#param"+param);
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		MemDto dto = dao.myPageView(param);//
		log.info("@#@#dto"+dto);
		log.info("@# MyPageServiceImpl.myPageView() end");
		
		return dto;
	}

	@Override
	public void myPageModify(HashMap<String, String> param) {
		log.info("@# MyPageServiceImpl.myPageModify() start");
		
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		dao.myPageModify(param);
		
		log.info("@# MyPageServiceImpl.myPageModify() end");
	}
	
	@Override
	public MemDto memberPassword(HashMap<String, String> param) {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		
		MemDto dto = dao.memberPassword(param);
		
		return dto;
	}

	@Override
	public void memberDelete(HashMap<String, String> param) {
		log.info("@# MyPageServiceImpl.memberDelete() start");
		
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		dao.memberDelete(param);

		log.info("@# MyPageServiceImpl.memberDelete() end");
	}


}
