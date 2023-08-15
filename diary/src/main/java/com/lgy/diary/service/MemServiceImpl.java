package com.lgy.diary.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.diary.dao.IMemDao;
import com.lgy.diary.dto.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MemService")
public class MemServiceImpl implements MemService{
	/*=======================================================================================
		  로그인&간편로그인(카카오톡) 및 회원가입&간편회원가입(카카오톡) 구현
		  작성자   |    개발 및 수정 일자    |    수정 내용
		  김효진          23-06-16   	  	  로그인, 회원가입, 회원가입 완료페이지 구현 완료
		  김효진          23-06-19   	  	  회원가입	아이디 중복확인 기능 구현 중
		  김효진          23-06-22   	  	  회원가입	아이디 중복확인 기능 오류 해결
		  김효진          23-06-26      	  로그인	아이디 찾기 기능 구현 완료
		  김효진          23-06-27      	  로그인	비밀번호 찾기 기능 구현 완료 (하루 2회 제한)
		  김효진                        	  회원가입 중복검사 기능 구현 완료(전화번호, 이메일)
		  김효진          23-06-29			  카카오톡 회원가입 데이터베이스 삽입 완료
		  김효진          23-06-30			  카카오톡 로그인 구현 & session 유지    
	=========================================================================================*/
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.write() start");
		
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.write(param);
		
		log.info("@# MemServiceImpl.write() end");		
	}
	
	@Override
	public int emailCheck(MemDto dto) throws Exception {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		int cnt = dao.emailCheck(dto);
//		log.info("@#cnt : "+cnt);
		
		return cnt;
	}
	
	@Override
	public MemDto memInfo(String id) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		MemDto dto = dao.memInfo(id);
		return dto;
	}
	
	@Override
	public int hpCheck(MemDto dto) throws Exception {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		int cnt = dao.hpCheck(dto);
		log.info("@#cnt : "+cnt);
		
		return cnt;
	}
	
	@Override
	public String find_id(HashMap<String, String> param) {
		String result = "";

        try {
            result = sqlSession.selectOne("find_id", param);
            log.info("@find_id name2=>" + param.get("name"));
            log.info("@find_id hp2=>" + param.get("hp"));
            log.info("@find_id id2=>" + result);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
	
	@Override
	public String find_pwd(HashMap<String, String> param) {
		String result = "";
		
		try {
			result = sqlSession.selectOne("find_pwd", param);
			log.info("@find_pwd name2=>" + param.get("name"));
			log.info("@find_pwd hp2=>" + param.get("hp"));
			log.info("@find_pwd pwd2=>" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public MemDto loginYn(HashMap<String, String> param) {
		log.info("@# MemServiceImpl.loginYn() start");
		
	    IMemDao dao = sqlSession.getMapper(IMemDao.class);
		MemDto dto = dao.loginYn(param);
		
		log.info("@# MemServiceImpl.loginYn() end");
		
		return dto;
	}
	/* 카카오톡 */
    @Override
    public void registerkakao(HashMap<String, String> param) {
        // 필요한 유효성 검사 등의 로직 수행
    	IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.saveUser(param);
    }
    
	@Override
	public String sameId(String id) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		String dto = dao.sameId(id);
		return dto;
	}
	
	   @Override
	   public int idCheck(MemDto dto) throws Exception {
	      IMemDao dao = sqlSession.getMapper(IMemDao.class);
	      int cnt = dao.idCheck(dto);
	      log.info("@#cnt : "+cnt);
	      
	      return cnt;
	   }

	   
//	   @Override
//	   public adminDto adminloginYn(HashMap<String, String> param) {
//	      log.info("@# MemServiceImpl.adminloginYn() start");
//	      
//	      IMemDao dao = sqlSession.getMapper(IMemDao.class);
//	      adminDto dto = dao.adminloginYn(param);
//	            
//	      log.info("@# MemServiceImpl.adminloginYn() end");
//	      
//	      return dto;
//
//	   }

}
