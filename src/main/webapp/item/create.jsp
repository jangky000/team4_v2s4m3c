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
  
    $(function() {
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
  <DIV class='itemgrp_title_line'>상품 등록</DIV>
  
  <FORM name='frm' method='POST' action='./create.do' enctype='multipart/form-data'>
  <TABLE class='tbl_sty' style="width: 80%; margin: 10px auto;" >
      <TR>
      <TD class='itemgrp_table_td'>카테고리</TD>
      <TD class='itemgrp_table_td'>
        <select  id="grpno" name="grpno" class="form-control" required="required">
        <c:forEach var="grp" items="${grplist }">
          <option value="${grp.grpno }">${grp.name }</option>
        </c:forEach>
        </select>        
      </TD>
    </TR>          
    <TR>
      <TD class='itemgrp_table_td'>상품이름</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_name' value='' required="required" 
                 placeholder="로션" class='' style='width: 50%;'>
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>재고량</TD>
      <TD class='itemgrp_table_td'>
      <input type='number' name='item_stock' value='' required="required" 
               placeholder="5" min="1" max="100" step="1" 
               style='width: 50%;' class="form-control" >
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 판매가</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='item_price' value='' required="required" 
                 placeholder="5000" min="1" max="500000" step="1" 
                 style='width: 50%;' class="form-control" >
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 원가</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='item_cost' value='' required="required" 
                  placeholder="5000" min="1" max="500000" step="1" 
                  style='width: 50%;' class="form-control" >      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>할인률</TD>
      <TD class='itemgrp_table_td'>
        <input type='number' name='discount_rate' value='' required="required" 
                 placeholder="30" min="1" max="100" step="1" 
                 style='width: 50%;' class="form-control" >      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 설명</TD>
      <TD class='itemgrp_table_td'>
        <TEXTAREA name='item_content' id='content' rows='10' cols='70'>
        </TEXTAREA>          
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 타입</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_type' value='' required="required"
                 placeholder="로션" class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>제품 효과</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_effect' value='' required="required"
                 placeholder="물광 피부" class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>원산지</TD>
      <TD class='itemgrp_table_td'>
        <input type='text' name='item_origin' value='' required="required"
                 placeholder="국내산" class='' style='width: 50%;'>      
      </TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>출력</TD>
      <TD class='itemgrp_table_td'>
        <input type='radio' name='item_visible' value='Y' required="required"
                  class='' style='width: 10%;'>Y
        <input type='radio' name='item_visible' value='N' required="required"
                  class='' style='width: 10%;'>N      
      </TD>
    </TR>
  </TABLE>
   
  <DIV class='itemgrp_title_line'>이미지 정보</DIV>
  <TABLE class='tbl_sty' style="width: 80%; margin: 10px auto;">
    <TR>
      <TD class='itemgrp_table_td'>이미지 등록</TD>
    </TR>
    <TR>
      <TD class='itemgrp_table_td'>
        <%-- 실제 컬럼명: fiel1, Spring File 객체 대응: fiel1MF --%>
        <input type='file' class="form-control" name='upfileMF' id='upfileMF' 
                 value='' placeholder="파일 선택" multiple="multiple">
      </TD>
    </TR>
  </TABLE>
  
  <div class="content_bottom_menu">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn">목록</button>
  </div>  
  </FORM>

</div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 