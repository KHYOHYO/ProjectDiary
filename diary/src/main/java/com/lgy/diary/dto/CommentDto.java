package com.lgy.diary.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentDto {
	private int ccode;
	private String comments;
	
	private int bid;
	private String id;
	private String name;
	private String wdate;
	
	
}
