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
        <a href='${root}/note/list.do'>공지사항</a><!-- 상훈 공지사항 -->
        <a href='${root}/qna/list.do'>Q&A</a>
        <a href="${root}/itemgrp/list.do">상품 큰목록</a><!-- 혜정 상품 -->
        <%-- <a href="${root}/testo/list_join.do">진단항목JOIN</a> --%>
        <a href="${root}/testq/apply.do?testqno=0">피부 자가 진단 합체</a>
        <%-- <a href="${root}/testq/list_paging.do">test</a> --%>
        <%-- <a href="${root}/testo/list.do">피부 자가 진단 항목</a> --%>
        <a href="${root}/recommand/list.do">나에게 맞는 화장품 추천</a><!-- 수지 &혜정: 상의합시다-->
        <a href="${root}/event/list_paging.do">이벤트</a><!-- 수지 이벤트 -->
        <a href="${root}/item/list_all.do">조인 상품 리스트 test1</a><!-- 혜정 이벤트 -->
        <a href="${root}/thumbnail/list.do">썸네일 파일</a><!-- 혜정 이벤트 -->        
        <%-- <a href="${root}/recommand/create.do">추천 등록</a><!-- 혜정 이벤트 --> --%>
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
        <c:choose>
        <c:when test="${sessionScope.mem_id == null}">
          <A href='${root}/loginmode.jsp'><img class="icon" src="${root}/menu/images/icon/login-01-01.svg"></A>
        </c:when>
        <c:when test="${sessionScope.mem_id != null}">
        <A href='${root}/mem/mypage_logout_select.jsp?memno=${memno}'><img class="icon" src="${root}/menu/images/icon/heart.png"></A>
        </c:when>
        </c:choose>
        <!-- 브가 회원 로그인 및 가입여기에 연결하면될 것 같아 -->
        <div class="openBtn" onclick="openSearch()"><img class="icon" src="${root}/menu/images/icon/search-01-01.svg"></div>
        <!-- <img class="icon" src="images\icon\search-01-01.svg"> -->
      </div>
    </div>
 
     <div id="contents">
   
   