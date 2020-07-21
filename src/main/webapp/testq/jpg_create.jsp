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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../javascript/script.js"></script>
<script type="text/javascript">

</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class='material_center' style="height: 450px; background-image: url('./images/gallery_bg.png');background-size: contain;">
  




  <div style='text-align:center; font-size: 25px; margin:10%; background-color: transparent;'>
    ${testqVO.testq_content} 관련 이미지 등록
  </div>

 

  <DIV style="width: 100%; background-color: transparent;">
    <FORM name='frm' id='frm' method='POST' action='./jpg_create.do' 
                enctype="multipart/form-data" class="form-horizontal"style="background-color: transparent;">
      <input type='hidden' name='testqno' id='testqno' value='${param.testqno }'>
            <input type='hidden' name='testq_timg' id='testq_timg' value='${testqVO.testq_timg }'>


          <input type='file' class="form-control" name='testq_imgMF' id='testq_imgMF' 
                    value='' placeholder="파일 선택" multiple="multiple" style="background-color: transparent;margin:10%; width: 80%;">


      
      <DIV class='content_bottom_menu'style="margin-top:30%;">
        <button type="submit" id='btn_send' >등록</button>
        <button type="button" 
                    onclick="location.href='./list_paging_grid.do?'" 
                    >취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>
  </div>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

