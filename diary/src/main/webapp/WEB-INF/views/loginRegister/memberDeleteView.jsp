<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room and Bloom</title>
<style>
#delForm{
  display: flex;
  align-items: center;
  justify-content: center;
}

#article input {
  width: 280px;
  height: 50px;
  font-size: .875rem;
  padding-left: 1rem;
  padding-right: 1rem;
  border: 1px solid #FFDA77;
  border-radius: 10px;
  margin-bottom: 16px;
  font-family: 'KOTRAHOPE', 'sans-serif';
  background-color: #F7F1E5;
  
}
#userPass:hover {
  border: 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 5px;
}
#userId{
  border: none;
  outline: none;
}
#userPass:focus {
  border: 1px solid #F7F1E5;
  outline: 3px solid #F7F1E5;
  outline-offset: 3px;
}
#delForm{
  border: none;
}

/* 버튼*/
.flex-input{
    margin-left: 10px;
}
.flex-input button {
	width: 100px;
	height: 40px;
	border-left: none;
	border-top: none;
	border-right: none;
	border-bottom: none;
	background-color: #F7F1E5;
	border-radius: 10px;
	font-family: 'KOTRAHOPE', 'sans-serif';
	font-size: medium;
	color: #263A29;
	margin: 7px;
	margin-right: 60px;
}
.flex-input button:hover {
	border: 2px solid #F7F1E5;
	outline: 4px solid #F7F1E5;
	outline-offset: 3px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
var memberId = "<%=request.getParameter("id")%>";
console.log("Member ID:", memberId);

function goBack() {
    // 마이페이지 URL 구성 및 이동
    var myPageUrl = "myPage?id=" + memberId;
    document.location.href = myPageUrl;
}

$(document).ready(function () {
// 	var actionForm = $("#delForm"); // 폼 변수 정의
	
    $("#sub").on("click", function () {
        if ($("#userPass").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#userPass").focus();
            return false;
        } else {
			var pwd = $("#userPass").val();
			console.log("pwd:", pwd);
            if (confirm("회원탈퇴하시겠습니까?")) {
//                 $("#delForm").submit();
//             	actionForm.attr("action", "memberDelete").submit();
//             	$("#delForm").attr("action", "memberDelete").submit();
                var memberId = "<%=request.getParameter("id")%>";
                var url = "memberDelete?id=" + memberId;
				
                // AJAX 요청으로 데이터 전송
                $.ajax({
                    type: "POST", // POST 방식으로 요청
                    url: url, // 요청할 URL
                    data: { pwd: pwd }, // 전송할 데이터
                    success: function(response) {
                        // 서버로부터 응답을 받은 후 처리
                        console.log("서버 응답:", response);
                        // 필요한 후속 작업 수행
                        var successUrl = "main";
	               		window.location.href = successUrl;
                    },
                    error: function(error) {
                        // 오류 처리
                        console.log("오류 발생:", error);
                    }
                });

            }
        }
    });
});

</script>
</head>
<body>
<div id="modal" class="modal-overlay">
 <section id="section">
   <article>
     <div id="article">
        <div style="text-align: center; margin-bottom:60px; margin-right:20px; font-size: x-large;">회원탈퇴 </div>
               
        <form action="memberDelete" method="post" id="delForm">
<!--         <form action="memberDelete" method="post" id="delForm"> -->
          <div>
              <label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<%--               <input type="text" name="id" value="${id}" readonly="readonly" /> --%>
              <input type="text" name="id" value="<%=request.getParameter("id")%>" readonly="readonly" id="userId" />
          </div>
          <br>
          <div>
              <label>비밀번호</label>&nbsp;<br>
              <input type="password" name="pwd" id="userPass" placeholder="비밀번호를 입력하세요"/>
          </div>
          <br>
          <div class="flex-input">
              <button type="button" id="sub" class="btn">회원탈퇴</button>
              <button type="button" onclick="goBack();" class="btn">취소</button>
          </div>
        </form>
 
     </div>
   </article>
 </section>
</div>
</body>
</html>