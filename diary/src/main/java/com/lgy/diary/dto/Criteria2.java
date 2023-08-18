package com.lgy.diary.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Criteria2 {
//	private int pageNum; //페이지 번호
//	private int amount; //페이지 글 갯수
//	
//	public Criteria() {
//		//this(pageNum, amount)
//		//초기페이지는 1이고, 10개씩 출력
//		this(1, 2);
//	}
	
	
    private int topic; //토픽
    private int pageNum; // 페이지 번호
    private int amount; // 페이지 글 갯수

    public Criteria2() {
        // 기본 토픽은 null로 설정
        this(0, 1, 8);
    }

    public Criteria2(int topic) {
        // 토픽만 변경하여 나머지는 기본값으로 설정
        this(topic, 1, 8);
    }
}
//