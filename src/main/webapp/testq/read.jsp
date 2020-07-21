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
  <div class=material>
    <c:set var="testqno" value="${testqVO.testqno }" />
    <DIV class='title_line'>
      <span class="title"> 자 가 진 단 질 문 </span>

    </DIV>
    <div class='menu_line'></div>

    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="testqno" value="${testqno}"> <input
        type='hidden' name='testq_seqno' id='testq_seqno'
        value='${testqVO.testq_seqno }'> <input type='hidden'
        name='testq_tot' id='testq_tot' value='${testqVO.testq_tot }'>


      <ASIDE style='float: right; font-size: 12px; margin-bottom: 0px;'>


        <A href="javascript:location.reload();" class="bluelink">새로고침</A>
        <span class='menu_divide'> | </span> <A href='./list_paging.do'
          class="bluelink">목록</A> <span class='menu_divide'> | </span> <A
          href='./update.do?testqno=${testqVO.testqno }'
          class="bluelink">수정</A> <span class='menu_divide'> | </span> <A
          href='./delete.do?testqno=${testqVO.testqno }'
          class="bluelink">삭제</A>
        <!-- 이미지 등록! -->
        <c:choose>
          <c:when test="${testqVO.testq_img.trim().length() > 0 }">
            <span class='menu_divide'> | </span>
            <A href='./jpg_delete.do?testqno=${testqno}'>이미지 삭제</A>
          </c:when>
          <c:otherwise>
            <span class='menu_divide'> | </span>
            <A href='./jpg_create.do?testqno=${testqno}'>이미지 등록</A>
          </c:otherwise>
        </c:choose>
      </ASIDE>



      <div>
        <c:set var="testq_img"
          value="${testqVO.testq_img.toLowerCase() }" />
        ${testqVO.testq_content }
        <c:choose>
          <c:when
            test="${testq_img.endsWith('jpg') || testq_img.endsWith('png') || testq_img.endsWith('gif')||testq_img.endsWith('svg')}">
            <IMG src="./storage/imgstorage/${testqVO.testq_img }"
              style="width: 80%">
          </c:when>
          <c:otherwise>
            <!-- 이미지가 아닌 일반 파일 -->
                  ${testqVO.testq_img}
                </c:otherwise>
        </c:choose>

      </div>

      <!--     </fieldset> -->
    </FORM>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
