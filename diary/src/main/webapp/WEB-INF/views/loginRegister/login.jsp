<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     #id,
     #pwd {
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
     }

     /* input 박스 클릭효과 */
	 #id:focus ,
	 #pwd:focus {
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

	 /* 로그인 버튼 */
     .login_button {
       width: 300px;
	   height: 50px;
       border : #3A6351;
	   color: #263A29;
	   background-color: #FFDA77;
	   border-radius: 10px; 
 	   font-family: 'KOTRAHOPE', 'sans-serif'; 
 	   font-size: medium;
 	   margin-left: 17px;
   	   margin-top: 20px; /* 버튼 위에 공간 추가 */
     }
     #id:hover,
     #pwd:hover,
     .login_button:hover{
	   outline: 4px solid #FFDA77;
	   outline-offset: 3px;
	 }
     /* 로그인 실패시 경고글 */
     .login_warn {
       color: red;
       font-size: small;
       text-align: right;
     }
     
     /* 검색 관련 요소의 스타일링 */
	 .search_idpwd {
	   font-size: small;
	   margin-left: 110px;
	 }
	
	 /* 카카오 로그인 버튼의 스타일링 */
	 #kakao-login-btn {
	   width: 200px;
	   margin-left: 35px;
	 }
	 
	 /* 링크 스타일링 */
	 a {
	   text-decoration: none;
	   color: #263A29;
	 }
	 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/desgin/header.jsp" />
<jsp:include page="/WEB-INF/views/desgin/body.jsp"/>
 <main class="form-signin">
   <form method="post" action="login_yn">
     &nbsp;&nbsp;&nbsp;&nbsp;
     <br><br>
     <div>
       <input type="text" placeholder="아이디" size="25" name="id" id="id">
     </div>
     <br>
     <div>
       <input type="password" placeholder="비밀번호" size="25" name="pwd" id="pwd">
     </div>

     <div class="login_warn" style="margin-top: 10px;">
       <c:if test="${result == 0}">
         아이디 또는 비밀번호를 잘못 입력하셨습니다 :<
       </c:if>
     </div>

     <div style="">
       <input type="submit" value="로그인" name="loginbtn" class="login_button">
     </div>

     <table style="display: inline-block; margin-top: 10px;">
       <form>
         <tr height="30">
           <td colspan="2" align="center">
             <a id="kakao-login-btn"></a>
           </td>
         </tr>
       </form>
     </table>

     <br><br>
     <div class="search_idpwd">
       <a href="userIdSearch">아이디 찾기</a>
       &nbsp;&nbsp;&nbsp;
       <a href="userPwdSearch">비밀번호 찾기</a>
     </div>
   </form>
 </main>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

  /* 카카오톡 가입 */
  Kakao.init('276e47794feabd3fce10bbe075b9934d');
  console.log(Kakao.isInitialized()); //SDK 초기화=true, 초기화X=false 반환

  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function (authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          $('#result').append(kakao_account);
          //                resultdiv="<h2>로그인 성공 !!"
          //                resultdiv += '<h4>id: '+id+'<h4>'
          //                resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
          email = "";
          gender = "";
          if (typeof kakao_account != 'undefined') {
            email = kakao_account.email;
            gender = kakao_account.gender;
          }


          if (id && email) {
            const encodedId = encodeURIComponent(id);
            const encodedEmail = encodeURIComponent(email);
            $.ajax({
              type: "post"
              , url: "register_kakao"
              , data: { "id": encodedId, "email": decodeURIComponent(encodedEmail) }
              , success: function (response) {
                console.log("Encoded ID:", encodedId);
                console.log("Encoded Email:", encodedEmail);
                if (response == "success") {
                  document.location.href = "registerKakaoOk"; // 가입 성공 시
                } else {
                  document.location.href = "login_kakao"; // 이미 가입된 회원인 경우
                }
              },
            })
          } else if (id != null && email == null) {
            const encodedId = encodeURIComponent(id);
            const encodedEmail = encodeURIComponent(email); //이메일 선택동의 수락 안한 경우
            $.ajax({
              type: "post",
              url: "register_kakao",
              data: { "id": encodedId, "email": decodeURIComponent(encodedEmail) },
              success: function (response) {
                console.log("Encoded ID:", encodedId);
                console.log("Encoded Email:", encodedEmail);
                if (response == "success") {
                  document.location.href = "registerKakaoOk"; // 가입 성공 시
                } else {
                  document.location.href = "login_kakao"; // 이미 가입된 회원인 경우
                }
              },

            });
          }

          //                resultdiv += '<h4>email: '+email+'<h4>'
          //                resultdiv += '<h4>gender: '+gender+'<h4>'
          $('#result').append(resultdiv);

        }, //end success: function(result) {
        fail: function (error) {
          alert(
            'login success, but failed to request user information: ' +
            JSON.stringify(error)
          )
        },
      })
    },
    fail: function (err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>