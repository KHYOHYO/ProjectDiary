<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 창을 가운데로 정렬하는 스타일 */
#form-diary{
  display: flex;
  flex-direction: column;
  align-items: center;
/*   justify-content: center; */
  min-height: 85vh; /* 화면 전체 높이에 맞춰 정렬, 최소 높이 설정 */
  box-sizing: border-box; /* padding이 전체 크기에 포함되도록 설정 */
/*   border: 4px solid black; */
  padding: 0px 40px;
}
/*--------------------------------------------------------*/
/* 일기쓰기 a 이동 */
.link-container {
  display: flex;
  gap: 10px; /* 링크 간격 설정 */
  justify-content: center; /* 가운데 정렬 */
  align-items: center;
  margin-top: 20px;
  margin-bottom: 40px;
}

.link-container a:hover{
   outline: 4px solid #FFDA77;
  outline-offset: 3px;
}

.link-row {
  display: flex;
}

.link {
  text-decoration: none;
  color: #263A29;
  border: 1px solid #FFDA77;
  background-color: #FFDA77;
  width: 100px;
  height: 40px;
  border-radius: 8px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 14px; /* 글꼴 크기 조정 */
}

/* #topicCss{ */
/* width: 300px; */
/* font-size: 14px; */
/* } */

/* 토픽 새로고침 할 경우 깜빡이는 애니메이션 효과 추가 */
@keyframes blinkText {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
}

#topicCss {
  width: 300px;
  font-size: 14px;
  /* blinkText 애니메이션 적용 */
  animation: blinkText 0.3s 1;
  animation-fill-mode: forwards; /* 애니메이션 종료 시 마지막 상태 유지 */
}
/*--------------------------------------------------------*/
/* box outline */
#box-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center; 
  width: 100%;
  padding-left: 20px;
/*   border: 4px solid black; */
}

/* a 특유의 글자색 삭제 (가상 클래스 생성으로 인해 기본 스타일 덮어쓰기됨) */
#box a:-webkit-any-link {
    color: inherit; /* 부모 요소의 색상 상속 */
    text-decoration: none; /* 밑줄 제거 */
    cursor: pointer;
}

#box:hover {
  border: 2px solid #FFDA77;
  outline: 4px solid #FFDA77;
  outline-offset: 3px;
}

/* 각각의 box */
#box {
  border: 2px solid #FFE17B;
  display: flex;
  flex-direction: column;
  
  /* 그림자 효과 */
   box-shadow: 0px 4px 6px -2px rgba(0, 0, 0, 0.2),  
   		  	   0px 2px 4px -1px rgba(0, 0, 0, 0.02); 
  
  margin-right: 20px; /* 간격을 위한 마진 추가 */
  margin-bottom: 50px;
  
  /* 추가된 부분: 박스의 크기 계산을 보다 정확하게 조정 */
  box-sizing: border-box;
  width: calc(25% - 20px); /* 4개의 박스가 한 줄에 들어갈 수 있도록 설정 (마진도 고려) */
  height: 200px;
  border-radius: 10px;
  
  padding: 20px; /* 내용을 위한 패딩 추가 */
  overflow: hidden; /* 내용이 넘칠 경우 숨기기 */
  color: #263A29;

  /* 미디어 쿼리 추가: 화면 너비가 일정 값보다 작을 때 */
  @media (max-width: 768px) {
    width: calc(50% - 20px); /* 2개의 박스가 한 줄에 들어갈 수 있도록 설정 (마진도 고려) */
  }
}/* end box */
/*--------------------------------------------------------*/
#title{
  font-size: large;
}

#name_wdate {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

#content {
/*   flex-grow: 1; */
/*   overflow-y: auto; */
  word-wrap: break-word;/* 내용이 길어질 경우 줄바꿈 */
  font-weight: lighter;
}
/*--------------------------------------------------------*/
/* 페이징 css */
.div_page ul{
  display: flex;
  list-style: none;
}

.paginate_button {
  width: 30px;
  height: 30px;
  border-radius: 4px;
  font-weight: bold;
  display: flex;
  justify-content: center; /* 수평 가운데 정렬 */
  align-items: center; /* 수직 가운데 정렬 */
  color: black; /* 숫자 글자색을 검은색으로 설정 */
}

.paginate_button a {
  color: #263A29; /* 페이지 숫자 링크 글자색을 검은색으로 설정 */
  text-decoration: none; /* 페이지 숫자 링크 밑줄 제거 */
}

