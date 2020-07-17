<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>SKINFIT</title>
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
</head>
<body>

  <div style="width: 80%; margin: 20px auto;">
    주문 수정
    <!-- 주문 리스트 테이블 시작 -->
    <div style="margin: 20px auto;">
      <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 30%;"></col>
            <col style="width: 20%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'>주문no</th>
              <th style='text-align: center;'>회원번호</th>
              <th style='text-align: center;'>주문날짜</th>
              <th style='text-align: center;'>주문총액</th>
              <th style='text-align: center;'>주문상태</th>
              <th style='text-align: center;'>상세보기</th>
              <th style='text-align: center;'>기타</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:set var="porderno" value="${porderVO.porderno }" />
            <c:set var="memberno" value="${porderVO.memberno }" />
            <c:set var="rdate" value="${porderVO.rdate }" />
            <c:set var="total_price" value="${porderVO.total_price }" />
            <c:set var="status" value="${porderVO.status }" />
            
            <tr> 
              <td style='text-align: center;'>${porderno}</td>
              <td style='text-align: center;'>${memberno}</td>
              <td style='text-align: center;'>${rdate} </td>
              <td style='text-align: center;'>${total_price}</td>
              <td style='text-align: center;'>${status}</td>
              <td style='text-align: center;'>
                <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">상세보기</button>
              </td>
              <td style='text-align: center;'>
                <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">수정</button>
                <button type="button" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
              </td>
            </tr>
          </tbody>
        </table>
    </div>
    <!-- 리스트 테이블 종료 -->
    
    주문 상세 리스트
    <!-- 주문 상세 리스트 테이블 시작 -->
    <div style="margin: 20px auto;">
      <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 30%;"></col>
            <col style="width: 20%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'>주문상세no</th>
              <th style='text-align: center;'>주문no</th>
              <th style='text-align: center;'>회원no</th>
              <th style='text-align: center;'>상품no</th>
              <th style='text-align: center;'>수량</th>
              <th style='text-align: center;'>총가격</th>
              <th style='text-align: center;'>기타</th>
            </tr>
          
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="porder_detailVO" items="${list }">
              <c:set var="d_porder_detailno" value="${porder_detailVO.porder_detailno }" />
              <c:set var="d_porderno" value="${porder_detailVO.porderno }" />
              <c:set var="d_memberno" value="${porder_detailVO.memberno }" />
              <c:set var="d_productno" value="${porder_detailVO.productno }" />
              <c:set var="d_total_price" value="${porder_detailVO.total_price }" />
              
              <tr> 
                <td style='text-align: center;'>${d_porder_detailno}</td>
                <td style='text-align: center;'>${d_porderno}</td>
                <td style='text-align: center;'>${d_memberno} </td>
                <td style='text-align: center;'>${d_productno}</td>
                <td style='text-align: center;'>${d_total_price}</td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">상세보기</button>
                </td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">수정</button>
                  <button type="button" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
                </td>
              </tr>
            </c:forEach>
            
          </tbody>
        </table>
    </div>
    <!-- 리스트 테이블 종료 -->
  </div>
  ** 삭제하기
  수정 방법 확정하기
  주문 상태 변경하기: 결제 대기, 결제 완료, -> 결제를 해야 업데이트 가능 -> 결제 페이지로 이동 -> 결제 완료 시 날짜도 같이 업데이트하기
  
  주문 상세에서 상품 삭제 + 개수 수정(porder_detail 업데이트에 해당) -> 주문 상세 총 금액 수정 -> 주문 총 금액 수정
</body>
</html>