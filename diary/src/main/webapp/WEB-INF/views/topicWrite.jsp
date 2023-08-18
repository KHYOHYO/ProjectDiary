<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#form-diary{
  display: flex;
  flex-direction: column;
  align-items: center;
  box-sizing: border-box; /* padding이 전체 크기에 포함되도록 설정 */
  padding: 0px 40px;
  margin-top: 270px;
}
/* 노란 배경 화면 */
.backCss{
  background-color: #FFDA77;
  width: 580px;
  height: 580px;
  border-radius: 30px;
  position: absolute;
/*   top: 50%; */
  left: 50%;
  transform: translate(-50%, -50%);
  margin-top: 50px; /* 높이의 절반을 빼서 상단 여백 조절 */
}

/* 제목 내용 CSS */
.backCss input,
.backCss textarea {
  width: 80%;
  margin: 10px auto; /* 수평 중앙 정렬 */
  display: block; /* 블록 요소로 변경하여 줄 바꿈을 위한 처리 */
  
  border: none;
  background-color: #F7F1E5; 
  padding: 8px; 
  border-radius: 10px; 
  
  font-family: 'KOTRAHOPE', 'sans-serif'; 
  color : #263A29;
  font-size : large;
  resize: none; /* textarea 내용 크기 조절 비활성화 */
}

.topicCss{
  text-align: center;
  font-size: 20px;
  margin-top: 20px;
  margin-bottom: 20px;
}

.backCss input:focus,
.backCss textarea:focus {
/*   outline: none; /* 클릭 시 검은색 외곽선 없애기 */ */
  border : 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 3px;
}
/* 제목 내용 베이지로 아웃라인 강조하기 */
.info:hover 
,#submit:hover
,#reset:hover {
  outline: 4px solid #F7F1E5;
  outline-offset: 3px;
}

/* 제목 */
.backCss input{
  height: 50px;
}
/* 내용 */
.backCss textarea{
  height: 290px;
}
/* 제목 내용 div */
.flex-input{
  display: flex;
  align-items: center;
}
/* 제출,취소 버튼 */
#submit,
#reset{
width: 100px;
height: 40px;
}
#title.typing {
  outline: 4px solid #F7F1E5;
  outline-offset: 3px;
}

</style>
</head>
<body>
 <jsp:include page="desgin/header.jsp"></jsp:include>
 <jsp:include page="desgin/body.jsp"></jsp:include>
	<form method="post" action="topicWriteSave" id="form-diary">
	 <div class="backCss">
	    <div class="topicCss">#${topic} ${topicContent}</div>
		<input type="text" name="title" size="50" placeholder="제목" class="info" id ="title">
		<br>
		<textarea rows="10" name="content" placeholder="내용" class="info"></textarea>
		<br>
		<div class="flex-input">
<!-- 		<input type="submit" value="저장"style='background-color:#FFDA77'":" id="submit"> -->
<!-- 		<input type="reset" value="취소"style='background-color:#FFDA77'":" id="reset"> -->
		<input type="submit" value="저장" id="submit">
		<input type="reset" value="초기화" id="reset">
		</div>
		<input type="hidden" name="topic" value="${topic}">
		<input type="hidden" name="id" value="${dto.id}">
		<input type="hidden" name="name" value="${dto.name}">
	 </div>
    </form>
</body>
</html>
