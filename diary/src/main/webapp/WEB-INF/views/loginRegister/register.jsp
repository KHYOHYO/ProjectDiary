<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<style>
    /* main 내용의 추가 스타일링 */
    #main {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      font-family: 'KOTRAHOPE', 'sans-serif';
    }
       
	/* 중복체크 id, pw, email, hp*/
    .id_ok {
      color: green;
      display: none;
    }
    .id_already {
      color: red;
      display: none;
      position: absolute;
      bottom: 3;
  	  right: 0;
    }
    #alert-success {
      color: green;
      display: none;
    }
    #alert-danger {
      color: red;
      display: none;
      position: absolute;
      bottom: 3;
  	  right: 0;
    }
    .email_ok {
      color: green;
      display: none;
    }
    .email_already {
      color: red;
      display: none;
      position: absolute;
      bottom: 3;
  	  right: 0;
    }
    .hp_ok {
      color: green;
      display: none;
    }
    .hp_already {
      color: red;
      display: none;
      position: absolute;
      bottom: 3;
  	  right: 0;
    }
     
    /* input 박스*/
    article input {
      width: 300px; 
      height: 50px;
	  font-size: .875rem;
      padding-left: 1rem;
      padding-right: 1rem;
      border : 1px solid #FFDA77;
   	  border-radius: 10px; 
	  margin-top: 24px;
	  font-family: 'KOTRAHOPE', 'sans-serif';
       }
       
    /* input 박스 클릭효과*/
	article input:focus {
	  border : 1px solid #FFDA77;
	  outline: 3px solid #FFDA77;
	  outline-offset: 3px;
	}
	
	/* 회원가입 버튼*/
    button {
      width: 300px;
	  height: 50px;
      border-left: none;
      border-top: none;
      border-right: none;
      border-bottom: none;
	  background-color: #FFDA77;
	  border-radius: 10px; 
	  font-family: 'KOTRAHOPE', 'sans-serif';
	  font-size: medium;
	  color: #263A29;
       }
    
	#signupbtn:hover {
	  border: 2px solid #FFDA77;
	  outline: 4px solid #FFDA77;
	  outline-offset: 3px;
    }
    article input:hover{
	  border : 1px solid #FFDA77;
	  outline: 3px solid #FFDA77;
	  outline-offset: 3px;
    }
    
    /* 체크박스 기존 스타일 제거 */
    input[type="checkbox"]{
      display: none;
    }
    /* 체크박스 스타일 */
	input[type="checkbox"] + label{
	  display: inline-flex;
      width: 30px;
	  height: 30px;
	  border: 1px solid #FFDA77;
	  border-radius: 7px; 
	  vertical-align: middle; /* 체크박스 클릭시 안움직이게 고정 */
	}
	/* 체크된 경우에 적용할 스타일 */
	input[type="checkbox"]:checked + label::after{
	  display: inline-block;
	  width: 30px;
	  height: 30px;
	  border-radius: 7px;
	  background-color: #FFDA77;
	  /* 폰트야! */
	  content:'✔';
	  font-size: 20px;
	  font-weight: bold;
	  text-align: center;
	  
	}
	/* 체크박스 스타일 */
	#boxCss{
      margin-right: 20px;
      font-family: 'KOTRAHOPE', 'sans-serif';
	  font-size: small;
	  color: #263A29;
	}
	/* 체크박스 위치 설정 */
	#checkCss{
	  text-align: right;
	  margin-right: 1px;
	}
	
	/* 인풋박스 가운데 정렬 */
	#article{
	  margin-left: 40px;
	}
	/* 회원가입 버튼 가운데 정렬 */
	#signupbtn{
	  margin-left: 60px;
	}
</style>
</head>	
<body>
<jsp:include page="/WEB-INF/views/desgin/header.jsp" />
<jsp:include page="/WEB-INF/views/desgin/body.jsp"/>

  <main id="main">
    <div class="container">
      <!-- 본문 -->
      <section id="section" >
        <article>
          <form method="post" action="registerOk" name="signform" id="signform" onsubmit="return mySubmit()">
	          <div id="article">
	            <table>
	                <tr>
	                  <td colspan="2" >
	                  	<input type="text" size="20" name="id" id="id" 
	                  		   placeholder="아이디 (4자리 이상의 소문자, 숫자)" >
	                  </td>
	                </tr>
	                <tr>
	                  <td colspan="2" style="text-align: right; position: relative;">
	                    <!-- id ajax 중복체크 --> 
