package com.lgy.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.lgy.diary.dto.CommentDto;
import com.lgy.diary.dto.Criteria;
import com.lgy.diary.dto.Criteria2;
import com.lgy.diary.dto.WriteDto;

public interface WriteService {
	/* 추천일기 주제 */
	public String topicContent(int topic);
	/* 추천일기 작성 페이지*/
	public void topicWrite(HashMap<String, String> param);
	
	/* 내일기 작성 페이지 */
	public void diaryWrite(HashMap<String, String> param);
	
	/* 일기 수정 페이지(내일기,모두일기,추천일기) */
	public WriteDto contentView(HashMap<String, String> param);
	/* 일기 수정 (내일기,모두일기,추천일기)*/
	public void diaryModify(HashMap<String, String> param);
	
//	public int maxBid();
//	public WriteDto writeView(HashMap<String, String> param);
	
	/* 일기 상세보기 페이지(내일기,모두일기,추천일기)*/
	public WriteDto writeView2(HashMap<String, String> param);
	/* 일기 삭제 (내일기,모두일기,추천일기)*/
	public void diaryDelete(HashMap<String, String> param);
	
	/* 일기 리스트 구버전 (내일기,모두일기,추천일기)*/
	public ArrayList<WriteDto> diaryList();
	
	/* Criteria 객체를 이용해서 페이징 처리 (내일기,모두일기,추천일기) */
	public ArrayList<WriteDto> list(Criteria cri);
	public ArrayList<WriteDto> everyDiarylist(Criteria cri);
	public ArrayList<WriteDto> topicDiaryListWithPaging(Criteria2 cri2);
	
	/* 일기 총갯수 (내일기,모두일기,추천일기) */
	public int getTotalCount1(String id);
	public int getTotalCount2(Criteria cri); 
	public int getTotalCount3(int topic);
	
	/* 댓글 작성 */
	public void commentWrite(HashMap<String, String> param);
	/* 댓글 리스트 */
	public ArrayList<CommentDto> commentList(int bid);
	/* 댓글 삭제 */
	public void commentDelete(HashMap<String, String> param);
//	public List<WriteDto> commentList(int bid);
	/* 댓글 총갯수 */
	public int commentCount(int bid);
	
}
