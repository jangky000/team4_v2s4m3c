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
  background: #4aa8d8;
}
</style>
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <div class='menu_line'></div>
 
<DIV class='form'>

      <c:choose>
        <c:when test="${param.cnt == 1 }">
          <DIV style="font-size:20px;" class='title_line'>
			  ♥SKINFIT♥
			  </DIV>
          	회원가입이 완료되었습니다.<br><br>
        </c:when>
        <c:otherwise>
          <LI style='list-style: none;'>회원 가입에 실패했습니다.</LI>
          <LI style='list-style: none;'>다시한번 시도해주세요.</LI>
        </c:otherwise>
      </c:choose>
        <c:choose>
          <c:when test="${param.cnt == 1 }">
            <button type='button' onclick="location.href='./login.jsp'">로그인</button>
          </c:when>
          <c:otherwise>
            <button type='button' onclick="history.back()'">다시 시도</button>
          </c:otherwise>
        </c:choose>        

 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  