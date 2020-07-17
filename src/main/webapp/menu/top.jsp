<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
// String root = request.getContextPath(); // /resort 
// ${pageContext.request.contextPath}
%>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<div id="container">
    <div id="header">
      <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <br><br>
        <a href="#">공지사항</a><!-- 상훈 공지사항 -->
        <a href="#">쇼핑</a><!-- 혜정 상품 -->
        <a href="#">피부 자가 진단</a>
        <a href="#">나에게 맞는 화장품 추천</a><!-- 수지 &혜정: 상의합시다-->
        <a href="#">이벤트</a><!-- 수지 이벤트 -->

      </div>

      <div class="navicon">
        <span onclick="openNav()"> <img src="${root}/menu/images/icon/menu_grey_s.svg" style="width:40px;"></span>
      </div>

      <!-- <div class="main-icon"> -->
      <!-- 검색 -->
      <div id="myOverlay" class="overlay">
        <div class="closebtn" onclick="closeSearch()" title="Close Overlay" style="background-color: rgba(0,0,0, 0);">x</div>
        <div class="overlay-content">
          <form action="/action_page.php">
            <input type="text" placeholder="검색어를 입력하세요 (규영:내생각엔 이 밑에 실시간 검색 함께 나오면괜찮을 듯-SJ)" name="search">
            <button type="submit">ENTER</button>
          </form>
        </div>
      </div>

      <!-- 검색끝 -->
      <div class="main-icon">
        
        <a href='${root}'><img class="icon" src="${root}/menu/images/icon/menu_navigation_grid2.png "></a><!--home button icon 향후 업데이트예정 (임시)  -->
        <a href="${root}/shopping_cart/list.do"><img class="icon" src="${root}/menu/images/icon/cart-01.svg"></a> <!-- 규영 카트 -->
        <a href="${root}/porder/list.do?memno=1"><img class="icon" src="${root}/menu/images/icon/login-01-01.svg"></a> <!-- 브가 회원 로그인 및 가입여기에 연결하면될 것 같아 -->
        <div class="openBtn" onclick="openSearch()"><img class="icon" src="${root}/menu/images/icon/search-01-01.svg"></div>
        <!-- <img class="icon" src="images\icon\search-01-01.svg"> -->
      </div>
    </div>
 
     <div id="contents">
   
   