<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
      border-collapse: collapse;
    }
    table tr{
     border: 1px solid white;
    }
    table th{
      font-size: 16px;
    }
    table td{
      font-size: 16px;
      /* border: 1px solid white; */
    }
    
    b {
      margin: 0 10px;
    }

  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문목록/배송조회 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      <h2 style="display: inline;">주문목록/배송조회</h2>
      <span style="float: right;"> 마이페이지 ＞ <strong style="background-color: #ffffff;">주문목록/배송조회</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 주문목록/배송조회 정보 시작 -->
    <div style="margin: 60px auto; width:80%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray">
        <h3>전체</h3>
      </div>
      <div style="margin: 20px auto; width: 95%;">
        <!-- porder 박스 시작 -->
        <table style="width: 100%;">
          <colgroup>
              <col style="width: 20%;"></col>
              <col style="width: 50%;"></col>
              <col style="width: 30%;"></col>
            </colgroup>
          <c:set var="prev" value="-999" />
          <c:forEach var="porder_detail_itemVO" items="${list }">
            <c:set var="porderno" value="${porder_detail_itemVO.porderVO.porderno }" />
            <c:set var="rdate" value="${porder_detail_itemVO.porderVO.rdate }" />
            <c:set var="payment_price" value="${porder_detail_itemVO.porderVO.payment_price }" />
            
            <c:set var="quantity" value="${porder_detail_itemVO.porder_detailVO.quantity }" />
            <c:set var="porder_detailno" value="${porder_detail_itemVO.porder_detailVO.porder_detailno }" />
            <c:set var="de_payment_price" value="${porder_detail_itemVO.porder_detailVO.payment_price }" />
            
            <c:set var="itemno" value="${porder_detail_itemVO.itemVO.itemno }" />
            <c:set var="item_name" value="${porder_detail_itemVO.itemVO.item_name }" />
            <c:set var="item_type" value="${porder_detail_itemVO.itemVO.item_type }" />
            <c:set var="thumb" value="${porder_detail_itemVO.itemVO.thumb }" />
            
            <c:choose>
              <c:when test="${prev == porderno }">
                <!-- 헤더 스킵 -->
              </c:when>
              <c:otherwise>
                <c:set var="prev" value="${porderno }"/>
                <tr>
                  <td colspan = 2 style="background-color: white;"><b>주문번호:</b> #${porderno } <b>주문일:</b> ${rdate.substring(0,10) } <b>총주문금액:</b> ￦${payment_price } </td>
                  <td style="background-color: white; text-align: center;"><button type="button" class="show_detail" data-porderno="${porderno }">주문상세보기</button></td>
                </tr>
              </c:otherwise>
            </c:choose>
            <tr>
              <td style="text-align: center;"><img src="../item/storage/main_images/${thumb }" style="width: 100px; height: 100px;"></td>
              <td>
                <h4>[${item_type }] ${item_name }(#${itemno })</h4>
                <fmt:formatNumber value="${de_payment_price }" type="number"/>원 / ${quantity } 개
              </td>
              <td style="text-align: center;">상품 준비중<br>금요일 도착예정<br><button type="button">배송조회</button><br><button type="button" onclick='location.href="../porder_detail/refund.do?porder_detailno=${porder_detailno}"'>반품신청</button></td>
            </tr>
          </c:forEach>
        </table>
        <!-- porder 박스 종료 -->
      </div>
    </div>
    <!-- 주문목록/배송조회 정보 종료 -->
     페이징 추가하기
  </div>
  <!-- 주문목록/배송조회 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
   
  <script>
    $('.show_detail').on('click', function(){
      alert($(this).data('porderno'));
      location.href='../porder_detail/list_detail.do?porderno=' + $(this).data('porderno');
    });
  </script>
</body>
</html>