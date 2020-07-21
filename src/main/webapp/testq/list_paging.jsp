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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/js/bootstrap.min.js"></script>
    
  <script src="../javascript/script.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class= 'material'>
<DIV class='title_line'>
   <span class="title"> 피부 자가 진단 </span>
     <ASIDE style='float: right;'>
    <A href="javascript:location.reload();"class="bluelink">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href="./create.do"class="bluelink">질문 등록</A>
  </ASIDE>
  </DIV>

 

  <DIV class='menu_line' style='clear: both;'></DIV>
  <div class="table_area">

  <div style='width: 100%;'>
    <table class="eventimglist" style='width: 100%;'>
      <colgroup>
        <col style="width: 50%;"></col>
        <col style="width: 50%;"></col>
<%--         <col style="width: 33%;"></col> --%>


      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          
          <th style='text-align: center;'>순서</th>
          <th style='text-align: left;'>질문</th>
          <!-- <th style='text-align: center;'>이벤트기간</th> -->
<!--           <th style='text-align: center;'>등록일</th> -->
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="testqVO" items="${list }">
          <c:set var="testqno" value="${testqVO.testqno }" />
          
          <tr> 
            <td style='text-align: center; '>
              <%-- <a href="./read.do?testqno=${testqno}" class="bluelink"> --%>
              ${testqVO.testq_seqno}<!-- </a>  -->
            </td> 
            <td style='text-align: left;'>
            <c:choose>
                <c:when test="${fn:length(testqVO.testq_content) gt 26}">
                  <a href="./read.do?testqno=${testqno}" class="bluelink">
                      <c:out value="${fn:substring(testqVO.testq_content, 0, 25)}">...
                      </c:out>
                  </a>
                </c:when>
                <c:otherwise>
                  <a href="./read.do?testqno=${testqno}" class="bluelink">
                      <c:out value="${testqVO.testq_content}">
                      </c:out>
                  </a>
                </c:otherwise>
            </c:choose>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
     <br><br>
      <br><br>
      <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>
  </div>
    <br><br>
  </div>
 </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 