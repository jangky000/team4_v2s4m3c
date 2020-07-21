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
  
  <script type="text/javascript">
  $(function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
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
  
  <FORM name='frm' method='POST' action='./update.do'>
    <!-- itemgrp 테이블로부터 값을 전달받지 못한 경우는 값을 직접 지정하여 개발 -->
    <input type="hidden" name="grpno" id="grpno"value="${itemVO.grpno }">
    <input type="hidden" name="itemno" id="itemno"value="${param.itemno }">
  <TABLE class='tbl_sty' style="width: 80%; margin: 10px auto;">
    <TR>
      <TD class='itemgrp_table_td'>카테고리</TD>
      <TD>
         ${itemVO.grpno }
     </TD> 
    </TR>        
    <TR>
      <TD class='itemgrp_table_td'>상품이름</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_name' value='${itemVO.item_name }' required="required" 
                  class='' style='width: 50%;'>
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>재고량</TD>
      <TD class='itemgrp_table_td'>
      <input type='number' name='item_stock' value='${itemVO.item_stock }' required="required" 
                min="1" max="100" step="1" 
               style='width: 50%;' class="form-control" >
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 판매가</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='item_price' value='${itemVO.item_price }' required="required" 
                 min="1" max="500000" step="1" 
                 style='width: 50%;' class="form-control" >
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 원가</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='item_cost' value='${itemVO.item_cost }' required="required" 
                   min="1" max="500000" step="1" 
                  style='width: 50%;' class="form-control" >      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>할인률</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='discount_rate' value='${itemVO.discount_rate }' required="required" 
                 min="1" max="100" step="1" 
                 style='width: 50%;' class="form-control" >      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 설명</TD>
      <TD class='itemgrp_table_td'>
        <TEXTAREA name='item_content' id='content' rows='10' cols='70'>
           ${itemVO.item_content }
        </TEXTAREA>  
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 타입</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_type' value='${itemVO.item_type }' required="required"
                  class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 효과</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_effect' value='${itemVO.item_effect }' required="required"
                 class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>원산지</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_origin' value='${itemVO.item_origin }' required="required"
                 class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>출력</TD>
      <TD class=''>
        <input type='radio' name='item_visible' value='Y' required="required"
                  class='' style='width: 10%;'>Y
        <input type='radio' name='item_visible' value='N' required="required"
                  class='' style='width: 10%;'>N
      </TD>
    </TR>
  </TABLE>
  
  <div class="content_bottom_menu">
      <button type="submit" class="btn">수정</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn">목록</button>
  </div>  
  </FORM>

</div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 