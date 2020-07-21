<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>♥SKINFIT♥</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/js/bootstrap.min.js"></script>
    
  <script src="../javascript/script.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class= material>
<DIV class='title_line'>
    ♥ 이벤트 ♥
  </DIV>
  
  <ASIDE style='float: left;'>
    전체 보기 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href="./create.do">이벤트 등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="eventimglist" style='width: 100%;'>
      <colgroup>
        <col style="width: 33%;"></col>
        <col style="width: 33%;"></col>
        <col style="width: 33%;"></col>


      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>이벤트기간</th>
<!--           <th style='text-align: center;'>등록일</th> -->
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="eventVO" items="${list }">
          <c:set var="eventno" value="${eventVO.eventno }" />
          
          <tr> 
            <td>
              <a href="./read.do?eventno=${eventno}" class="bluelink">${eventVO.event_title}</a> 
            </td> 
            <td style='text-align: center;'>${eventVO.event_content}</td>
            <td style='text-align: center;'>${eventVO.event_due}</td>
            
<%--             <td style='text-align: center;'>${eventVO.event_rdate.substring(0, 10)}</td> --%>


          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 