<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>hyejung world</title>

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link
  href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
  rel="stylesheet">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../javascript/script.js"></script>

  <script type="text/javascript">
  $(function(){
 
  });
  </script>

  <style>
  table.tbl_sty {
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
    background-color: white;
  }
  
  table.tbl_sty tr {
    border: 1px solid gray;
    background-color: white;
  }
  
  table.tbl_sty th {
    border: 1px solid gray;
    background-color: white;
  }
  
  table.tbl_sty td {
    border-bottom: 1px solid gray;
    background-color: white;
  }
</style>
</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div style="width: 80%; margin: 20px auto;">
  <DIV class='title_line'>
    전체 첨부 파일
  </DIV>

  <ASIDE style='float: left;'>
    <A href='#'>모든 이미지 파일</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
<!--     <span class='menu_divide' > | </span> -->

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>        
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>NO</th>
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>원본<br>파일명</th>
          <th style='text-align: center;'>저장<br>파일명</th>
          <th style='text-align: center;'>Preview<br>파일명</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="thumbnailVO" items="${list }">
          <c:set var="thumbno" value="${thumbnailVO.thumbno }" />
          <c:set var="fname" value="${thumbnailVO.fname.toLowerCase() }" />
          
          <tr> 
            <td style='vertical-align: middle; text-align: center;'>${thumbnailVO.thumbno }</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
                  <IMG src="./storage/${thumbnailVO.thumb }"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${thumbnailVO.fname}
                </c:otherwise>
              </c:choose>
            </td> 
            <td style='text-align: center; vertical-align: middle;'>${thumbnailVO.fname}</td>
            <td style='text-align: center; vertical-align: middle;'>${thumbnailVO.fupname}</td>
            <td style='text-align: center; vertical-align: middle;'>${thumbnailVO.thumb}</td>
            <td style='text-align: center; vertical-align: middle;'>${thumbnailVO.rdate.substring(0, 10)}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <%-- <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a> --%>
               삭제
            </td>
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
  