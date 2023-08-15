<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String source = request.getParameter("source"); %>
<% String id = request.getParameter("id"); %>
<%
String bid = request.getParameter("bid");
session.setAttribute("bid", bid);
%>
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
  left: 50%;
  transform: translate(-50%, -50%);
  margin-top: 50px; /* 높이의 절반을 빼서 상단 여백 조절 */
  
  font-family: 'KOTRAHOPE', 'sans-serif'; 
  color : #263A29;
  font-size : large;
}

/* 제목 내용 CSS */
.backCss .topicCss{
  width: 80%;
/*   margin: 10px auto; /* 수평 중앙 정렬 */ */
  display: block; /* 블록 요소로 변경하여 줄 바꿈을 위한 처리 */
  align-items: center;
  margin-top: 7px;
  margin-left: 46px;
  border: none;
  text-decoration: none;
  background-color: #FFDA77; 
  padding: 10px; 
  border-radius: 10px; 
  text-align: center; 
  font-size: 20px;
  font-family: 'KOTRAHOPE', 'sans-serif'; 

  resize: none; /* textarea 내용 크기 조절 비활성화 */
}
/* #토픽 */
#titleInfo1{
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
}
/* 이름/날짜/제목/내용 */
.titleInfo{
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
  margin: 10px auto; /* 수평 중앙 정렬 */
}

.titleCss,
.infoCss,
.infoCss2,
.infoCss3{
  background-color: #F7F1E5;
  padding: 8px; 
  border-radius: 10px;
  margin: 12px;
  text-align: center;
  color: #263A29;
  }
.titleCss{
  width: 9%;
  align-items: center; /* 세로 중앙 정렬 */
}
.infoCss{
  width: 20%;
}
.infoCss2,
.infoCss3{
  width: 60%;
  display: flex;
  align-items: center;
  padding-left: 24px;
}
.infoCss3{
  margin-bottom: 0px;
}
#name{
  width: 17%;
  display: flex;
  align-items: center;
  padding-left: 24px;

}
.infoCss3{
  height: 290px;
  /*text 좌측정렬 */
/*   display: flex;
/*   align-items: center; */
  
}

.flex-inputA{
  display: flex;
  align-items: center;
  justify-content: center;
}

.backCss a,
.backCss button{
  background-color: #F7F1E5;
  padding: 8px; 
  border-radius: 10px;
  border: none;
  width: 100px;
  height: 40px;
  display: inline-block; /* 수정 */
  text-align: center;
  font-size: large;
  font-family: 'KOTRAHOPE', 'sans-serif'; 
  margin: 8px 35px;
  color: #263A29;
  
}
.backCss a:hover,
.backCss button:hover{
  border : 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 3px;
}
.backCss a{
  height: 24px;
  width: 85px;
  
}
/* 댓글 */

#commentBox{
/*     background-color: white;  */
    width: 580px;
    height: 580px;
    border-radius: 30px;
    position: absolute;
    transform: translate(-50%);
    left: 50%;
    margin-top: 350px; /* 변경: form-diary 아래에 위치하도록 */
    
    resize: none; /* textarea 내용 크기 조절 비활성화 */
}

/* 댓글 리스트 */
.comment-header{
  text-align: right;
  color: #263A29;
}
#comment-delete{
  color: #263A29;
}
#comment-delete:hover{
  background-color: pink;
  border-radius: 8px;
}
.comment-content{
  padding: 8px; 
  border-radius: 16px;
  border: 3px solid #FFDA77;
/*   margin: 12px; */
  text-align: left;
  color: #263A29;
  background-color: #FFDA77;
  width: 550px;
}

/* 댓글 쓰기 */
#comments-name{
  margin-left: 15px;
}
#comments-submit {
  margin-right: 15px;
  color: #263A29;
}
#comments-submit:hover{
  background-color: #FFDA77;
  border-radius: 8px;
}
.comments-header{
  margin-bottom: 10px;
  
  display: flex;
  justify-content: space-between;
  align-items: center;
}

