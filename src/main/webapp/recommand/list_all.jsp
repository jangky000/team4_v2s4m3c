<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>hyejung world</title>
 
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="../css/style.css" rel="Stylesheet" type="text/css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="../javascript/script.js"></script>
  
  <script type="text/javascript">
  $(function(){
 
  });
  </script>

  <style>
    table.tbl_sty{
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;    
    background-color: white;   
    }
    table.tbl_sty tr{
    border: 1px solid gray;
    background-color: white;
    }
    table.tbl_sty th{
    border: 1px solid gray;
    background-color: white;
    }
    table.tbl_sty td{
    border-bottom: 1px solid gray;   
    background-color: white;
    } 
  </style>   
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div style="width: 80%; margin: 20px auto;">
 <div class="container">
  <input type='hidden' name='grpno' id='grpno' value='1'>
  <input type='hidden' name='itemno' id='itemno' value='1'>
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
         <img src="./images/banner1.jpg" alt="banner1" style="width:100%;">
        <div class="carousel-caption">
          <h3>신상품1</h3>
          <p>신상품!</p>
        </div>
      </div>
      <div class="item">
        <img src="./images/banner2.png" alt="banner2" style="width:100%;">
        <div class="carousel-caption">
          <h3>신상품2</h3>
          <p>신상품2</p>
        </div>
      </div>
    
      <div class="item">
        <img src="./images/banner3.png" alt="banner3" style="width:100%;">
        <div class="carousel-caption">
          <h3>신상품3</h3>
          <p>신상품3</p>
        </div>
      </div> 
    </div>
    <br><br>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 20%;"></col>    
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>추천 세트 번호</th>
          <th style='text-align: center;'>메인 카테고리 번호</th>
          <th style='text-align: center;'>상품 등록 번호</th>
          <th style='text-align: center;'>피부타입 결과</th>
          <th style='text-align: center;'>결과별 화장품추천</th>
          <th style='text-align: center;'>추천 세트 가격</th>  
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="Item_Recom_VO" items="${list }">
            <c:set var="grpno" value="${Item_Recom_VO.itemVO.name }" />
            <c:set var="itemno" value="${Item_Recom_VO.itemVO.itemno }" />
            <c:set var="item_name" value="${Item_Recom_VO.itemVO.item_name}" />
            <c:set var="recomno" value="${Item_Recom_VO.recomVO.recomno }" />
            <c:set var="testresult_type" value="${Item_Recom_VO.recomVO.testresult_type}" />
            <c:set var="testresult_recom" value="${Item_Recom_VO.recomVO.testresult_recom}" />
            <c:set var="recom_price" value="${Item_Recom_VO.recomVO.recom_price}" />
          <tr> 
             <td>
              <a href="./read.do?recomno=${recomno}">${recomno}</a> 
            </td> 
            <td style='text-align: center;'>${grpno}</td>
            <td style='text-align: center;'>${itemno}</td>
            <td style='text-align: center;'>${testresult_type}</td> 
            <td style='text-align: center;'>${testresult_recom}</td>
            <td style='text-align: center;'>${recom_price}</td>
            <td style='text-align: center;'>
              <A href='./delete.do?recomno=${recomno }'>파일 삭제</A> 
            </td>            
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <DIV class='bottom_menu'>paging</DIV>
    <br><br>
  </div>
    
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>