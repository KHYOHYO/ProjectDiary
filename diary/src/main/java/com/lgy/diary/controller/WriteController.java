package com.lgy.diary.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.lgy.diary.dto.CommentDto;
import com.lgy.diary.dto.Criteria;
import com.lgy.diary.dto.Criteria2;
import com.lgy.diary.dto.MemDto;
import com.lgy.diary.dto.PageDto;
import com.lgy.diary.dto.WriteDto;
import com.lgy.diary.service.WriteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WriteController {
	@Autowired
	private WriteService service;
	
	
	@RequestMapping("/main")
	public String main() {
		log.info("@# main");
		
		return "main";
	}
	
	@RequestMapping("/diaryWrite")
	public String diaryWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# diaryWrite");
		log.info("@# diaryWrite param" +param);
		return "diaryWrite";
	}
	
	@RequestMapping("/diaryWriteSave")
	public String diaryWriteSave(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# diaryWriteSave");
		service.diaryWrite(param);
		log.info("@# diaryWriteSave param" +param);
		
		String id= param.get("id");
		String source = param.get("source");
		return "redirect:/mydiary?id="+id;
	}
	
	@RequestMapping("/contentView")
	public String contentView(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# contentView");
		log.info("@# contentView param==>"+param);

		// id 값을 받아올 변수를 선언합니다.
	    String id = param.get("id");
	    
		WriteDto dto = service.contentView(param);
		model.addAttribute("contentView", dto);
		
		//토픽 주제
		String topicContent = service.topicContent(dto.getTopic());
		model.addAttribute("topicContent", topicContent);
				
		//content_view.jsp 에서 pageMaker 를 가지고 페이징처리
		model.addAttribute("pageMaker", param);
		log.info("@# contentView==>"+dto);
		log.info("@# pageMaker==>"+param);
		
		// id 값을 추가합니다.
	    model.addAttribute("id", id);
	    param.put("id", id);
		return "contentView";
	}
	
	@RequestMapping("/diaryModify")
	public String diaryModify(@RequestParam HashMap<String, String> param, Criteria cri, Model model) {
		log.info("@# diaryModify");
		
		service.diaryModify(param);
		
		 // 수정된 일기 내용을 다시 가져오기
		WriteDto dto =service.contentView(param);
		model.addAttribute("writeView2", dto);
		
		log.info("@#★★★★ diaryModify dto"+ dto); 
		String id = dto.getId();
		param.put("id", id);//
		String source = param.get("source");
		log.info("@# pageMaker==>"+param);
		int pageNum = Integer.parseInt(param.get("pageNum"));
		int amount = Integer.parseInt(param.get("amount"));
		int bid = Integer.parseInt(param.get("bid"));
		String type = param.get("type");//5
		String keyword = param.get("keyword");//5;
		model.addAttribute("pageMaker", type);
		model.addAttribute("pageMaker", keyword);
		
		//상세보기에서 목록 페이징 처리 수정중
		
		 // type과 keyword 파라미터를 인코딩하여 전달
	    String encodedType = URLEncoder.encode(param.get("type"));
	    String encodedKeyword = URLEncoder.encode(param.get("keyword"));
	    return "redirect:diaryWriteView2?pageNum=" + pageNum + "&amount=" + amount + "&id=" + id + "&bid=" + bid + "&source=" + source + "&type=" + encodedType + "&keyword=" + encodedKeyword;
		

	}
	
	@RequestMapping("/diaryWriteView2")
	public String writeView2(@RequestParam HashMap<String, String> param, Model model, Criteria cri) {
		log.info("@# writeView2");
		log.info("@# writeView2 param1" + param);
		//일기를 가져오는 로직 호출 (이 부분은 실제로 구현되어야 합니다.)//1
		WriteDto dto = service.writeView2(param);
		int bid = Integer.parseInt(param.get("bid"));
		
		ArrayList<CommentDto> commentDtoList = service.commentList(bid);
		
		dto.setCommentList(commentDtoList);
		
		model.addAttribute("writeView2", dto);
		
		int topic = dto.getTopic();
		model.addAttribute("topic", topic);
		String topicContent = service.topicContent(topic);
		model.addAttribute("topicContent", topicContent);
		log.info("@# writeView2 dto" + dto);
		
		//상세보기에서 목록 페이징 처리 수정중
		model.addAttribute("pageMaker", param);
		int total = service.getTotalCount2(cri);
		model.addAttribute("pageMaker", new PageDto(total, cri));
		
		return "diaryWriteView2";
	}
	
	@RequestMapping("/diaryDelete")
	public String diaryDelete(@RequestParam HashMap<String, String> param) {
	    log.info("@# diaryDelete");

	    service.diaryDelete(param);
	    log.info("@# diaryDelete param==>" + param);

	    String id = param.get("id");
		String source = param.get("source");
		int pageNum = Integer.parseInt(param.get("pageNum"));
		int amount = Integer.parseInt(param.get("amount"));
		
	    if ("mydiary".equals(source)) {
	    	return "redirect:mydiary?pageNum=" + pageNum + "&amount=" + amount+ "&id=" + id  + "&source=" + source;
	    } else if ("everydiary".equals(source) && param.containsKey("type")) {
	    	String encodedType = URLEncoder.encode(param.get("type"));
	    	String encodedKeyword = URLEncoder.encode(param.get("keyword"));
	    	return "redirect:everydiary?pageNum=" + pageNum + "&amount=" + amount+ "&id=" + id  + "&source=" + source+ "&type=" + encodedType + "&keyword=" + encodedKeyword;
	    } else if ("everydiary".equals(source)) {
	        return "redirect:everydiary?pageNum=" + pageNum + "&amount=" + amount+ "&id=" + id  + "&source=" + source;
	    } else if ("topicdiary".equals(source)) {
	    	return "redirect:topicdiary?pageNum=" + pageNum + "&amount=" + amount+ "&id=" + id  + "&source=" + source;
	    } else {
	        return "redirect:/main"; // 이동할 페이지가 없으면 기본 페이지로 이동하도록 설정
	    }
	}
	
	@RequestMapping("/mydiaryOld")
	public String list(Model model) {
		log.info("@# mydiary");

		ArrayList<WriteDto> list = service.diaryList();
		model.addAttribute("list", list);
		log.info("@# mydiary list==>"+list);
		
		return "mydiary";
	}
	
	@RequestMapping("/mydiary")
	public String list(Criteria cri, Model model, HttpSession session) {
//	public String list(Criteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri===>" + cri);
		String id = cri.getId();
		log.info("@# id===>" + id);
		int total = service.getTotalCount1(id);
		log.info("@# total===>"+total);
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", new PageDto(total, cri));
		
		// 로그인하지 않은 경우
		MemDto dto = (MemDto) session.getAttribute("dto");
		// 로그인하지 않은 경우 로그인 페이지로 리다이렉트합니다.
        if (dto == null) {
            return "redirect:/login";
        }
        
		return "mydiary";
	}
	
	@RequestMapping("/everydiary")
