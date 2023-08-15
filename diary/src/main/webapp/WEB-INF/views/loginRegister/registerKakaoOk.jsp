<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
     .loginbtn {
       border-top: none;
       border-left: none;
       border-right: none;
       width: 300px; 
       height: 50px;
	   font-size: .875rem;
	   padding-left: 1rem;
	   padding-right: 1rem;
	   border : 1px solid #FFDA77;
 	   border-radius: 10px; 
 	   margin-top: 15px;
 	   font-family: 'KOTRAHOPE', 'sans-serif';
 	   background-color: #FFDA77;
     }

     /* input 박스 클릭효과 */
	 .loginbtn:hover {
	   border : 1px solid #FFDA77;
	   outline: 3px solid #FFDA77;
	   outline-offset: 3px;
	 }
	 
	 /* 창을 가운데로 정렬하는 스타일 */
	 .form-signin {
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   justify-content: center;
	   height: 75vh; /* 화면 전체 높이에 맞춰 정렬 */
	 }
	 
	 .text{
	   text-align: center;
	   font-size: large;
	   color: #263A29;
	 }  
	 #title{
	   font-size: x-large;
	 }
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/desgin/header.jsp" />
<jsp:include page="/WEB-INF/views/desgin/body.jsp"/>
 <main class="form-signin">
      <div >
         <form action="login" method="post">
            <div class="text" id="title"><strong>카카오 간편 회원가입 완료</strong></div>
            <br><br>
            <div class="text">아이디 : &nbsp; ${id} 님 가입을 축하합니다!</div>
            <br>
            <div class="text">(이메일 : &nbsp; ${email})</div>
            <br><br>
            <div><input type="submit" value="로그인" name="loginbtn" class="loginbtn"></div>
         </form>
      </div>
 </main>

</body>
</html>
