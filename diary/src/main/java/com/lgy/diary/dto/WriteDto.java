package com.lgy.diary.dto;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class WriteDto {
	private int bid;
	private int topic;
	private String id;
	private String name;
	private String title;
	private String content;
	private String wdate;
	private int hits;
	
	/* 토픽주제 */
	private String topicContent;
    /* 댓글 */
	private ArrayList<CommentDto> commentList;

}