//	public String everyDiarylist(Criteria cri, Model model, HttpSession session) {
	public String list(Criteria cri, Model model, WriteDto dto) {
		log.info("@# list");
		log.info("@# cri===>" + cri);
		
		int total = service.getTotalCount2(cri);
		log.info("@# total===>"+total);
		
		model.addAttribute("list", service.everyDiarylist(cri));
		model.addAttribute("pageMaker", new PageDto(total, cri));
		
		return "everydiary";
	}
	
	Random random = new Random();
	// 원하는 범위 내의 랜덤 숫자 생성 (예: 2부터 10까지의 랜덤 숫자)
	int min = 2;
	int max = 10;

	public static int rollDie() {
		 double x = 8 * Math.random(); // 0 이상 8 미만의 double 값 생성
		 int temp = (int) x; // 형변환하여 정수 부분만 남김
		 return temp + 2; // 2 이상 10 미만의 정수로 변환
	}
	
	@RequestMapping("/topicdiary")
	public String topicdiary(Criteria2 cri2, Model model, HttpSession session) {
		log.info("@# topicdiary");
		
		int topic = cri2.getTopic();
		if (topic == 0) {
			topic = rollDie(); 
			}		
		model.addAttribute("topic", topic);
		
		//토픽주제
		String topicContent = service.topicContent(topic);
		model.addAttribute("topicContent", topicContent);
		int total = service.getTotalCount3(topic);
		cri2.setTopic(topic);//+
		model.addAttribute("list", service.topicDiaryListWithPaging(cri2));
		model.addAttribute("pageMaker", new PageDto(total, cri2));
		return "topicdiary";
	}
	
	@RequestMapping("/topicWrite")
	public String topicWrite(Criteria2 cri2, @RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		log.info("@# topicWrite param===>"+param);
		
		int topic = cri2.getTopic();
		model.addAttribute("topic", topic);
		log.info("@# topicWrite topic===>"+topic);
		log.info("@# topicWrite");
		
		//토픽 주제
		String topicContent = service.topicContent(topic);
		model.addAttribute("topicContent", topicContent);
		
		// 로그인하지 않은 경우
		MemDto memDto = (MemDto) session.getAttribute("dto");
		// 로그인하지 않은 경우 로그인 페이지로 리다이렉트합니다.
		if (memDto == null) {
		   return "redirect:/login";
		}		
		return "topicWrite";
	}
	
	@RequestMapping("/topicWriteSave")
	public String topicWriteSave(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# topicWriteSave");
		log.info("@# topicWriteSave param" +param);
		service.topicWrite(param);
		int topic = Integer.parseInt(param.get("topic")); // String을 int로 변환하여 사용
		
		log.info("@# topicWriteSave param===>"+param);
		return "redirect:/topicdiary?topic="+topic;
	}
//	
	
	/* 댓글달기 */
	@RequestMapping("/commentWrite")
	public ResponseEntity<Integer> addComment(@RequestParam HashMap<String, String> param) throws Exception{
		log.info("@# addComment===> "+param);
		
		service.commentWrite(param);// 글을 데이터베이스에 추가하는 메서드를 호출합니다.
	    return ResponseEntity.status(HttpStatus.OK).body(200);
	}
	
	/* 댓글 리스트 */
	@RequestMapping(value = "/commentList", produces = "application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity commentList(@ModelAttribute("writedto") WriteDto writedto, HttpServletRequest request) throws Exception{
		log.info("@# commentList");
		HttpHeaders responseHeaders = new HttpHeaders();
	    ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	
	    int bid = writedto.getBid();
	    
	    JSONArray json = new JSONArray(hmlist);        
	    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping("/commentDelete")
	public ResponseEntity<Integer> commentDelete(@RequestParam HashMap<String, String> param) throws Exception{
	    log.info("@# commentDelete");
	    log.info("@# commentDelete param===> "+param);
	    service.commentDelete(param);
	    return ResponseEntity.status(HttpStatus.OK).body(200);
	}
}