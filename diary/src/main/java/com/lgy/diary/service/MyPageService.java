package com.lgy.diary.service;

import java.util.HashMap;

import com.lgy.diary.dto.MemDto;

public interface MyPageService {
	/* 마이페이지 */
    /* 로그인 정보 가져옴 */
	public MemDto loginYn(HashMap<String, String> param);
	
	/* 조회 */
	public MemDto myPageView(HashMap<String, String> param);
	
	/* 수정 */
	public void myPageModify(HashMap<String, String> param);
	
	/* 비밀번호 */
	public MemDto memberPassword(HashMap<String, String> param);
	
	/* 탈퇴 */
	 public void memberDelete(HashMap<String, String> param);
}
