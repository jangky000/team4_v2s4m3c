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
  <DIV class='itemgrp_title_line'>상품 수정</DIV>
  
  <FORM name='frm' method='POST' action='./update_image.do' enctype='multipart/form-data'>
    <!-- itemgrp 테이블로부터 값을 전달받지 못한 경우는 값을 직접 지정하여 개발 -->
    <input type="hidden" name="itemno" id="itemno"value="${param.itemno }">
    <input type="hidden" name="grpno" id="grpno"value="${param.grpno }">
    
    <DIV class='itemgrp_title_line'>이미지 정보</DIV>
      <input type='file' class="form-control" name='upfileMF' id='upfileMF' 
               value='' placeholder="파일 선택">   
    <DIV class='itemgrp_title_line'>이미지 정보</DIV>

  <div class="content_bottom_menu">
      <button type="submit" class="btn">수정</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn">목록</button>
  </div>  
  </FORM>

</div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 