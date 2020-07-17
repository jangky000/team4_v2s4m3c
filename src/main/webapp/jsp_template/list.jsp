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
  <div style="margin: 20px auto; width: 80%;">
    관리자만 접근 허용**
    
    <!-- 검색창 -->
    <div style="margin: 20px auto;">
      <form>
        <div style="width:20%; height:20px; display: inline-block;">
          <div class="form-group">
            <!-- <label for="sel1">Select list:</label> -->
            <select class="form-control" id="sel1">
              <option>회원 검색</option>
              <option>주문 번호 검색</option>
              <option>날짜 검색</option>
              <option>구매상품검색</option>
            </select>
          </div>
        </div>
      
        <div style="width:50%; height:20px; display: inline-block;">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="검색">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
    <!-- 검색창 종료 -->
    
    <!-- 정렬 -->
    <div style="margin: 20px auto;">
      <a href="#">결제 대기</a> | 
      <a href="#"> 결제 완료</a> | 
      <a href="#">날짜순</a> | 
      <a href="#">높은 금액순</a> | 
      <a href="#">낮은 금액순</a>
    </div>
    <!-- 정렬 종료 -->
    
    <!-- 리스트 테이블 시작 -->
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
            <c:forEach var="porderVO" items="${list }">
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
            </c:forEach>
            
          </tbody>
        </table>
    </div>
    <!-- 리스트 테이블 종료 -->
  </div>
</body>
</html>