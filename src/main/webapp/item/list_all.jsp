
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
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../javascript/script.js"></script>

<script type="text/javascript">
  $(function() {

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
    <div class="container">
      <h2>Carousel Example</h2>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->

        <div class="carousel-inner">
          <div class="item active">
            <img src="./images/banner1.jpg" alt="banner1"
              style="width: 100%;">
            <div class="carousel-caption">
              <h3>신상품1</h3>
              <p>신상품!</p>
            </div>
          </div>
          <div class="item">
            <img src="./images/banner2.png" alt="banner2"
              style="width: 100%;">
            <div class="carousel-caption">
              <h3>신상품2</h3>
              <p>신상품2</p>
            </div>
          </div>

          <div class="item">
            <img src="./images/banner3.png" alt="banner3"
              style="width: 100%;">
            <div class="carousel-caption">
              <h3>신상품3</h3>
              <p>신상품3</p>
            </div>
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel"
          data-slide="prev"> <span
          class="glyphicon glyphicon-chevron-left"></span> <span
          class="sr-only">Previous</span>
        </a> <a class="right carousel-control" href="#myCarousel"
          data-slide="next"> <span
          class="glyphicon glyphicon-chevron-right"></span> <span
          class="sr-only">Next</span>
        </a>
      </div>
    </div>
   <br>
   <br>
   <br>

  
    <!-- 갤러리 Layout 시작 -->
    <c:forEach var="Itemgrp_Item_VO" items="${list }" varStatus="status">
      <c:set var="name" value="${Itemgrp_Item_VO.itemgrpVO.name }" />
      <c:set var="itemno" value="${Itemgrp_Item_VO.itemVO.itemno }" />
      <c:set var="item_name" value="${Itemgrp_Item_VO.itemVO.item_name}" />
      <c:set var="item_price"
        value="${Itemgrp_Item_VO.itemVO.item_price }" />
      <c:set var="item_cost" value="${Itemgrp_Item_VO.itemVO.item_cost}" />
      <c:set var="discount_rate"
        value="${Itemgrp_Item_VO.itemVO.discount_rate}" />
      <c:set var="item_cost" value="${Itemgrp_Item_VO.itemVO.item_cost}" />
      <c:set var="upfile" value="${Itemgrp_Item_VO.itemVO.upfile}" />
      <c:set var="thumb" value="${Itemgrp_Item_VO.itemVO.thumb}" />
      <c:set var="fsize" value="${Itemgrp_Item_VO.itemVO.fsize}" />

      <c:if test="${status.index % 4 == 0 && status.index != 0 }">
        <HR class='menu_line'>
      </c:if>

      <!-- 하나의 이미지 -->
      <DIV style='width: 24%; float: left; margin: 0.5%; padding: 0.5%; background-color: #EEEFFF;'>
        <c:choose>
          <c:when test="${fsize > 0}">
            <!-- 파일이 존재하면 -->
            <c:choose>
              <c:when
                test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <!-- 이미지 인경우 -->
                <div class="panel panel-primary">
                  <div class="panel-heading">${item_name}</div>
                  <div class="panel-body">
                    <a href="./read.do?itemno=${itemno}"> <IMG
                      src="./storage/main_images/${thumb }"
                      style='width: 100%; height: 150px;'>
                    </a>
                  </div>
                  <div class="panel-footer">가격: ${item_price} 원</div>
                </div>
              </c:when>
              <c:otherwise>
                <!-- 이미지가 아닌 일반 파일 -->
                <div class="panel panel-primary">
                  <div class="panel-heading">${item_name}</div>
                  <div class="panel-body">
                    <DIV
                      style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                      <DIV
                        style='display: table-cell; vertical-align: middle; text-align: center;'>
                        <!-- 수직 가운데 정렬 -->
                        <a href="./read.do?itemno=${itemno}">${upfile}</a><br>
                      </DIV>
                    </DIV>
                  </div>
                  <div class="panel-footer">가격: ${item_price} 원</div>
                </div>
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <a href="./read.do?itemno=${itemno}"> <img
              src='./images/none1.png'
              style='width: 100%; height: 150px;'>
            </a>
            <br>
            이미지를 등록해주세요.
          </c:otherwise>
        </c:choose>
      </DIV>
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
              
    <div style='width: 100%;'>
      <div  style='width: 24%; float: right; margin: 10%; padding: 0.5%; background-color: #EEEFFF;'>
      <a href='./create.do?itemno=${itemno }'>파일 생성</a>
    </div>
      <table class="table table-striped" style='width: 100%;'>
        <colgroup>
          <col style="width: 10%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 15%;"></col>
          <col style="width: 15%;"></col>
          <col style="width: 15%;"></col>
          <col style="width: 10%;"></col>
          <col style="width: 15%;"></col>
        </colgroup>
        <%-- table 컬럼 --%>
        <thead>
          <tr>
            <th style='text-align: center;'>번호</th>
            <th style='text-align: center;'>제품번호</th>
            <th style='text-align: center;'>제품명</th>
            <th style='text-align: center;'>정가</th>
            <th style='text-align: center;'>원가</th>
            <th style='text-align: center;'>할인률</th>
            <th style='text-align: center;'>기타</th>
          </tr>
        </thead>

        <%-- table 내용 --%>
        <tbody>
          <c:forEach var="Itemgrp_Item_VO" items="${list }">
            <c:set var="name" value="${Itemgrp_Item_VO.itemgrpVO.name }" />
            <c:set var="itemno" value="${Itemgrp_Item_VO.itemVO.itemno }" />
            <c:set var="item_name" value="${Itemgrp_Item_VO.itemVO.item_name}" />
            <c:set var="item_price" value="${Itemgrp_Item_VO.itemVO.item_price }" />
            <c:set var="item_cost" value="${Itemgrp_Item_VO.itemVO.item_cost}" />
            <c:set var="discount_rate" value="${Itemgrp_Item_VO.itemVO.discount_rate}" />
            <c:set var="item_cost" value="${Itemgrp_Item_VO.itemVO.item_cost}" />
            <c:set var="upfile" value="${Itemgrp_Item_VO.itemVO.upfile}" />
            <c:set var="thumb" value="${Itemgrp_Item_VO.itemVO.thumb}" />
            <c:set var="fsize" value="${Itemgrp_Item_VO.itemVO.fsize}" />

            <tr>
              <td style='text-align: center;'>${name }</td>
              <td style='text-align: center;'>${itemno}</td>
              <td>
                <a href="./read.do?itemno=${itemno}">${item_name}</a>
              </td>
              <td style='text-align: center;'>${item_price}</td>
              <td style='text-align: center;'>${item_cost}</td>
              <td style='text-align: center;'>${discount_rate}</td>
              <td style='text-align: center;'>
                <A href='./update.do?grpno=${grpno}&itemno=${itemno }'>파일수정</A>
                <A href='./delete.do?itemno=${itemno }'>파일 삭제</A>
              </td>
            </tr>
          </c:forEach>

        </tbody>
      </table>
      <DIV class='bottom_menu'>paging</DIV>
      <br>
      <br>
    </div>

  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>