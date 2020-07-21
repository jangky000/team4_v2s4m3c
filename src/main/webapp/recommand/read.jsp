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
  <script src="../javascript/script.js"></script>
  
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
   
  <script type="text/JavaScript">
    // window.onload=function(){
    //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
    // };
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
  <DIV class='itemgrp_title_line'>상품 등록</DIV>
  <FORM name='frm' method='POST' action='./create.do' enctype='multipart/form-data'>
  <TABLE class='tbl_sty' style="width: 80%; margin: 10px auto;" >      
      <TR>
        <TD class='itemgrp_table_td'>상품 번호 -> 이름</TD>
        <TD class='itemgrp_table_td'> ${recomVO.itemno }</TD>
      </TR>
      <TR>
        <TD class='itemgrp_table_td'>피부타입 결과</TD>
        <TD class='itemgrp_table_td'> ${recomVO.testresult_type }</TD>
      </TR>
      <TR>
        <TD class='itemgrp_table_td'>결과별 화장품추천</TD>
        <TD class='itemgrp_table_td'> ${recomVO.testresult_recom }</TD>
      </TR>
      <TR>
        <TD class='itemgrp_table_td'>추천 세트 가격</TD>
        <TD class='itemgrp_table_td'> ${recomVO.recom_price }</TD>
      </TR>

  </TABLE>
  
  <div class="content_bottom_menu">
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
  </div>  
  </FORM>

</div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 