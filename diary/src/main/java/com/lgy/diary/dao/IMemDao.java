package com.lgy.diary.dao;

import java.util.HashMap;

import com.lgy.diary.dto.*;
public interface IMemDao {
	/* 로그인 */
	public MemDto loginYn(HashMap<String, String> param);
	/* 회원가입 */
	public void write(HashMap<String, String> param);
	/* 아이디 중복 체크 */
	public int idCheck(MemDto dto) throws Exception;
	/* 이메일 중복 체크 */
	public int emailCheck(MemDto dto) throws Exception;
	/* 전화번호 중복 체크 */
	public int hpCheck(MemDto dto) throws Exception;
	/* 카카오톡 */
	void saveUser(HashMap<String, String> param);
	public String sameId(String id);
	public MemDto memInfo(String id);

}