<!-- 	                    <span class="id_ok">사용 가능한 아이디입니다.</span>  -->
	                    <span class="id_already">아이디가 이미 존재합니다 :< </span>
	                  </td>
	                </tr>
	                <tr height="50px">
	                  <td colspan="2">
	                  	<input type="password" size="20" name="pwd" id="pwd"
	                  		   placeholder="비밀번호 (영문 대소문자/숫자/특수문자 3가지 이상 조합, 6~16자)">
	                  </td>
	                </tr>
	                <tr height="50px">
	                  <td colspan="2">
	                  	<input type="password" size="20" name="re_pwd" id="re_pwd"
	                 		       placeholder="비밀번호 확인">
	                  </td>
	                </tr>
	                <tr>
	                  <td colspan="2" style="text-align: right; position: relative;">
	                    <!-- pwd ajax 중복체크 -->
<!-- 	                   <span id="alert-success">비밀번호가 일치합니다.</span>  -->
	                   <span id="alert-danger">비밀번호가 일치하지 않습니다 :< </span>
	               </td>
	                </tr>
	                <tr height="50px">
	                  <td colspan="2">
	                  	<input type="text" size="20" name="name" id="name"
	                  	       placeholder="이름">
	                  </td>
	                </tr>
	                <tr height="50px">
	                  <td colspan="2" >
	                    <input type="text" size="20" name="hp" id="hp" onkeyup="phoneNumber(this)"
	                    		 placeholder="전화번호" maxlength="13">
	                  </td>
	                </tr>
	                <tr>
	                  <td colspan="2" style="text-align: right; position: relative;">
	                    <!-- hp ajax 중복체크 -->
<!-- 	                    <span class="hp_ok">사용 가능한 전화번호입니다.</span> -->
	                    <span class="hp_already">전화번호가이미 존재합니다 :< </span>
	                  </td>
	                </tr>
	                <tr height="50px">
	                  <td colspan="2" class="alerts">
	                  	<input type="text" size="20" name="email" id="email"
	                  		   placeholder="이메일">
	                  </td>
	                </tr>
	                <tr>
	                  <td colspan="2" style="text-align: right; position: relative;">
	                    <!-- email ajax 중복체크 --> 
