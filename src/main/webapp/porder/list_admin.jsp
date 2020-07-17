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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="${root }/javascript/script.js"></script>
  
  <style type="text/css">
    table {
      
    }
    table tr{
     
    }
    table th{
      font-size: 16px;
    }
    table td{
      font-size: 16px;
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
      <h2 style="display: inline;">주문/결제</h2>
      <span style="float: right;">관리자 ＞ <strong style="background-color: #ffffff;">주문 목록 관리</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 주문 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray">
        <h3>주문 목록</h3>
        <div style="text-align: right;">@승인상태: R:request 승인요청 S: success 승인확인, C: cancelled 결제취소</div>
      </div>
      <div style="margin: 20px auto; width: 95%;">
        <table style='width: 100%;'>
          <!-- table 이름 -->
          <thead>
            <tr>
              <th style='text-align: center;'>주문no</th>
              <th style='text-align: center;'>회원번호</th>
              <th style='text-align: center;'>주문날짜</th>
              <th style='text-align: center;'>판매가총액</th>
              <th style='text-align: center;'>할인총액</th>
              <th style='text-align: center;'>쿠폰할인</th>
              <th style='text-align: center;'>배송비</th>
              <th style='text-align: center;'>최종결제금액</th>
              <th style='text-align: center;'>승인상태</th>
              <th style='text-align: center;'>우편번호</th>
              <th style='text-align: center;'>배송지</th>
              <th style='text-align: center;'>배송요청사항</th>
              <th style='text-align: center;'>상세보기</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="porderVO" items="${list }">
              <c:set var="porderno" value="${porderVO.porderno }" />
              <c:set var="memno" value="${porderVO.memno }" />
              <c:set var="rdate" value="${porderVO.rdate }" />
              <c:set var="item_price_sum" value="${porderVO.item_price_sum }" />
              <c:set var="item_discount_sum" value="${porderVO.item_discount_sum }" />
              <c:set var="coupon_discount_sum" value="${porderVO.coupon_discount_sum }" />
              <c:set var="delivery_fee" value="${porderVO.delivery_fee }" />
              <c:set var="payment_price" value="${porderVO.payment_price }" />
              <c:set var="porder_status" value="${porderVO.porder_status }" />
              <c:set var="porder_zip_code" value="${porderVO.porder_zip_code }" />
              <c:set var="porder_address" value="${porderVO.porder_address }" />
              <c:set var="porder_delivery_request" value="${porderVO.porder_delivery_request }" />
              
              <tr> 
                <td style='text-align: center;'>${porderno}</td>
                <td style='text-align: center;'>${memno}</td>
                <td style='text-align: center;'>${rdate} </td>
                <td style='text-align: center;'>${item_price_sum} </td>
                <td style='text-align: center;'>${item_discount_sum} </td>
                <td style='text-align: center;'>${coupon_discount_sum} </td>
                <td style='text-align: center;'>${delivery_fee} </td>
                <td style='text-align: center;'>${payment_price} </td>
                <td style='text-align: center;'>${porder_status}</td>
                <td style='text-align: center;'>${porder_zip_code}</td>
                <td style='text-align: center;'>${porder_address}</td>
                <td style='text-align: center;'>${porder_delivery_request}</td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='../porder_detail/list_admin.do?porderno=${porderno}'">내역보기</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>  
    </div>
    <!-- 주문 정보 종료 -->
    
  </div>
  <!-- 주문/결제 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>