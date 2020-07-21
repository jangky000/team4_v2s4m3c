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
  <DIV class='itemgrp_title_line'>카테고리 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>그룹 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'>
 
      <label>출력 순서</label>
      <input type='number' name='visibleno' value='1' required="required" 
               placeholder="${visibleno }" min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>출력 형식</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="history.back();">취소</button>
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
      <TD class="td_bs_left">
        <A href='../item/list_by_grpno_paging.do?grpno=${grpno }'>${ItemgrpVO.name }</A>
      </TD>  
      <TD class="td_bs">${ItemgrpVO.rdate }</TD>
      <TD class="td_bs">${ItemgrpVO.visible }</TD>

      <TD class="td_bs">
        <A href="./read_update.do?grpno=${grpno }">수정</A>
        <A href="./read_delete.do?grpno=${grpno }">삭제</A>      
        <A href="./update_seqno_up.do?grpno=${grpno }">위로!</A>
        <A href="./update_seqno_down.do?grpno=${grpno }">아래로!</A>              
      </TD>             
    </TR>
   </c:forEach>
  </tbody>
</TABLE>
</DIV>
<jsp:include page="/menu/bottom.jsp" />

</body>
 
</html> 
 
 