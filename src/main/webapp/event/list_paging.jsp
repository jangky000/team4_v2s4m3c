<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
  <script src="../javascript/script.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class= 'material'>
<DIV class='title_line'>
   <span class="title"> 이 벤 트 </span>
     <ASIDE style='float: right;'>
    <A href="javascript:location.reload();"class="bluelink">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href="./create.do"class="bluelink">이벤트 등록</A>
  </ASIDE>
  </DIV>

          
 <div class="container-fluid text-center bg-grey">
   
<h2>이벤트 게시판</h2><br>

<c:forEach var="eventVO" items="${list }">
<c:set var="eventno" value="${eventVO.eventno }" />
  <div class="row text-center" >
    <div class="col-sm-4">
      <div class="thumbnail" style="background-color: none;">
         <img src="./storage/imgstorage/${eventVO.event_img}" width="600" height="500">

        <p>
        <a href="./read.do?eventno=${eventno}" class="bluelink">
          <strong>${eventVO.event_title}</strong>
        </a>
        </p>
        <p>            
            <c:choose>
                    <c:when test="${fn:length(eventVO.event_content) gt 26}">
                    <c:out value="${fn:substring(eventVO.event_content, 0, 25)}">...
                    </c:out>
                    </c:when>
                    <c:otherwise>
                    <c:out value="${eventVO.event_content}">
                    </c:out></c:otherwise>
             </c:choose>
         </p>
      </div>
    </div>

  </div>

</c:forEach>

</div>

     <br><br>
      <br><br>
      <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>

    <br><br>

 <div></div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 