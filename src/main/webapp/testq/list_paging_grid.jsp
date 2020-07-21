<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../javascript/script.js"></script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div class='material' style="border: none;">

    <div class="container-fluid text-center bg-grey">
<!--       <div class="main_gallery">
        <img src="./images/event_banner.png"
          style="width: 100%; padding-bottom: 100px;">
      </div> -->
      <div>
        <ASIDE style='float: right; width: 100%; padding: 200px;'>
          <A href="javascript:location.reload();" class='bluelink'><img
            src="./images/refresh_icon_l.png"></A> <A
            href="./create.do" class="bluelink"><img
            src="./images/create_icon_l.png"></A>
        </ASIDE>
      </div>
      <br>


      <!-- 갤러리 Layout 시작 -->
      <c:forEach var="testqVO" items="${list }" varStatus="status">
        <c:set var="testqno" value="${testqVO.testqno }" />
        <c:set var="testq_timg" value="${testqVO.testq_timg.toLowerCase() }" />
        <c:set var="testq_content" value="${testqVO.testq_content}" />
        <c:set var="testq_img" value="${testqVO.testq_img}" />


        <c:if test="${status.index % 4 == 0 && status.index != 0 }">

        </c:if>

        <!-- 하나의 이미지 -->
        <DIV class="gallery">
          <c:choose>
            <c:when test="${testqno > 0}">
              <!-- 파일이 존재하면 -->
              <c:choose>
                <c:when
                  test="${testq_timg.endsWith('jpg') || testq_timg.endsWith('png') || testq_timg.endsWith('gif')|| testq_timg.endsWith('svg')}">
                  <!-- 이미지 인경우 -->
                  <a href="./read.do?testqno=${testqno}"> <IMG src="./storage/imgstorage/${testq_img }"style='width: 100%; height: 220PX;'>
                  </a>
                  <br>
                  <br>
                  <a href="./read.do?testqno=${testqno}"
                    class="bluelink">${testqVO.testq_content}</a>
                </c:when>
                <c:otherwise>
                  <!-- 이미지가 아닌 일반 파일 -->
                  <DIV
                    style='width: 100%; height: 170px; display: table;'>
                    <DIV
                      style='display: table-cell; vertical-align: middle; text-align: center;'>
                      <!-- 수직 가운데 정렬 -->
                      <a href="./read.do?testqno=${testqno}"><img
                        src='./images/gallery_bg.png'
                        style='width: 100%; height: 220px;'></a><br>
                      <br>
                    </DIV>
                  </DIV>

                  <a href="./read.do?testqno=${testqno}"
                    class="bluelink">${testqVO.testq_content}</a>

                </c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              <a href="./read.do?testqno=${testqno}"> </a>

            </c:otherwise>
          </c:choose>
        </DIV>
      </c:forEach>
      <!-- 갤러리 Layout 종료 -->


    </div>

    <br> <br> <br> <br>
    <DIV class='bottom_menu'>${paging }</DIV>
    <br> <br>
  </div>

  <br>
  <br>

  <div></div>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
