package com.lgy.diary.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemDto {
	private String id;
	private String pwd;
	private String name;
	private String hp;
	private String email;
	private String sms;
	private String emails;
	
	private int bid;
	
}
