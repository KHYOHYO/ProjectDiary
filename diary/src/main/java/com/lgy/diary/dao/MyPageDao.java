package com.lgy.diary.dao;

import java.util.HashMap;

import com.lgy.diary.dto.MemDto;

public interface MyPageDao {
	//로그인 정보 가져옴
	public MemDto loginYn(HashMap<String, String> param);
	
	//조회
	public MemDto myPageView(HashMap<String, String> param);
	
	//수정
	public void myPageModify(HashMap<String, String> param);
	
	//비밀번호 확인
	public MemDto memberPassword(HashMap<String, String> param);
	
	//탈퇴
	public void memberDelete(HashMap<String, String> param);
}
