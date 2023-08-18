<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String source = request.getParameter("source"); %>
<% String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.backCss textarea,
#submit,
#reset{
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
  !important
}

.topicCss{
  text-align: center;
  font-size: 20px;
  margin-top: 20px;
  margin-bottom: 20px;
}

.backCss input:focus,
.backCss textarea:focus {
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
   <form method="post" action="diaryModify?bid=${contentView.bid}" id="form-diary">
     <div class="backCss">
   	    <div class="topicCss">#${contentView.topic} ${topicContent}</div>
		  <input type="text" name="title" size="50" placeholder="제목" class="info" id ="title" value="${contentView.title}">
		  <br>
		  <textarea rows="10" name="content" placeholder="내용" class="info">${contentView.content}</textarea>
		  <br>
		<div class="flex-input">
		  <button type="submit" id="submit">수정</button>
		  <button type="reset" id="reset">초기화</button>
		</div>
			<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.amount}">
			<input type="hidden" name="bid" value="${pageMaker.bid}">
			<input type="hidden" name="id" value="${param.id}">
			<input type="hidden" name="source" value="${param.source}">
			<input type="hidden" name="keyword" value="${pageMaker.keyword}">
			<input type="hidden" name="type" value="${pageMaker.type}">
     </div>
   </form>
</body>
</html>