/* 페이지 숫자에 마우스를 올렸을 때 배경색 설정 */
.paginate_button:hover {
  background-color: #FFE17B; 
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
 <jsp:include page="desgin/header.jsp"></jsp:include>
 <jsp:include page="desgin/body.jsp"></jsp:include>
<main id="form-diary">
 <div class="link-container">
  <a href="topicdiary" id="topicdiary" class="link">다른 주제</a>
  <a href="topicWrite?id=${dto.id}&source=topicdiary&topic=${topic}" class="link">이 주제로 일기쓰기</a>
<%--    <span class="link" style="font-size: 15px; width: 300px;" id="topicCss">#${topic} ${topicContent}</span> --%>
   <span class="link"  id="topicCss">#${topic} ${topicContent}</span>
</div> 
<!-- <a href="#">내가 받은 댓글zz</a>&nbsp;&nbsp; -->
<!-- <a href="#">내가 쓴 댓글</a> -->
<div id="box-container">

  <input type="hidden" name="topic" value="${topic}">
  <c:set var="count" value="1"/>
    <c:forEach items="${list}" var="dto">
    <a class="move_link" href="${dto.bid}">
    <div id="box">
    	<td><input type="hidden" name="count" value="${count}"></td>
    	<div id="name_wdate">
    	  <div id="name">${dto.name} </div>
	      <div id="wdate" align="right">${dto.wdate}</div>
	    </div>
	    <br>
<%-- 	    <div>${dto.hits}</div><br> --%>
	    <div id="title">${dto.title}</div><br>
	    <div id="content">${dto.content}</div><br>
<%-- 	    <div>난비드=>${dto.bid}</div><br> --%>
	    <input type="hidden" name="bid" value="${dto.bid}">
	    <input type="hidden" name="id" value="${dto.id}">
	    <input type="hidden" name="topic" value="${topicContent}">
	    <input type="hidden" name="source" value="mydiary">
	    <a class="move_link" href="${dto.id}"></a>
	    <a class="move_link" href="${dto.bid}"></a>
    </div>
    </a>
  		<c:set var="count" value="${count+1}"/>
    </c:forEach>
<%--     어마운트다=>${pageMaker.cri2.amount} --%>
<%--    페이지넘=>${pageMaker.cri2.pageNum} --%>
</div>
   <div class="div_page">
      <ul>
      	 <c:if test="${pageMaker.prev}">
      	 	<li class="paginate_button">
      	 	<!-- 시작페이지 -1 하면 이전의 10개 페이지 표시 -->
				<!-- ex>11->10(1~10), 21->20(11~20) -->
      	 		<a href="${pageMaker.startPage - 1}">
      	 		<!-- 페이지 버튼 지우면 안됨 -->
      	 			<
      	 		</a>
      	 	</li>
      	 </c:if>
         <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="paginate_button" ${pageMaker.cri2.pageNum == num ? "style='background-color:#FFDA77'":""}>
              <a href="${num}">
              	${num}
              </a>
            </li>         
         </c:forEach>
         <c:if test="${pageMaker.next}">
         	<li class="paginate_button">
				<!-- 끝페이지 +1 하면 이후의 10개 페이지 표시 -->
				<!-- ex>11->10(11~20), 20->21(21~30) -->
      	 		<a href="${pageMaker.endPage + 1}">
      	 		<!-- 페이지 버튼 지우면 안됨 -->
      	 			>
      	 		</a>
      	 	</li>
         </c:if>
      </ul>
   </div>
   
   <form method="get" id="actionForm" action="#">
      <input type="hidden" name="pageNum" value="${pageMaker.cri2.pageNum}">
      <input type="hidden" name="amount" value="${pageMaker.cri2.amount}">
	  <!-- 페이지 이동시 id -->
      <c:if test="${dto != null}">
	    <input type="hidden" name="id" value="${dto.id}">
	  </c:if>
      <input type="hidden" name="topic" value="${topic}">
      
   </form>
</main>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	 var actionForm = $("#actionForm");
	 
	$(".paginate_button a").on("click", function(e){
		e.preventDefault(); //기본 동작 막음 : 페이지 링크를 통해서 이동
// 		console.log("click~!!!");
		console.log("@# href ===>"+$(this).attr("href"));
	    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	    actionForm.submit();
	});
	
/* 게시글 처리 */
	   $(".move_link").on("click", function(e) {
	      e.preventDefault(); //기본 동작 막음 : 페이지 링크를 통해서 이동
	      var targetBno = $(this).attr("href");
		  //?bid 와 name을 매칭
	      actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>");
	      
	      //source 값 전송
	      if (source) {
	          actionForm.append("<input type='hidden' name='source' value='" + source + "'>");
	          console.log("전송할꺼양==>" + source);
	      }
	      actionForm.attr("action", "diaryWriteView2").submit(); //클릭시 해당 게시글로 이동
	      
	   });
</script>
<script>
/* diaryWriteView2.jsp 에서 mydiary 목록으로 돌아오기 위한 변수 */
  var source = "topicdiary";
  console.log("source==>" + source); // source 값을 확인하여 콘솔에 출력
</script>