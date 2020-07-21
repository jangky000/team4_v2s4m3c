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
  body {
    position: relative; 
  }
  .affix {
    top:0;
    width: 80%;
    z-index: 9999 !important;
  }
  .navbar {
    margin-bottom: 0px;
  }

  .affix ~ .container-fluid {
   position: relative;
   top: 50px;
  }
  #section1 {padding-top:20px;height:400px;color: #fff; background-color: #F5DDD9;}
  #section2 {padding-top:20px;color: #fff; background-color: #F3D1C8;}
  #section3 {padding-top:20px;height:200px;color: #fff; background-color: #E3DDC5;}
  #section41 {padding-top:20px;height:500px;color: #fff; background-color: #F0E5D3;}
  #section42 {padding-top:20px;height:500px;color: #fff; background-color: #ADBAC2;}
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<jsp:include page="/menu/top.jsp" flush='false' />
  <input type='hidden' name='grpno' id='grpno' value='1'>
<div style="width: 80%; margin: 20px auto;">

<div class="container-fluid" style="background-color:#F9D5AA; height:200px;">
  <h1>${itemVO.item_name }</h1>
  <div > 혜정이의 상품페이지입니다다다다</div>
</div>

<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">${itemVO.item_name }</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#section1">가격</a></li>
          <li><a href="#section2">상세설명</a></li>
          <li><a href="#section3">상품 피부 효과</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">후기<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#section41">상품평</a></li>
              <li><a href="#section42">포토 후기</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>    

<div id="section1" class="container-fluid">
  <h1>가격</h1>
  <div class="img-thumbnail" style='float: left;  position: relative;'>
    <IMG src="./storage/main_images/${itemVO.thumb }" >
  </div>
  <div style='float: right; width: 500px; position: relative;'>
    <div class='item_div'>상품명: ${itemVO.item_name }</div>
    <div class='item_div_red'>상품 정가: <del>${itemVO.item_price }</del>원 </div>  
    <div class='item_div_red'>할인률: ${itemVO.discount_rate } %</div>
    <div class='item_div'>판매가격: ()cont에 계산식 )원</div>
    <div class='item_div'>상품 재고: ${itemVO.item_stock }</div>
    <div class='item_div'>원산지: ${itemVO.item_origin }</div>
    <div class='item_div'>수량
      <input type='number' name='quantity' value='' required="required" 
                  placeholder="2" min="1" max="50" step="1" 
                  style='width: 10%;' class="form-control" >
      <span><button>결제</button></span>
    </div>
    <a href="#">진행중인 이벤트가 궁금하다면 ?</a>
    <a href="#">진행중인 이벤트가 궁금하다면 ?</a>
  </div>
</div>
<div id="section2" class="container-fluid">
  <h1>상세설명</h1>
  <p>${itemVO.item_content }</p>
</div>
<div id="section3" class="container-fluid">
  <h1>상품 피부 효과</h1>
  <p>${itemVO.item_effect }</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section41" class="container-fluid">
  <h1>상품평</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section42" class="container-fluid">
  <h1>포토 후기</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>

  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
