<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>SKINFIT</title>
</head>
<body>
  <c:choose>
    <c:when test="${param.cnt ==1 }">
      등록 완료
    </c:when>
    <c:otherwise>
      등록 실패
    </c:otherwise>
  </c:choose>
</body>
</html>