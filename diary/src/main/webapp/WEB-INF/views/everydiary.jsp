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
/* 찾기 */
#searchForm{
/*
  color: #263A29;
  border: 1px solid #FFDA77;
  background-color: #FFDA77;
  
  line-height: 40px; /* 텍스트 수직 가운데 정렬을 위한 높이 설정 */
  display: flex; /* 요소를 플렉스 박스로 만들어주는 역할 */
  justify-content: center; /* 가로 가운데 정렬 */
  align-items: center; /* 세로 가운데 정렬 */
  margin-top: 20px;
  margin-bottom: 30px;

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
}
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
/*--------------------------------------------------------*/
  /* 검색 폼 스타일 */
  #searchForm {
    background-color: #FFE17B;
    padding: 10px;
    border-radius: 10px; /* 둥글게 처리 */
    display: inline-flex;
    align-items: center;
  }

  #searchForm select,
  #searchForm input[type="text"],
  #searchForm button {
    font-size: 16px;
    padding: 5px;
    border: none;
  }
  /* 선택 창 */
  #searchForm select {
    width: 155px;
    background-color: #F7F1E5; /* 선택 창 색 변경 */
    color: #263A29;
    border-radius: 7px;
    font-family: 'KOTRAHOPE', 'sans-serif' !important;
    outline: none;
  }
  /* 검색 창 */
  #searchForm input[type="text"] {
    margin-left: 10px;
    width: 300px;
    background-color: #F7F1E5;
    border-radius: 7px;
    font-family: 'KOTRAHOPE', 'sans-serif' !important;
    outline: none;
  }
  /* 검색 버튼 */
  #searchForm button {
    margin-left: 10px;
    border-radius: 5px;
    background-color: #F7F1E5;
    color: #263A29;
    cursor: pointer;
    padding: 5px 0px; 
    width: 54px; /* 버튼 너비 고정 */
    font-family: 'KOTRAHOPE', 'sans-serif' !important;
  }

#searchForm input[type="text"]:focus{
  border : 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 3px;
}
#searchForm button:hover{
  border : 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 3px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
 <jsp:include page="desgin/header.jsp"></jsp:include>
 <jsp:include page="desgin/body.jsp"></jsp:include>
<main id="form-diary">
   <form id="searchForm" method="get">
   	  <select name="type">
		<option value="" <c:out value="${pageMaker.cri.type == null? 'selected' : ''}"/>>선택</option>
        <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
        <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
        <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 OR 내용</option>
        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 OR 작성자</option>
        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>제목 OR 내용 OR 작성자</option>
   	  </select>
	   <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
	   <button>검색</button>
   </form>
<div id="box-container">
  <c:set var="count" value="1"/>
    <c:forEach items="${list}" var="dto">
<%--     <a href="diaryWriteView2?bid=${dto.bid}" > --%>
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
<%-- <div>난비드=>${dto.bid}</div><br> --%>
	    <input type="hidden" name="bid" value="${dto.bid}">
	    <input type="hidden" name="id" value="${dto.id}">
	    <input type="hidden" name="topic" value="${dto.topic}">
	    <input type="hidden" name="source" value="everydiary">
	    <a class="move_link" href="${dto.id}"></a>
	    <a class="move_link" href="${dto.bid}"></a>
    </div>
    </a>
  		<c:set var="count" value="${count+1}"/>
    </c:forEach>
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
            <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:#FFDA77'":""}>
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
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	  <!-- 페이지 이동시 id -->
      <c:if test="${dto != null}">
	    <input type="hidden" name="id" value="${dto.id}">
	  </c:if>

    <!-- type과 keyword가 있을 경우 추가 -->
    <c:if test="${not empty pageMaker.cri.type}">
        <input type="hidden" name="type" value="${pageMaker.cri.type}">
    </c:if>
    
    <c:if test="${not empty pageMaker.cri.keyword}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    </c:if>
      
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
/* diaryWriteView2.jsp 에서 everydiary 목록으로 돌아오기 위한 변수 */
  var source = "everydiary";
  console.log("source==>" + source); // source 값을 확인하여 콘솔에 출력
</script>
<script>
var searchForm = $("#searchForm");

//Search 버튼 클릭
$("#searchForm button").on("click",function(){
	var bno = actionForm.find("input[name='bid']").val();
    if (bno != '') {
       actionForm.find("input[name='bid']").remove();
    }
    
if (!searchForm.find("option:selected").val()){//값이 없으면
		   alert("검색종류를 선택하세요");
	   	   return false;
	   }
	   if (!searchForm.find("input[name='keyword']").val()){//값이 없으면
		   alert("키워드를 입력하세요");
	   	   return false;
	   }
	   searchForm.attr("action","everydiary").submit();
})
</script>