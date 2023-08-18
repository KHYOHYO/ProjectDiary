package com.lgy.diary.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class EveryDiaryCriteria {
	private int pageNum; //페이지 번호
	private int amount; //페이지 글 갯수
	
	public EveryDiaryCriteria() {
		//this(pageNum, amount)
		//초기페이지는 1이고, 10개씩 출력
		this(1, 2);
	}
	
	
//    private String id; // 아이디
//    private int pageNum; // 페이지 번호
//    private int amount; // 페이지 글 갯수
//
//    public EveryDiaryCriteria() {
//        // 기본 아이디는 null로 설정
//        this(null, 1, 10);
//    }
//
//    public EveryDiaryCriteria(String id) {
//        // 아이디만 변경하여 나머지는 기본값으로 설정
//        this(id, 1, 10);
//    }
}
//