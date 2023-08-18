<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room and Bloom</title>
<style>
/* main 내용의 추가 스타일링 */
#main {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: 'KOTRAHOPE', 'sans-serif';
	color: #263A29;
	margin-top: 20px;
}
/* ============================================ */
#tdList{
    color: #263A29;
}
/* input 박스*/
article input {
	width: 300px;
	height: 50px;
	font-size: .875rem;
	padding-left: 1rem;
	padding-right: 1rem;
	border: 1px solid #FFDA77;
	border-radius: 10px;
	margin-bottom: 16px;
	font-family: 'KOTRAHOPE', 'sans-serif';
	color: #263A29;
}

/* input 박스 클릭효과*/
.hoverCss:hover {
	border: 1px solid #FFDA77;
	outline: 3px solid #FFDA77;
	outline-offset: 3px;
}
.hoverCss:focus {
	border: 1px solid #FFDA77;
	outline: 3px solid #FFDA77;
	outline-offset: 3px;
}

#id, #name:focus {
	outline: none;
}

#pwd {
	margin-bottom: 3px;
}

#email {
	margin-bottom: 7px;
}
/* ============================================ */
/* 회원가입 버튼*/
.flex-input input {
	width: 100px;
	height: 40px;
	border-left: none;
	border-top: none;
	border-right: none;
	border-bottom: none;
	background-color: #FFDA77;
	border-radius: 10px;
	font-family: 'KOTRAHOPE', 'sans-serif';
	font-size: medium;
	color: #263A29;
	margin: 7px;
}

.flex-input {
	margin-top: 8px;
}

.flex-input input:hover {
	border: 2px solid #FFDA77;
	outline: 4px solid #FFDA77;
	outline-offset: 3px;
}

/* 인풋박스 가운데 정렬 */
#article {
	margin-left: 40px;
}
/* ============================================ */
/* 라디오 버튼 스타일 수정 */
.checkCss input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #FFDA77; /* 노란색 테두리 */
	border-radius: 0; /* 네모 모양 */
	outline: none;
	cursor: pointer;
	margin-right: 10px;
	border-radius: 7px;
	vertical-align: middle; /* 라디오 버튼을 수직 중앙으로 정렬 */
}

.checkCss input[type="radio"]:checked {
	background-color: #FFDA77; /* 선택된 상태의 배경색 */
}

.checkCss input[type="radio"]:hover {
	border: 4px solid #FFDA77;
}
/* ============================================ */
#alert-danger {
	position: absolute;
	bottom: 0;
	right: 0;
	color: red;
}
/* ============================================ */

