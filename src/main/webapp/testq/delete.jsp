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
 
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <div class= "material_center">
      <div class='title_line_center'><span class="title">♥ 질문 ${testqVO.testq_content} 삭제♥</span></div>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='testqno' value='${param.testqno}'>
        
              <div class="form-group">   
                <div class="text_center_delete" style='text-align: center;'>
                  ${testqVO.testq_content }를 삭제하시겠습니까? <br><br>삭제하시면 복구 할 수 없습니다.<br><br>
                  
        
                  
                  <button type = "submit" class="btn btn-info">삭제 진행</button>
                  <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
                  <button type = "button" onclick = "location.href='./list_paging.do'" class="btn btn-info">목록</button>
                </div>
              </div>   
          </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

