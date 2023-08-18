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

}
