<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>♥SKINFIT♥</title>
  
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${root }/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="${root }/javascript/script.js"></script>


<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_send').on('click', send); 
  });

  function send() {
    alert('연락처가 수정되었습니다.');
    $('#frm').submit();
  }
  
</script>

<style>
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 450px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #80c1e1;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #ffb6c1;
}
</style>
</head> 
 
 
<body onload="showImage()">
<jsp:include page="/menu/top.jsp" flush='false' />

<div class="form" style="margin:20px auto; width:80%; text-align:center">
	<div style="font-size:20px;" class='title_line'>연락처 수정</div><br>
			♥SKINFIT♥에서 중요 내용을 알려드릴 때<br>
			 사용하는 연락처 정보입니다.<br>
		         정확한 정보를 기입해주세요.<br><br><br>

   
<FORM class="login-form" name='frm' id='frm' method='POST' action='./contact_update.do' class="form-horizontal">
    <input type='hidden' name='memno' id='memno' value='${param.memno }'>       

    <div>
        <input type='text' name='mem_email' id='mem_email' value='${memVO.mem_email }' required="required" >
        <input type='text' name='mem_telecom' id='mem_telecom' value='${memVO.mem_telecom }' required="required">
        <input type='text' name='mem_phone' id='mem_phone' value='${memVO.mem_phone }' required="required">
        <br><br>
        <button type="button" id='btn_send'>변경</button><br><br>
        <button type="button" onclick="location.href='./mypage.do?memno=${memno}'">취소</button>
    </div>
</FORM>
</div> 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
