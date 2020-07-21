<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>♥SKINFIT♥</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/js/bootstrap.min.js"></script>
 <script src="../javascript/script.js"></script>



</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class='material_center' style="height: 450px; background-image: url('./images/gallery_bg.png');background-size: contain;">

<div class='title_line_center'style='background-color: transparent; height: 30%; '><span class="title"style='text-align: center; background-color: transparent; '>
    ${testqVO.testq_content} 관련 이미지 삭제
</span></div>

 
 <DIV style='width: 60%; margin:auto; padding-top:10%; background-color: transparent;'>
  <DIV style='width: 100%;'>
    <FORM name='frm' id='frm' method='POST' action='./jpg_delete.do' 
                class="form-horizontal"style="background-color: transparent; ">

      <input type='hidden' name='testqno' id='testqno' value='${param.testqno }'>
      
  

          <DIV style='margin: 0px auto; text-align: center; '>
            등록된 이미지를 삭제 하시겠습니까? <br>
            삭제된 파일은 복구 할 수 없습니다.<br>
            관련글명: ${testqVO.testq_title}<br>
            파일명: ${testqVO.testq_img}<br>
          </DIV>


      
      <DIV class='content_bottom_menu'>
        <button type="submit" id='btn_send' class="btn btn-info">삭제</button>
        <button type="button" 
                    onclick="history.back()" class="btn btn-info">취소</button>
      </DIV>
       
    </FORM>
  </DIV>
</DIV> 
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

