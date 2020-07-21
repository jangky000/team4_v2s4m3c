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
 /*  $(function() {
    CKEDITOR.replace('event_content');  // <TEXTAREA>태그 id 값
  }); */
  </script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class= material>
<DIV class='title_line'>
   <span class="title"> 진 단 질 문 > ${testqVO.testq_content}>질문 수정 </span>
     <ASIDE style='float: right;'>
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
   </div>
   
  <DIV style='width: 100%;'>
  <div class= 'table_area'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal" enctype="multipart/form-data">
      <input type='hidden' name='testqno' id='testqno' value='${testqVO.testqno }'> 


          
      <div class="form-group">   
        <div class="col-md-12">
         <div class="formarea">
         <textarea class="textarea" name='testq_content' id='testq_content' rows='6' style='width:80%;'></textarea>
         </div>
  
       <div class="form-group">   
        <div class="col-md-12">
          <!-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF  -->
          <input type='file' class="form-control" name='testq_imgMF' id='testq_imgMF' 
                    value='' placeholder="파일 선택" multiple="multiple"value='${testqVO.testq_img}'>
        </div>
      </div> 
               <label>순서</label>
          <input type='number' name='testq_seqno' value='${testqVO.testq_seqno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
        </div>
      </div>   
      
      
      <%-- <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='event_content' id='event_content' rows='10' placeholder="내용">${testqVO.testq_content }</textarea>
        </div>
      </div>
   --%>
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" onclick="location.href='./list_paging.do'" class="btn btn-info">취소[목록]</button>
      </DIV>
    </FORM>
  </DIV>
</div>
  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