#modal.modal-overlay {
	width: 400px;
	height: 400px;
	background-color: #FFDA77;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	
	display: none; /* 이건 필수!! */
	align-items: center;
	justify-content: center;
	/* 라운드처리 */
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(30px);
	border-radius: 10px;
}
/* ============================================ */
/* 모달창으로 인해 헤더부분 css 추가 
a {
  text-decoration: none !important;
  color: #263A29;
}
.nav {
  display: flex;
  justify-content: space-between !important;
  align-items: center !important;
  padding: 16px 50px !important;
  padding-bottom: 60px;
  color: white;
}
.title{
  padding-bottom: 15px;
}*/
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/desgin/header.jsp" />
	<jsp:include page="/WEB-INF/views/desgin/body.jsp" />
	<main id="main">
		<article>
			<form action=myPageModify method="post" name="modifyForm">
				<div>
					<div id="tdList">아이디</div>
					<div>
						<input type="text" id="id" name="id" value="${myPage.id}" readonly>
					</div>
				</div>
				<div>
					<div id="tdList">새 비밀번호</div>
					<div>
						<input type="password" id="pwd" name="pwd"
							placeholder="새로운 비밀번호(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8~16자)"
							class="hoverCss">
					</div>
				</div>
				<div>
					<div id="tdList">새 비밀번호 확인</div>
					<div style="position: relative;">
						<input type="password" id="pwd2" placeholder="새로운 비밀번호 확인"
							class="hoverCss">
						<div id="alert-danger">비밀번호가 일치하지 않습니다:<</div>
					</div>
				</div>
				<div>
					<div id="tdList">이름</div>
					<input type="text" name="name" value="${myPage.name}" id="name"
						readonly />
					<%--           <div>${myPage.name}</div> --%>
				</div>
				<div></div>
				<div>
					<div id="tdList">전화번호</div>
					<div>
						<input type="text" name="hp" oninput="hypenTel(this)"
							placeholder="전화번호 입력" maxlength="13" value="${myPage.hp}"
							class="hoverCss" />
					</div>
				</div>
				<div>
					<div>
						<div id="tdList">이메일</div>
						<div>
							<input type="text" name="email" value="${myPage.email}"
								class="hoverCss" id="email">
						</div>
					</div>
		</article>
		<div id="tdList" class="checkCss">
			[선택]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMS 수신여부 &nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${myPage.sms eq 'Y'}">
				<input type="radio" name="sms" id="sms" value="Y" checked="checked" />수신함</label>
				<input type="radio" name="sms" id="sms" value="N" />수신안함</label>
			</c:if>
			<c:if test="${myPage.sms eq 'N'}">
				<input type="radio" name="sms" id="sms" value="Y" />수신함</label>
				<input type="radio" name="sms" id="sms" value="N" checked="checked" />수신안함</label>
			</c:if>
		</div>
		</div>
		<div>
			<div id="tdList" class="checkCss">
				[선택]&nbsp;&nbsp; 이메일 수신여부 &nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${myPage.emails eq 'Y'}">
					<input type="radio" name="emails" id="emails" value="Y"
						checked="checked" />수신함
             <input type="radio" name="emails" id="emails" value="N" />수신안함
          	</c:if>
				<c:if test="${myPage.emails eq 'N'}">
					<input type="radio" name="emails" id="emails" value="Y" />수신함
             <input type="radio" name="emails" id="emails" value="N"
						checked="checked" />수신안함
          	</c:if>
			</div>
		</div>
		<div height="80">
			<div colspan="2" align="center" style="position: relative;"
				class="flex-input">
				<input type="button" onclick="myPageModify()" value="회원정보수정"
					id="modifyButton">
				<input type="reset" value="취소">
<%-- 				<a href="memberDeleteView?id=${myPage.id}"><input type="button" --%>
<!-- 					value="회원탈퇴" id="deleteButton"></a> -->
				<input type="button"
					value="회원탈퇴" id="deleteButton">
			</div>
		</div>
		<%@ include file="/WEB-INF/views/loginRegister/memberDeleteView.jsp"%>
		</form>
	</main>
</body>
</html>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
/* pwd=pwd2 실시간 유효성 검사 */
$(function(){
    $("#alert-success").hide(); 
    $("#alert-danger").hide();
    $("input").keyup(function(){
        var pwd=$("#pwd").val();
        var pwd2=$("#pwd2").val();
        if(pwd != "" || pwd2 != ""){
            if(pwd == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#submit").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#submit").attr("disabled", "disabled");
            }    
        }
    });
});
</script>
<!--============================================================================-->
<script type="text/javascript">
   
  //새비밀번호, 새비밀번호 확인 일치
  function myPageModify(){
     let pwd = document.getElementById("pwd").value;
     let pwd2 = document.getElementById("pwd2").value;
     
     if (pwd === "" || pwd2 === "") {
         alert("비밀번호를 입력해주세요.");
         return;
     }
     if (pwd == pwd2) {
     modifyForm.submit();         
     }else {
        alert("비밀번호가 일치하지 않습니다.")
     }
  }
  
  //전화번호 자동 하이픈
  const hypenTel = (target) => {
     target.value = target.value
       .replace(/[^0-9]/g, '')
       .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }

  function fn_submit() {
     
     var pwd = document.getElementById("pwd").value;
     var pwd2 = document.getElementById("pwd2").value;
     
     if (pwd === "" || pwd2 === "") {
         alert("비밀번호를 입력해주세요.");
         return;
     }
     
     if (pwd !== pwd2) {
         alert("비밀번호가 일치하지 않습니다.");
         return;
     }
     
     alert('회원정보수정 완료');
  }
  
  
  const modal = document.getElementById("modal")
  const btnModal = document.getElementById("deleteButton")

  btnModal.addEventListener("click", e => {
      modal.style.display = "flex"
  })
      
  const closeBtn = modal.querySelector(".close-area")
  closeBtn.addEventListener("click", e => {
      modal.style.display = "none"
  })

  modal.addEventListener("click", e => {
      const evTarget = e.target
      if(evTarget.classList.contains("modal-overlay")) {
          modal.style.display = "none"
      }
  })
</script>