#comments{
/*   margin-top: 10px; */
  margin-left: 5px;
  margin-bottom: 10px;
  padding: 8px; 
  border-radius: 16px;
  border: 3px solid #FFDA77;
  text-align: left;
  color: #263A29;
  
  background-color: #F7F1E5;
  outline: 4px solid #FFDA77;
  outline-offset: 3px;
    
  width: 540px;
  height: 70px;
  resize: none; /* 사용자가 크기 조절할 수 없도록 설정 */
  font-family: 'KOTRAHOPE', 'sans-serif'; 
  font-size: medium;
}

/*--------------------------------------------------------*/
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
 <jsp:include page="desgin/header.jsp"></jsp:include>
 <jsp:include page="desgin/body.jsp"></jsp:include>
 <main id="form-diary">
   <div class="backCss">
 	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="bid" value="${writeView2.bid}">
	<input type="hidden" name="id" value="${writeView2.id}">
	<input type="hidden" name="source" value="everydiary">
	<form method="post" id="actionForm">
		<div class="topicCss">#${writeView2.topic} ${topicContent}</div>
		<div class="" id="titleInfo1">
			<div class="titleCss">이름</div>:
			<div class="infoCss" id="name">${writeView2.name}</div>
			<div class="titleCss">날짜</div>:
			<div class="infoCss">${writeView2.wdate}</div>
		</div>
		<div class="titleInfo">
			<div class="titleCss">제목</div>:
			<div class="infoCss2">${writeView2.title}</div>
		</div>
		<div class="titleInfo">
			<div class="titleCss">내용</div>:
			<div class="infoCss3">${writeView2.content}</div>
		</div>
<%-- 		<div class="infoCss">조회수 : ${writeView2.hits}</div> --%>
		
	<!-- type과 keyword가 있을 경우 추가 -->
    <c:if test="${not empty pageMaker.cri.type}">
        <input type="hidden" name="type" value="${pageMaker.cri.type}">
    </c:if>
    <c:if test="${not empty pageMaker.cri.keyword}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    </c:if>
	</form>		
	
    <div class="flex-inputA">
	<!-- 목록버튼 source에 따라서 주소 변경 -->
	<c:choose>
	    <c:when test="${param.source eq 'mydiary'}">
	        <a href="mydiary?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&id=${dto.id}">목록</a>
	    </c:when>
	    <c:when test="${param.source eq 'everydiary' && empty(pageMaker.cri.keyword)}">
	        <a href="everydiary?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">목록</a>
	    </c:when>
	    <c:when test="${param.source eq 'everydiary' && not empty(pageMaker.cri.keyword)}">
	        <a href="everydiary?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">목록</a>
	    </c:when>
	    <c:when test="${param.source eq 'topicdiary'}">
	        <a href="topicdiary?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&topic=${topic}">목록</a>
	    </c:when>
	</c:choose>

	<!-- 글 작성자와 로그인유저가 같을 경우 수정&삭제 버튼 활성화 -->	
	<c:if test="${param.id eq writeView2.id}">
		 <button type="button" onclick="fn_update('${writeView2.bid}', event)">수정</button>
		 <button type="button" onclick="fn_delete('${writeView2.bid}', event)">삭제</button>
	</c:if>
	</div>
	
   </div>
 </main>
 
 <div id="commentBox" class="comment-box">
 	<!-- 댓글 작성 폼 -->
	<div class="container">
	    <form id="commentForm" name="commentForm" method="post">
	        <div>
	            <div class="comments-header">
	                <div id="comments-name"><strong>댓글</strong></div>
                    <div>
                      <a href='#' onClick="fn_comment()" class="btn pull-right btn-success" id="comments-submit">등록</a>
                    </div>
                </div>
	            <div>
	                <table class="table">                    
	                    <tr>
	                        <td>
								<!-- <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comments" placeholder="내용을 입력하세요"></textarea> -->
	                            <textarea id="comments" name="comments" placeholder="내용을 입력하세요"></textarea>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	        <input type="hidden" id="name" name="name" value="${dto.name}" />        
	        <input type="hidden" id="id" name="id" value="${dto.id}" />        
	        <input type="hidden" id="bid" name="bid" value="${writeView2.bid}" />        
	    </form>
	</div>
 
	<!-- 댓글 리스트 -->
	<!-- 댓글 작성자와 로그인유저가 같을 경우 댓글 삭제버튼 활성화 -->
	<c:forEach items="${writeView2.commentList}" var="dto">
	<%--${dto.ccode} ${dto.name} ${dto.comments} ${dto.wdate} 1.${dto.id}  2.${param.id} --%>
		 <div class="comment-item">
		  <div class="comment-header">
		  	 ${dto.name}&nbsp;/&nbsp; ${dto.wdate} &nbsp;
			 <c:if test="${param.id eq dto.id}">
			    <a href='#' onClick="fn_commentDelete('${dto.ccode}')" id="comment-delete">삭제</a>
			 </c:if>
             <c:if test="${param.id ne dto.id}">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             </c:if>
             &nbsp;&nbsp;
		  </div>
		 </div> 
		 <div class="comment-content">${dto.comments}</div>
			<br>
	</c:forEach>
		
 </div>