<!-- 	                    <span class="email_ok">사용 가능한 이메일입니다.</span>  -->
	                    <span class="email_already">이메일이 이미 존재합니다 :< </span>
	                  </td>
	                </tr>
	            </table>
	        </div>
			<!-----------체크박스구간------------>
	        <div class="checkbox_group" id="boxCss">
	            <div id="checkCss">
	              <b>전체동의</b>
	              <input type="checkbox" id="check_all">
	              <label for="check_all"></label>
	            </div>
	            <br>
	            <div id="checkCss">
	              <b>[필수]개인정보 처리방침 동의</b>
	              <input type="checkbox" id="check_1" class="normal"> 
	              <label for="check_1"></label>
	              &nbsp;
	              <b>[선택]이메일 수신을 동의</b>
	              <input type="checkbox" id="check_4" name="emails" class="normal" value="N">
	              <label for="check_4"></label>
	            </div>
	            <div id="checkCss">
	              <b>[필수]서비스 이용약관 동의</b>
	              <input type="checkbox" id="check_2" class="normal">
	              <label for="check_2"></label>
	              &nbsp;&nbsp;&nbsp;&nbsp;
	              <b>[선택]SMS 수신을 동의</b>
	              <input type="checkbox" id="check_3" name="sms" class="normal" value="N">
	              <label for="check_3"></label>
	            </div>
	            <br>
	        </div>
	        <!-----------회원가입 버튼------------>
            <table>
              <tr>
                <td>
                  <button type="submit" name="signup" id="signupbtn">회원가입</button>
                </td>
              </tr>
            </table>

            </form>
            <div style="height: 10px;">
				<!-- 공백 생성 -->
            </div>
        </article>
      </section>
    </div>
  </main>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
  /* submit 클릭시 팝업창 */
  var checkEmail = false;
  var checkHp = false;
  var checkId = false;
  var checkPw = false;
  function mySubmit() {
    //             alert("test start 팝업창");
    //          console.log("f");
    // event.preventDefault(); // 제출 동작을 막음
    var id = $("#id").val();
    var pw = $("#pwd").val();
    var re_pw = $("#re_pwd").val();
    var name = $("#name").val();
    var phone = $("#hp").val();
    var email = $("#email").val();
    var sms = $("#check_3").val();
    var emails = $("#check_4").val();

    var idregex = /^[a-z][a-z\d]{3,16}$/;
    var pwregex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,25}$/
    var re_pwregex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,25}$/
    var nameregex = /[가-힣]{1,}/;
    var phoneregex = /^01\d\d{3,4}\d{4}$/;
    // 하이픈을 제거한 전화번호
    var phoneNumberWithoutHyphen = phone.replace(/-/g, '');
    var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

    idregex = idregex.test(id);
    if (!idregex) {
      alert("아이디 양식을 다시 확인해주세요.");
      return false;
    }
    pwregex = pwregex.test(pw);
    if (!pwregex) {
      alert("비밀번호 양식을 다시 확인해주세요.");
      return false;
    }
    re_pwregex = re_pwregex.test(re_pw);
    if (!re_pwregex) {
      alert("비밀번호 확인을 진행해 주세요.");
      return false;
    }
    nameregex = nameregex.test(name);
    if (!nameregex) {
      alert("이름 양식을 다시 확인해주세요.");
      return false;
    }
    phoneregex = phoneregex.test(phoneNumberWithoutHyphen);
    if (!phoneregex) {
      alert("핸드폰 번호 양식을 다시 확인해주세요." + phoneNumberWithoutHyphen);
      return false;
    }
    emailregex = emailregex.test(email);
    if (!emailregex) {
      alert("이메일 양식을 다시 확인해주세요.");
      return false;
    }

    if (checkEmail == false) {
      alert('이메일 중복입니다');
      return checkEmail;
    }
    if (checkHp == false) {
      alert('전화번호 중복입니다');
      return checkHp;
    }
    console.log("checkPw  if==>" + checkPw);
    if (checkId == false) {
      alert('아이디 중복입니다');
      return checkId;
    }
    if (checkPw == false) {
      alert('비밀번호가 일치하지 않습니다');
      return checkPw;
    }

    if ($("input:checkbox[id='check_1']").is(":checked") != true) {
      alert('개인정보 처리방침 약관동의에 체크해 주세요');
      return false;
    }
    if ($("input:checkbox[id='check_2']").is(":checked") != true) {
      alert('서비스 이용약관 동의에 체크해 주세요');
      return false;
    }

    true;
  }

  /* 비밀번호 확인(pwd=re_pwd) */
  $(function () {
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("input").keyup(function () {
      var pwd = $("#pwd").val();
      var re_pwd = $("#re_pwd").val();
      if (pwd != "" || re_pwd != "") {
        if (pwd == re_pwd) {
          $("#alert-success").show();
          $("#alert-danger").hide();
          $("#submit").removeAttr("disabled");
          checkPw = true;
        } else {
          $("#alert-success").hide();
          $("#alert-danger").show();
          $("#submit").attr("disabled", "disabled");
          checkPw = false;
        }
      }
    });
  });

  /* 개인정보동의 체크박스 */
  $(".checkbox_group").on("click", "#check_all", function () {
    var isChecked = $(this).is(":checked");//
    $(this).parents(".checkbox_group").find('.normal').prop("checked", isChecked).val(isChecked ? 'Y' : 'N');
  });

  $(".checkbox_group").on("click", ".normal", function () {
    var is_checked = true;

    $(".checkbox_group .normal").each(function () {
      is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
  });

  /* sms 선택동의 */
  $("#check_3").change(function () {
    console.log("sms 선택 동의 값 변경");
    if (this.checked) {
      $(this).prop('value', 'Y');
      console.log($(this).attr('value'));
    } else {
      $(this).prop('value', 'N');
      console.log($(this).attr('value'));
    }
  });

  /* emails 선택동의 */
  $("#check_4").change(function () {
    console.log("emails 선택 동의 값 변경");
    if (this.checked) {
      $(this).prop('value', 'Y');
      console.log($(this).attr('value'));
    } else {
      $(this).prop('value', 'N');
      console.log($(this).attr('value'));
    }
  });

  /* 이메일 중복검사 */
  $('#email').on("propertychange change keyup paste input", function () {

    $.ajax({
      url: 'emailCheck',
      type: 'post',
      dataType: "json",
      data: { "email": $('#email').val() },
      success: function (data) { //컨트롤러에서 넘어온 cnt값을 받음
        if (data == 0) { //cnt!=1 -> 사용 가능한 이메일
          $('.email_ok').css("display", "inline-block");
          $('.email_already').css("display", "none");
          checkEmail = true;
          console.log("checkEmail data==0" + checkEmail);
        } else { // cnt=1 -> 이미 존재하는 이메일
          $('.email_already').css("display", "inline-block");
          $('.email_ok').css("display", "none");
          checkEmail = false;
          console.log("checkEmail data!=0" + checkEmail);
        }
      },
      error: function () {
        alert("에러입니다");
      }
    });
  });

  /* 전화번호 하이픈 */
  function phoneNumber(input) {
    // 입력된 번호에서 "-"를 제거
//     var hpNumber = input.value.replace(/-/g, '');
    var hpNumber = input.value.replace(/[^0-9]/g, ''); //숫자외 입력 불가

    // "-"를 포함한 적절한 포맷으로 번호를 변경
    if (hpNumber.length === 3) {
      hpNumber = hpNumber;
    } else if (hpNumber.length > 3 && hpNumber.length < 7) {
      hpNumber = hpNumber.slice(0, 3) + '-' + hpNumber.slice(3);
    } else if (hpNumber.length >= 7 && hpNumber.length < 11) {
      hpNumber = hpNumber.slice(0, 3) + '-' + hpNumber.slice(3, 6) + '-' + hpNumber.slice(6);
    } else if (hpNumber.length >= 11) {
      hpNumber = hpNumber.slice(0, 3) + '-' + hpNumber.slice(3, 7) + '-' + hpNumber.slice(7);
    }
    // 변경된 번호를 입력 필드에 반영
    input.value = hpNumber;
  }

  /* 전화번호 중복검사 */
  $('#hp').on("propertychange change keyup paste input", function () {
    var hpNumber = $('#hp').val().replace(/-/g, '');
    $.ajax({
      url: 'hpCheck',
      type: 'post',
      dataType: "json",
      // 	 data:{"hp" : hpNumber},
      data: { "hp": $('#hp').val() },
      success: function (data) { //컨트롤러에서 넘어온 cnt값을 받음
        if (data == 0) { ///cnt!=1 -> 사용 가능한 전화번호
          $('.hp_ok').css("display", "inline-block");
          $('.hp_already').css("display", "none");
          checkHp = true;
        } else { //cnt=1 -> 사용 가능한 전화번호
          $('.hp_already').css("display", "inline-block");
          $('.hp_ok').css("display", "none");
          checkHp = false;
        }
      },
      error: function () {
        alert("에러입니다");
      }
    });
  });
  /* 아이디 중복검사 */
  $('#id').on("propertychange change keyup paste input", function () {
    $.ajax({
      url: 'idCheck', //Controller에서 요청 받을 주소
      type: 'post', //POST 방식으로 전달
      dataType: "json",
      data: { "id": $('#id').val() },
      success: function (data) { //컨트롤러에서 넘어온 cnt값을 받는다 
        if (data == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
          $('.id_ok').css("display", "inline-block");
          $('.id_already').css("display", "none");
          checkId = true;
        } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
          $('.id_already').css("display", "inline-block");
          $('.id_ok').css("display", "none");
          checkId = false;
        }
      },
      error: function () {
        alert("에러입니다");
      }
    });
  });
</script>