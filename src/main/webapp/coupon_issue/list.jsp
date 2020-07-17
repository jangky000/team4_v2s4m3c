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
    .bordered {
        *border-collapse: collapse; /* IE7 and lower */
        border-spacing: 0;
        width: 100%;
        border: solid #ccc 1px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
        -webkit-box-shadow: 0 1px 1px #ccc;
        -moz-box-shadow: 0 1px 1px #ccc;
        box-shadow: 0 1px 1px #ccc;
    }
     
    .bordered tr:hover {
        background: #fbf8e9;
        -o-transition: all 0.1s ease-in-out;
        -webkit-transition: all 0.1s ease-in-out;
        -moz-transition: all 0.1s ease-in-out;
        -ms-transition: all 0.1s ease-in-out;
        transition: all 0.1s ease-in-out;
    }
     
    .bordered td, .bordered th {
        border-left: 1px solid #ccc;
        border-top: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }
     
    .bordered th {
        background-color: #dce9f9;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
        background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
        -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
        -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;
        box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
        border-top: none;
        text-shadow: 0 1px 0 rgba(255,255,255,.5);
    }
     
    .bordered td:first-child, .bordered th:first-child {
        border-left: none;
    }
     
    .bordered th:first-child {
        -moz-border-radius: 6px 0 0 0;
        -webkit-border-radius: 6px 0 0 0;
        border-radius: 6px 0 0 0;
    }
     
    .bordered th:last-child {
        -moz-border-radius: 0 6px 0 0;
        -webkit-border-radius: 0 6px 0 0;
        border-radius: 0 6px 0 0;
    }
     
    .bordered th:only-child{
        -moz-border-radius: 6px 6px 0 0;
        -webkit-border-radius: 6px 6px 0 0;
        border-radius: 6px 6px 0 0;
    }
     
    .bordered tr:last-child td:first-child {
        -moz-border-radius: 0 0 0 6px;
        -webkit-border-radius: 0 0 0 6px;
        border-radius: 0 0 0 6px;
    }
     
    .bordered tr:last-child td:last-child {
        -moz-border-radius: 0 0 6px 0;
        -webkit-border-radius: 0 0 6px 0;
        border-radius: 0 0 6px 0;
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
      <h2 style="display: inline;">쿠폰 발행 목록</h2>
      <span style="float: right;">관리자 ＞ <strong style="background-color: #ffffff;">쿠폰 발행 목록</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 쿠폰 발급 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray">
        <h3>쿠폰 발행 목록</h3>
      </div>
      <div style="margin: 20px auto; width: 95%;">
        <div style="text-align: right;">@쿠폰 상태: I: issued 발급완료, U:used 사용완료, C:calceled 발급취소</div>
        <table class="bordered" style='width: 100%;'>
          <!-- table 이름 -->
          <thead>
            <tr>
              <th style='text-align: center;'>쿠폰발급no</th>
              <th style='text-align: center;'>회원no</th>
              <th style='text-align: center;'>쿠폰no</th>
              <th style='text-align: center;'>쿠폰발급수량</th>
              <th style='text-align: center;'>쿠폰발급일</th>
              <th style='text-align: center;'>쿠폰만료일</th>
              <th style='text-align: center;'>쿠폰상태</th>
              <th></th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="coupon_issueVO" items="${list }">
              <c:set var="coupon_issueno" value="${coupon_issueVO.coupon_issueno }" />
              <c:set var="memno" value="${coupon_issueVO.memno }" />
              <c:set var="couponno" value="${coupon_issueVO.couponno }" />
              <c:set var="cpcnt" value="${coupon_issueVO.cpcnt }" />
              <c:set var="cpissue" value="${coupon_issueVO.cpissue }" />
              <c:set var="cpexpired" value="${coupon_issueVO.cpexpired }" />
              <c:set var="cpstatus" value="${coupon_issueVO.cpstatus }" />
              
              <tr> 
                <td style='text-align: center;'>${coupon_issueno}</td>
                <td style='text-align: center;'>${memno}</td>
                <td style='text-align: center;'>${couponno} </td>
                <td style='text-align: center;'>${cpcnt} </td>
                <td style='text-align: center;'>${cpissue} </td>
                <td style='text-align: center;'>${cpexpired} </td>
                <td style='text-align: center;'>${cpstatus} </td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='#' ">발급취소</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      
      <!-- 페이징 시작-->
      <DIV class='bottom_menu'>${paging }</DIV>
      <br><br>
      <!-- 페이징 종료 -->
      
    </div>
    <!-- 쿠폰 발급 정보 종료 -->
    
  </div>
  <!-- 쿠폰 발급 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>