</body>
</html>
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(){
    $.ajax({
        type:'POST',
        url : "commentWrite",
        data:$("#commentForm").serialize(),
        success : function(data){
            	location.reload();
        },
        error:function(request,status,error){
            alert("등록 실패");
       }
        
    });
}

/*
 * 댓글 삭제하기(Ajax)
 */
function fn_commentDelete(ccode){
    $.ajax({
        type:'POST',
        url : "commentDelete",
        data: { "ccode": ccode },
        success : function(data){
            	location.reload();
        },
        error:function(request,status,error){
            alert("삭제 실패");
       }
        
    });
}
</script>
<script>var source = '<%= request.getParameter("source") %>';</script>
<script type="text/javascript">
function fn_update(bid, e) {
    e.preventDefault(); // 기본 동작 막음: 페이지 링크를 통해서 이동
    var targetBno = bid;
    
    // 폼 요소를 찾음
    var actionForm = $("#actionForm");
    
    actionForm.append("<input type='hidden' name='bid' value='" + targetBno + "'>");
    actionForm.append("<input type='hidden' name='id' value='${param.id}'>");
    //여기 추가해본거 수정때문에
    actionForm.append("<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>");
    actionForm.append("<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>");
    actionForm.append("<input type='hidden' name='source' value='${param.source}'>");
//     actionForm.append("<input type='hidden' name='total' value='${pageMaker.total}'>");
    
    if (source) {
        actionForm.append("<input type='hidden' name='source' value='" + source + "'>");
        console.log("전송할꺼양==>" + source);
    }
    actionForm.attr("action", "contentView").submit(); // 클릭하면 해당 게시글로 이동
}
</script>
</script>
	<script type="text/javascript">
		function fn_delete(bid, e){
			e.preventDefault();
			var targetBno = bid;
			var actionForm = $("#actionForm");
			actionForm.append("<input type='hidden' name='bid' value='" + targetBno + "'>");
	        actionForm.append("<input type='hidden' name='source' value='" + source + "'>");
			actionForm.append("<input type='hidden' name='id' value='${param.id}'>");
			actionForm.append("<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>");
			actionForm.append("<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>");
			
			if(confirm("정말 삭제하시겠습니까?"))
				 actionForm.attr("action", "diaryDelete").submit(); // 클릭하면 해당 게시글로 이동
// 				document.location.href="diaryDelete?bid="+${writeView.bid};
			
		}
	</script>