package com.lgy.diary.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Criteria {
//	private int pageNum; //페이지 번호
//	private int amount; //페이지 글 갯수
//	
//	public Criteria() {
//		//this(pageNum, amount)
//		//초기페이지는 1이고, 10개씩 출력
//		this(1, 2);
//	}
	
	
    private String id; // 아이디
    private int pageNum; // 페이지 번호
    private int amount; // 페이지 글 갯수

	private String type;
	private String keyword;
	
    public Criteria() {
        // 기본 아이디는 null로 설정
        this(null, 1, 8);
    }

	public Criteria(String id, int pageNum, int amount) {
		this.id=id;
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
    public Criteria(String id) {
        // 아이디만 변경하여 나머지는 기본값으로 설정
        this(id, 1, 8);
    }
    public String[] getTypeArr(){
//		type 이 없으면 빈 스트링 객체(기본목록조회), 있으면 분리
		return type == null ? new String[] {}: type.split("");
	}
}
//