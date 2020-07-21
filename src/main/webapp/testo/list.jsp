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
   <span class="title"> 피부 자가 진단 질문별 항목</span>
     <ASIDE style='float: right;'>
    <A href="javascript:location.reload();"class="bluelink">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href="./create.do"class="bluelink">항목 등록</A>

  </ASIDE>
  </DIV>

 

  <DIV class='menu_line' style='clear: both;'></DIV>
  <div class="table_area">

  <div style='width: 100%;'>
    <table class="eventimglist" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        
<%--         <col style="width: 33%;"></col> --%>


      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          
          <th style='text-align: center;'>질문번호</th>
          <th style='text-align: center;'>항목번호</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>출력순서</th>
                    <th style='text-align: center;'>기타</th>
          <!-- <th style='text-align: center;'>이벤트기간</th> -->
<!--           <th style='text-align: center;'>등록일</th> -->
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="testoVO" items="${list }">
          <c:set var="testono" value="${testoVO.testono }" />
          
          <tr> 
            <td style='text-align: center; '>
              <%-- <a href="./read.do?testqno=${testqno}" class="bluelink"> --%>
              ${testoVO.testqno}<!-- </a>  -->
            </td> 
            
            <td style='text-align: center; '>
              <%-- <a href="./read.do?testqno=${testqno}" class="bluelink"> --%>
              ${testoVO.testono}<!-- </a>  -->
            </td> 
            
            <td style='text-align: left;'>
            <c:choose>
                <c:when test="${fn:length(testoVO.testo_content) gt 26}">
                  <a href="./read.do?testono=${testono}" class="bluelink">
                      <c:out value="${fn:substring(testoVO.testo_content, 0, 25)}">...
                      </c:out>
                  </a>
                </c:when>
                <c:otherwise>
                  <a href="./read.do?testono=${testono}" class="bluelink">
                      <c:out value="${testoVO.testo_content}">
                      </c:out>
                  </a>
                </c:otherwise>
            </c:choose>
            </td>
            
             <td style='text-align: center; '>
              <%-- <a href="./read.do?testqno=${testqno}" class="bluelink"> --%>
              ${testoVO.testo_seqno}<!-- </a>  -->
            </td> 
            
             <td style='text-align: center; '>
              <A href="./update_seqno_down.do?testono=${testono }"><img src="../css/images/down_icon.png" style="width:20px; margin:3px;"/></A>
              <A href="./update_seqno_up.do?testono=${testono }"><img src="../css/images/up_icon.png" style="width:20px; margin:3px;"/></A>
              <A href="./update.do?testono=${testono }"><img src="../css/images/edit_icon.png" style="width:18px;margin:3px;"/></A>
              <A href="./delete.do?testono=${testono }"><img src="../css/images/delete_icon.png" style="width:25px;margin:3px;"/></A>
            </td> 
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
     <br><br>
      <br><br>

    <br><br>
  </div>
  </div>
    <br><br>
  </div>
 </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 