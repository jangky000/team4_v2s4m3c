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
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class= material>
<DIV class='test_title_line'>
    <span class="title"> ♥피부 타입 자가진단 질문 항목♥ </span>
</DIV>
<div>
  <ASIDE style='float: right;'>
    <A href='./list.do'>목록</A>

  </ASIDE> 
</div>

<div class= 'testq_area'>

    <FORM name='frm' method='POST' action='./create.do' >
<!--        <input type='hidden' name='testqno' id='testqno' value=''> -->

      <div class="formarea">
      질문번호
        <input type='number' name='testqno' required="required" 
                 value="${testqno }" min="1" max="1000" step="1" placeholder='질문번호'
                 style='width: 30%;' > 
     </div>
     
     <div class="formarea">
     질문항목등록<textarea class="text" name='testo_content' id='testo_content' rows='6' placeholder="항목옵션" style='width:80%;'>${testq_content }의 항목</textarea>
      </div>
      
        <div class="formarea">
        출력순서
       <input type='number' name='seqno' value='1' required="required" 
                 placeholder="${testo_seqno }" min="1" max="1000" step="1" 
                 style='width: 30%;' class="form-control" >
     </div>


        <button type="submit" class="click">등록</button>
        <button type="button" class="click"
                    onclick="location.href='./list.do}'" 
                    >취소[목록]</button>

       
    </FORM>
  </div>
  </div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>   
 