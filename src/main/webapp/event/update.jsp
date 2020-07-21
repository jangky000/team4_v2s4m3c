<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
  <script type="text/javascript">
  $(function() {
    CKEDITOR.replace('event_content');  // <TEXTAREA>태그 id 값
  });
  </script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class= material>
<DIV class='title_line'>
   <span class="title"> 이 벤 트 > ${eventVO.event_title}>글 수정 </span>
     <ASIDE style='float: right;'>
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
   </div>



 

  <DIV style='width: 100%;'>
  <div class= 'table_area'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal" enctype="multipart/form-data">
      <input type='hidden' name='event_seqno' id='event_seqno' value='1'> 
        <input type='hidden' name='event_visible' id='event_visible' value='1'> 
        
<!--          <input type='hidden' name='event_img' id='event_img' value=''> 
          <input type='hidden' name='event_timg' id='event_timg' value=''>   -->
          
           <input type='hidden' name='eventno' id='eventno' value='${eventVO.eventno }'>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='event_title' value='${eventVO.event_title }' 
                    placeholder="제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='event_content' id='content' rows='10' placeholder="내용">${eventVO.event_content }</textarea>
        </div>
      </div>
      
     <div class="form-group">   
        <div class="col-md-12">
          <!-- 실제 컬럼명: fiel1, Spring File 객체 대응: fiel1MF  -->
          <input type='file' class="form-control" name='event_imgMF' id='event_imgMF' 
                    value='' placeholder="파일 선택" multiple="multiple"value='${eventVO.event_img}'>
        </div>
      </div> 

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='event_due' value='${eventVO.event_due}' placeholder="이벤트기간" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='event_passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>

      
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list_paging.do'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>
</div>
  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

