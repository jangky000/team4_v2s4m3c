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
  <link href="../css/style.css" rel="Stylesheet" type="text/css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript"></script>
  <script src="../javascript/script.js"></script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
<DIV class= material>
  <DIV class='itemgrp_title_line'>카테고리 그룹 > 삭제</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_create' id='frm_create' method='POST' action='./delete.do'>
     <input type='hidden' name='grpno' id='grpno' value='${itemgrpVO.grpno }'>  
          
      <label>그룹 이름</label>:${itemgrpVO.name } &nbsp;
      <label>순서</label>: ${itemgrpVO.visibleno } &nbsp; 
      <label>출력 형식</label>: ${ItemgrpVO.visible} &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
    </FORM>
  </DIV>
 
<TABLE style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/> 
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">출력순서</TH>
    <TH class="th_bs">고유번호</TH>
    <TH class="th_bs">상품 분류명</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>    
  </TR>
  </thead>
   <!--  grpno, name, visibleno, visible, rdate  --> 
  <tbody>
    <c:forEach var="ItemgrpVO" items="${list }"><!-- request 객체에 접근 -->
     <c:set var="grpno" value="${ItemgrpVO.grpno}" />
    <TR>
      <TD class="td_bs">${ItemgrpVO.visibleno }</TD>   
      <TD class="td_bs">${ItemgrpVO.grpno }</TD>
      <TD class="td_bs_left">${ItemgrpVO.name }</TD>  
      <TD class="td_bs">${ItemgrpVO.rdate }</TD>
      <TD class="td_bs">${ItemgrpVO.visible }</TD>

      <TD class="td_bs">
        <A href="./read_update.do?grpno=${grpno }">수정</A>
        <A href="./read_delete.do?grpno=${grpno }">삭제</A>      
      </TD>             
    </TR>
   </c:forEach>
  </tbody>
</TABLE>
 
</DIV>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 