<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="close-area">X</div>
            <div class="title">
                <h3>비밀번호 조회 결과</h3>
            </div>
            <div class="content" id="pwd_value"></div>
            <!-- 추가: 비밀번호 찾기 제한 오류 메시지 출력 -->
        	<div id="find_pwd_error" style="color: red;"></div> 
    		</div>
   	    </div>

</body>
</html>

