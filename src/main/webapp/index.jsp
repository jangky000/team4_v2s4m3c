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
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="./javascript/script.js"></script>
</head>

<body onload="showImage()">
<jsp:include page="/menu/top.jsp" flush='false' />

      <img id="introImg" border="0">
      <div style="margin:20px auto; width:80%">
      <!--  ★★★★여기 안에 작업해 주세요★★★★-->
        <a href="/team4/shopping_cart/list.do">▷ 쇼핑카트</a><br>
        <a href="/team4/porder/list.do">▷ 내 페이지 ▷ 주문확인</a><br>
        <a href="/team4/porder/list_admin.do">▷ 관리자 ▷ 결제확인</a><br>
        <a href="/team4/porder_detail/list_admin.do">▷ 관리자 ▷ 결제내역확인</a><br>
        <a href="/team4/delivery/list_seller.do">▷ 관리자 ▷ 주문/배송 관리</a><br>
        <a href="/team4/coupon/list.do">▷ 관리자 ▷ 이벤트 쿠폰</a><br>
        <a href="/team4/coupon_issue/list.do">▷ 관리자 ▷ 쿠폰 발급 내역</a><br>
        <a href="/team4/coupon_use/list.do">▷ 관리자 ▷ 쿠폰 사용 내역</a><br>
      </div>

 <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>