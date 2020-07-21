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
              <TD class='itemgrp_table_td'>카테고리</TD>
              <TD class='itemgrp_table_td'>
                <select  id="grpno" name="grpno" class="form-control" required="required">
                  <option value="#">카테고리 선택</option>
                  <option value="1">제품라인별</option>
                  <option value="2">피부고민별</option>
                  <option value="3">주요원료별</option>
                </select>        
              </TD>
            </TR>          
            <TR>
                <TD class='itemgrp_table_td'>상품이름</TD>
                <TD class='itemgrp_table_td'>
                  <select  id="itemno" name="itemno" class="form-control" required="required">
                    <option value="#">상품 이름 선택</option>
                    <option value="1">망고 로션</option>
                    <option value="2">망고 스킨</option>
                    <option value="3">코코넛 로션</option>
                    <option value="4">코코넛 스킨</option>
                  </select>    
                </TD>
            </TR>
            <TR>
                <TD class='itemgrp_table_td'>피부타입 결과</TD>
                <TD class='itemgrp_table_td'>
                  <input type='text' name='testresult_type' value='' required="required"
                           placeholder="건성" class='' style='width: 50%;'>      
                </TD>
            </TR>
            <TR>
                <TD class='itemgrp_table_td'>결과별 화장품추천</TD>
                <TD class='itemgrp_table_td'>
                  <input type='text' name='testresult_recom' value='' required="required"
                           placeholder="촉촉한 로션을 추천합니다" class='' style='width: 50%;'>
                </TD>
            </TR>
            <TR>
                <TD class='itemgrp_table_td'>추천 세트 가격</TD>
                <TD class='itemgrp_table_td'>
                  <input type='number' name='recom_price' value='' required="required" 
                            placeholder="5000" min="1" max="500000" step="1" 
                            style='width: 50%;' class="form-control" >      
                </TD>
            </TR>
  
  </TABLE>
  
  <div class="content_bottom_menu">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
  </div>  
  </FORM>

</div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 