<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="${root }/javascript/script.js"></script>
  
  <style type="text/css">
    body{
      background-color: #D7DCE0;
    }
    
    hr{
      border-top: 1px solid black;
    }
  
    table {
    }
    table tr{
    }
    table th{
    }
    table td{
    }

  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문/결제 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      구매자가 아닌 세션 접근 제한**<br>
      <h2 style="display: inline;">주문/결제</h2>
      <span style="float: right;">1. 장바구니 ＞ 2. 주문/결제 ＞ <strong style="background-color: #ffffff;">3. 주문 완료</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 주문 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray"><h3>주문 완료</h3></div>
      
      <div style="margin: 20px auto; width: 95%;">
        <c:choose>
          <c:when test="${param.porderno != -1 }">
          <div style="text-align: center;">
            <h2 style="margin: 5px;"><span style="color: lightseagreen;">주문이 완료</span>되었습니다. 감사합니다.</h2>
            
            <div style="font-size: 14px;">
              주문일: ${porderVO.rdate.substring(0,10) }, 주문번호: ${porderVO.porderno }
            </div>
            
            <div style="margin: 20px 0; ">
              <button type="button" class='btn btn-info' onclick="location.href='./../'">계속 쇼핑하기</button>
              <button type="button" class='btn btn-info' onclick="location.href='./list.do'">주문확인(주문목록)</button>
            </div>
            
            <hr>
            
            <div>
              <div style="width: 45%; margin-right:5%; display: inline-block;">
                <h3 style="text-align: left; margin: 5px 0;">받는 사람 정보</h3>
                <div style="border: 2px solid gray; background-color: white; border-radius: 5px;">
                  <ul style="list-style: none; margin: 20px 30px 0 30px; padding:0 0 10px 0;">
                    <li style="text-align: left;"><span style="float: left; width: 30%; font-weight: bold;">이름</span><span >왕눈이</span></li>
                    <li style="text-align: left;"><span style="float: left; width: 30%; font-weight: bold;">휴대폰</span><span >010-5555-5555</span></li>
                    <li style="text-align: left;"><span style="float: left; width: 30%; font-weight: bold;">우편번호</span><span>${porderVO.porder_zip_code }</span></li>
                    <li style="text-align: left;"><span style="float: left; width: 30%; font-weight: bold;">배송주소</span><span>${porderVO.porder_address }</span></li>
                    <li style="text-align: left;"><span style="float: left; width: 30%; font-weight: bold;">배송요청사항</span><span>${porderVO.porder_delivery_request }</span></li>
                    <li style="text-align: left;"><br></li>
                  </ul>
                </div>
              </div>
              <div style="width: 45%; display: inline-block;">
                <h3 style="text-align: left; margin: 5px 0;">결제 정보</h3>
                <div style="border: 2px solid gray; background-color: white; border-radius: 5px;">
                  <ul style="list-style: none; margin: 20px 30px 0 30px; padding:0 0 10px 0; border-bottom: 2px solid gray;">
                    <li style="text-align: right;"><span style="float: left; font-weight: bold;">판매가총액</span><span style=""><fmt:formatNumber value="${porderVO.item_price_sum}" type="number"/>원</span></li>
                    <li style="text-align: right;"><span style="float: left; font-weight: bold;">할인총액</span><span >-<fmt:formatNumber value="${porderVO.item_discount_sum}" type="number"/>원</span></li>
                    <li style="text-align: right;"><span style="float: left; font-weight: bold;">쿠폰할인</span><span>-<fmt:formatNumber value="${porderVO.coupon_discount_sum}" type="number"/>원</span></li>
                    <li style="text-align: right;"><span style="float: left; font-weight: bold;">배송비</span><span><fmt:formatNumber value="${porderVO.delivery_fee}" type="number"/>원</span></li>
                  </ul>
                  <div style="padding: 5px 30px; text-align: right;">
                    <span  style="float: left; margin-top: 10px;"><strong>최종 결제 금액</strong></span>
                    <span  style="font-weight: bold; color: gray; font-size: 26px;"><fmt:formatNumber value="${porderVO.payment_price}" type="number"/>원</span>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

          </c:when>
          <c:otherwise>
            주문 실패 cuz 상품이 없어서
            문의하기
            장바구니로 다시 이동
          </c:otherwise>
        </c:choose>
      </div>
        
    </div>
    <!-- 주문 정보 종료 -->
    
  </div>
  <!-- 주문/결제 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>