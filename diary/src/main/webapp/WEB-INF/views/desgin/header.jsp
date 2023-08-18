<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<title>Insert title here</title>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
const bars = document.querySelector(".fas.fa-bars"); // 햄버거 아이콘 선택
const minimenu = document.querySelector("#minimenu");// 줄어든 화면에서 보이는 최소화된 메뉴 선택

function onClick() {
  minimenu.classList.toggle("hidden");// 최소화된 메뉴를 보이거나 숨기기 위해 hidden 클래스를 토글
}

bars.addEventListener("click", onClick); // 햄버거 아이콘을 클릭할 때 onClick 함수 호출

});
</script>

<style>

@font-face {
    font-family: 'KOTRAHOPE';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body, div, a{
  font-family: 'KOTRAHOPE', 'sans-serif'; 
}

* {
  margin: 0;
  padding: 0;
}

a {
  text-decoration: none;
}

li {
  list-style-type: none;
}

.hbody {
/*   background-color: pink; */

  background-color: #3A6351; /*카키*/
  width: 100%;
  height: 100px;
}

.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 50px;
  color: white;
}

.title {
  font-size: 2em;
}

#menu{
display: flex; /* 요소들을 가로로 배열 */
}

#menu li{
margin-right: 30px;
}

.title > a {
  color: white;
}

/* 화면 너비가 625px 이상일 때 미디어 쿼리 내용 */
 @media screen and (min-width: 950px) {
  /* 기존 메뉴 스타일 보이기 */
  #menu {
    display: flex;
  }
  #minimenu {
    display: none;
  }

  #menu > li {
    padding: 20px 30px;
    font-size: 17px;
  }

  #menu > li a:hover {
    border-bottom: 2px solid #F7F1E5;
    padding-bottom: 7px;
  }
  
  #menu li a:focus{
    border-bottom: 2px solid #F7F1E5 !important;
    padding-bottom: 7px !important;
  }
  
  li > a {
    color: white;
  }
  .fas {
    display: none;
  }
  
  /* 햄버거 아이콘 숨기기 */
  .fas.fa-bars {
    display: none;
  }
  
}/* end 화면 너비가 625px 이상일 때 */

/* 화면 너비가 625px 이하일 때 미디어 쿼리 내용 */
@media screen and (max-width: 950px) { 

  /* 햄버거 아이콘 스타일 */
  .fas.fa-bars {
    font-size: 35px;
/*     color: #1DA1F2; */
    color: #white;
    cursor: pointer;
  }

  /* 기존 메뉴 숨기기 */
  #menu {
    display: none;
  }

  /* 줄어든 화면에서 보이는 최소화된 메뉴 스타일 */
  #minimenu {
    width: 100%;
    height: 30vh;
/*     background-color: pink; */
/*     background-color: #3C6255; */
    display: flex; /* 최소화된 메뉴 숨기기 */ 
    flex-direction: column; /* 최소화된 메뉴를 세로로 표시 */
  }

  #minimenu.hidden {
    display: none; /* 최소화된 메뉴 보이기 */
  }

  #minimenu > li {
    font-size: 25px;
    width: 100%;
    height: 10vh;
    display: flex;
    justify-content: center;
    align-items: center;
/*     background-color: 3C6255; */
    
  }

  #minimenu > li:hover {
    background-color: #FFDA77;
    border-radius: 5px;
  }
  #minimenu a{
  	font-size: large;
  }
  
  /* 링크 스타일링 */
  a {
    text-decoration: none;
    color: #263A29;
  }
}/* end 화면 너비가 625px 이하일 때 */
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<header>
  <section class="hbody">
    <article class="nav">
      <div class="title"><a href="main">하루 일기</a></div>
      <ul id="menu">
        <li><a href="topicdiary" >추천 일기 주제</a></li>
        <li><a href="mydiary?id=${dto.id}" id="mydiary">내 일기장</a></li>
<!--         <li><a href="#">우리의 일기장</a></li> -->
        <li><a href="everydiary">모두의 일기장</a></li>
        <!-- 로그인 하지 않은 상태 -->
          <c:if test="${ dto == null }">
           <li><a href="register">회원가입</a></li>
           <li><a href="login">로그인</a></li>
          </c:if>
        <!-- 로그인한 상태 -->
          <c:if test="${ dto != null }">
        	<li><a href="myPage?id=${dto.id}">${dto.name}의 마이페이지</a></li>
            <li><a href="logout">로그아웃</a></li>
          </c:if>
      </ul>
      <i class="fas fa-bars"></i> <!-- 햄버거 아이콘 -->
    </article>
  </section>
  <!-- 줄어든 화면에서 보이는 최소화된 메뉴 -->
  <ul id="minimenu" class="hidden">
    <li><a href="topicdiary" >추천 일기 주제</a></li>
    <li><a href="mydiary?id=${dto.id}" id="mydiary">내 일기장</a></li>
<!--     <li><a href="#">우리의 일기장</a></li> -->
    <li><a href="everydiary">모두의 일기장</a></li>
    <!-- 로그인 하지 않은 상태 -->
      <c:if test="${ dto == null }">
        <li><a href="register">회원가입</a></li>
        <li><a href="login">로그인</a></li>
      </c:if>
    <!-- 로그인한 상태 -->
      <c:if test="${ dto != null }">
        <li><a href="myPage?id=${dto.id}">${dto.name}의 마이페이지</a></li>
        <li><a href="logout">로그아웃</a></li>
      </c:if>
  </ul>
</header>
</body>
</html>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	  const menuItems = document.querySelectorAll("#menu li a");

	  // 메뉴 아이템을 클릭했을 때 clicked 클래스 추가 및 제거
	  menuItems.forEach(item => {
	    item.addEventListener("click", () => {
	      item.classList.toggle("clicked");
	    });
	  });
	});
</script>