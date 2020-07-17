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
    

    
    <!-- 리스트 테이블 시작 -->
    <div style="margin: 20px auto;">
      <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <col style="width: 50%;"></col>
            <col style="width: 50%;"></col>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'>주문no</th>
              <th style='text-align: center;'>회원번호</th>
            </tr>
          
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="porderVO" items="${list }">
              <c:set var="porderno" value="${porderVO.porderno }" />
              
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