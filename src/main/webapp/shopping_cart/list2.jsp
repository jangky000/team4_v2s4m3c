<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>SKINFIT</title>
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script> -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
</head>
<body>
  <!-- 리스트 페이지 시작 -->
  <div style="margin: 20px auto; width: 80%;">
    로그인 시에만 접근 허용**
    <!-- 정렬 -->
    <div style="margin: 20px auto;">
      <a href="#">높은 가격순</a> | 
      <a href="#">낮은 가격순</a>
    </div>
    <!-- 정렬 종료 -->
    
    <!-- 리스트 테이블 시작 -->
    <div style="margin: 20px auto;">
      <form action="../porder/create.jsp" method="get">
        <table class="table table-striped" style='width: 100%;'>
            <colgroup>
              <col style="width: 5%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 25%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <!-- 장바구니no, 회원no, 상품no, 상품 그룹no, 상품 그룹 이름 -->
                <th style='text-align: center;'><input type="checkbox" name="no" value="no"></th>
                <th style='text-align: center;'>상품 이미지</th>
                <th style='text-align: center;'>상품이름</th>
                <th style='text-align: center;'>가격(할인, 쿠폰)</th>
                <th style='text-align: center;'>수량</th>
                <th style='text-align: center;'>배송비</th>
                <th style='text-align: center;'>배송일정</th>
                <th style='text-align: center;'>기타</th>
              </tr>
            
            </thead>
            
            <%-- table 내용 --%>
            <tbody>
              <%-- <c:forEach var="porderVO" items="${list }">
                <c:set var="porderno" value="${porderVO.porderno }" /> --%>
                
                <tr>
                  <td style='text-align: center; vertical-align: middle;'><input type="checkbox" name="productno" value="1"></td>
                  <td style='text-align: center;'><img src='./sample.png' style="width: 100px; height: 100px;" alt='상품 이미지'></td>
                  <td style='text-align: center; vertical-align: middle;'><a href="#">화려한 조명이 나를 감싸도 썬블록</a></td>
                  <td style='text-align: center; vertical-align: middle;'><s>100원</s>(99원)</td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <button type="button" style="width: 25px;"><strong>-</strong></button>
                    <input type='text' value='1' readonly="readonly" style="width: 40px; text-align: right;">
                    <button type="button" style="width: 25px;"><strong>+</strong></button>
                  </td>
                  <td style='text-align: center; vertical-align: middle;'>2,500</td>
                  <td style='text-align: center; vertical-align: middle;'>오늘 출고</td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <button type="button" onclick="location.href='./" style="width: 80px;">바로 구매</button>
                    <button type="button" style="width: 80px;" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
                  </td>
                </tr>
                <tr>
                  <td style='text-align: center; vertical-align: middle;'><input type="checkbox" name="productno" value="2"></td>
                  <td style='text-align: center;'><img src='./sample.png' style="width: 100px; height: 100px;" alt='상품 이미지'></td>
                  <td style='text-align: center; vertical-align: middle;'><a href="#">시간이 멈추길 기도해 썬크림</a></td>
                  <td style='text-align: center; vertical-align: middle;'><s>100원</s>(99원)</td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <button type="button" style="width: 25px;"><strong>-</strong></button>
                    <input type='text' value='2' readonly="readonly" style="width: 40px; text-align: right;">
                    <button type="button" style="width: 25px;"><strong>+</strong></button>
                  </td>
                  <td style='text-align: center; vertical-align: middle;'>2,500</td>
                  <td style='text-align: center; vertical-align: middle;'>내일( n일,화)</td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <button type="button" onclick="location.href='./" style="width: 80px;">바로 구매</button>
                    <button type="button" style="width: 80px;" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
                  </td>
                </tr>
  <%--             </c:forEach> --%>
              
            </tbody>
          </table>
      </form>
    </div>
    <!-- 리스트 테이블 종료 -->
    
    <div>
      <label><input type="checkbox" name="no" value="no"> 전체 선택</label> &nbsp;&nbsp;&nbsp;
      <button type="button" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
    </div>
    
    <div style="outline: 1px solid grey; margin: 20px auto;">
      <table class="table table-striped">
        <colgroup>
          <col style="width: 25%;"></col>
          <col style="width: 25%;"></col>
          <col style="width: 25%;"></col>
          <col style="width: 25%;"></col>
        </colgroup>
        <thead>
          <tr>
            <th style='text-align: center;'>상품 금액(n종/n개)</th>
            <th style='text-align: center;'>배송비</th>
            <th style='text-align: center;'>쿠폰 사용</th>
            <th style='text-align: center;'>결제 예정금액</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td style='text-align: center;'>100 원</td>
            <td style='text-align: center;'>2500 원</td>
            <td style='text-align: center;'>-2500 원</td>
            <td style='text-align: center;'>100 원</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <div style="text-align: right;">
      <button type="button" >쇼핑하기</button>
      <button type="button" >구매하기</button>
    </div>
  </div>
  <!-- 리스트 페이지 종료 -->
</body>
</html>