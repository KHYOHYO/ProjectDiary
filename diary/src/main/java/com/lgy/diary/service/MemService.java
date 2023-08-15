package com.lgy.diary.service;

import java.util.HashMap;

import com.lgy.diary.dto.*;

public interface MemService {
	/* 로그인 */
	public MemDto loginYn(HashMap<String, String> param);
	/* 회원가입 */
	public void write(HashMap<String, String> param);
	/* 이메일 중복 체크 */
	public int emailCheck(MemDto dto) throws Exception;
	/* 전화번호 중복 체크 */
	public int hpCheck(MemDto dto) throws Exception;
	/* 아이디 찾기 */
	public String find_id(HashMap<String, String> param); //name hp
	/* 비밀번호  찾기 */
	public String find_pwd(HashMap<String, String> param); //name hp
	/* 카카오톡 */
	public void registerkakao(HashMap<String, String> param);
	public String sameId(String id);
	public MemDto memInfo(String id);
	
	/* 아이디 중복 체크 */
	public int idCheck(MemDto dto) throws Exception;
}
