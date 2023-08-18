<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Room and Bloom</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<style>

#modal.modal-overlay {
	width: 250px;
	height: 250px;
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

/*#modal .modal-window {
	background: #ffffff;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	border-radius: 10px;
	border: 1px solid gray;
	width: 400px;
	height: 250px;
	position: relative;
	top: -100px;
	padding: 10px;
}
*/
#modal .title {
	padding-left: 10px;
	display: inline;
	color: black;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 70px;
	padding: 0px 10px;
	color: blacks;
}
/* ============================================ */
.w3-input {
	border-top: none;
	border-left: none;
	border-right: none;
	width: 330px; 
	height: 50px;
	font-size: .875rem;
	padding-left: 1rem;
	padding-right: 1rem;
	border : 1px solid #FFDA77;
	border-radius: 10px; 
	margin-bottom: 20px;
	font-family: 'KOTRAHOPE', 'sans-serif'; 
}
/* input 박스 클릭효과 */
.w3-input:hover {
	border : 1px solid #FFDA77;
	outline: 3px solid #FFDA77;
	outline-offset: 3px;
}
.w3-input:focus {
	border : 1px solid #FFDA77;
	outline: 3px solid #FFDA77;
	outline-offset: 3px;
}

/* 버튼 */
#find_pwd ,
#back{
	width: 300px;
	height: 50px;
	border : #3A6351;
	color: #263A29;
	background-color: #FFDA77;
	border-radius: 10px; 
	font-family: 'KOTRAHOPE', 'sans-serif'; 
	font-size: medium;
	margin-top: 20px; /* 버튼 위에 공간 추가 */
}
   
/* 창을 가운데로 정렬하는 스타일 */
#searchpage {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 75vh; /* 화면 전체 높이에 맞춰 정렬 */
	margin-top: 45px;
}

#title{
	text-align: left;
	color: #263A29;
	margin-left: 10px;
}

a {
  text-decoration: none !important;
  color: #263A29;
}
.nav {
  display: flex;
  justify-content: space-between !important;
  align-items: center !important;
  padding: 18px 50px !important;
  padding-bottom: 60px;
  color: white;
}
.title{
  padding-bottom: 18px;
}
</style>

<!-- Custom styles for this template -->
<!-- <link href="css/signin.css" rel="stylesheet"> -->

</head>

<body>
<jsp:include page="/WEB-INF/views/desgin/header.jsp" />
<jsp:include page="/WEB-INF/views/desgin/body.jsp"/>
<!-- 본문 -->
<div id="searchpage">
	<main>
		<!--파일 불러오기-->
		<%@ include file="./Modal2.jsp"%>
		<div align="center">
		  <div>
			<div id="title">아이디</div>
			<input class="w3-input" type="text" id="id"
						name="id" placeholder="아이디를 입력해주세요." required>
		  </div>
		  <div>
			<div id="title">이름</div>
			<input class="w3-input" type="text" id="name"
						name="name" placeholder="이름을 입력해주세요." required>
		  </div>
		  <div>
			<div id="title">전화번호</div>
			<input class="w3-input" type="text" id="hp" onkeyup="phoneNumber(this)"
						name="hp" placeholder="전화번호를 입력해주세요." required>
		  </div>
		  <div>
			<div id="title">이메일</div>
			<input class="w3-input" type="text" id="email" 
						name="email" placeholder="이메일을 입력해주세요." required>
		  </div>
		  <div>
			<button type="button" id="find_pwd" onclick="findPwd_click()">비밀번호 찾기</button>
		  </div>
		  <div>
			<button type="button" onclick="history.go(-1);" id="back" >뒤로가기</button>
		  </div>
	</main>
</div>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   /* 비밀번호 찾기 */ 
   function findPwd_click(){
      var id=$('#id').val()
      var name=$('#name').val()
      var hp=$('#hp').val()
      var email=$('#email').val()
      $.ajax({
         url:"./find_pwd",
         type:"POST",
         data:{"id":id, "name":name, "hp":hp, "email":email} ,
         success:function(data){
            if(!data){
               $('#pwd_value').text("회원 정보를 확인해주세요!");
               $('#id').val('');
               $('#name').val('');
               $('#hp').val('');
               $('#email').val('');
            } else if (data == 'end') { // 추가: 비밀번호 찾기 제한 오류 메시지 처리
                 $('#find_pwd_error').text("비밀번호 찾기는 하루에 2회까지만 가능합니다.");
             } else {
//                var hiddenData = data.slice(0, -5) + "*****";
               var hiddenData = "";
               // 랜덤 자리수 선택
               var indexesToHide = [];
               while (indexesToHide.length < 5) {
                 var randomIndex = Math.floor(Math.random() * data.length);
                 if (!indexesToHide.includes(randomIndex)) {
                   indexesToHide.push(randomIndex);
                 }
               }

               // 문자열 가리기
               for (var i = 0; i < data.length; i++) {
                 if (indexesToHide.includes(i)) {
                   hiddenData += "*";
                 } else {
                   hiddenData += data[i];
                 }
               }
//                $('#pwd_value').text(data);
               $('#pwd_value').text(hiddenData);
               $('#id').val('');
               $('#name').val('');
               $('#hp').val('');
               $('#email').val('');
               
            }
         },
          error:function(){
        	  alert("비밀번호 찾기 요청 중 오류가 발생했습니다. 다시 시도해주세요.");
               }
      });
   };

const modal = document.getElementById("modal")
const btnModal = document.getElementById("find_pwd")

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

/* 전화번호 하이픈 */
function phoneNumber(input) {
     // 입력된 번호에서 "-"를 제거
     var hpNumber = input.value.replace(/-/g, '');

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
</script>