<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>♥SKINFIT♥</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/js/bootstrap.min.js"></script>

<script src="../javascript/script.js"></script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />





  <c:set var="testq_content_old" value="" />
  <c:set var="testqno_old" value="" />
  <c:set var="testq_img_old" value="" />
  <c:set var="testq_timg_old" value="" />

  <div class='test_item'>
    <div class='material' style="border: solid 1px black;">
      <DIV class='title_line'>
        <span class="title"> 피부 자가 진단</span>
        <ASIDE style='float: right;'>
          <A href="javascript:location.reload();" class="bluelink">새로고침</A>
          <span class='menu_divide'>│</span> <A href="./create.do"
            class="bluelink">항목 등록</A>

        </ASIDE>
      </DIV>
      <c:forEach var="testq_Testo_join" items="${list}">
        <c:set var="testq_content"value="${testq_Testo_join.q_testq_content}" />

        <c:set var="testqno" value="${testq_Testo_join.q_testqno}" />
        <c:set var="q_testq_img" value="${testq_Testo_join.q_testq_img}" />
        <c:set var="testq_timg"value="${testq_Testo_join.q_testq_timg.toLowerCase()}" />

        <c:set var="testono" value="${testq_Testo_join.testono}" />
        <c:set var="testo_content"value="${testq_Testo_join.testo_content}" />
        <c:set var="testo_seqno" value="${testoVO.testo_seqno}" />
        
       <div>
        <c:choose>
          <c:when test="${testq_content_old != testq_content}">
                  ${testq_content}
                  <c:set var="testq_content_old"value="${testq_content}" />
          </c:when>
          <c:otherwise>
             &nbsp;
          </c:otherwise>
        </c:choose>
        <br>
        <br>

        <div>
          <c:choose>
            <c:when test="${testq_img_old != q_testq_img}">
              <img src='../testq/storage/imgstorage/${q_testq_img}'style='width: 50%; height: 100%;'>
              <c:set var="testq_img_old" value="${q_testq_img}" />
            </c:when>
            <c:otherwise>

            </c:otherwise>
          </c:choose>
          </div>
        </div>

        <label style="cursor: pointer;"><input type="radio"name="testo_content" value="">${testo_content}</label>
      </c:forEach>
    </div>
  </div>






  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
