<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>world</title>
 
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="../css/style.css" rel="Stylesheet" type="text/css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="../javascript/script.js"></script>
  
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
  
<script type="text/javascript">
  $(function() {
    CKEDITOR.replace('qna_content');  // <TEXTAREA>태그 id 값
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
 <div style="margin:20px auto; width:80%">
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='qnano' id='qnano' value='${param.qnano}'>
      <!-- 값을 넘길떄 히든 -->
      <div class="form-group">
  
      <!--   <label class="control-label col-md"></label>
        <div class="col-md-12">
          <select name='qnacate' class="form-control"style='width: 20%;'>
            <option value='선택' selected="selected">선택</option>
            <option value='이벤트공지'>이벤트공지</option>
            <option value='매장공지'>매장공지</option>
          </select>
        </div>
      </div> -->


        <div class="form-group">
          <div class="col-md-12">
            <input type='text' class="form-control" name='qna_title'
              value='${qnaVO.qna_title}' placeholder="제목"
              required="required" style='width: 80%;'
              autofocus="autofocus">
          </div>
        </div>
        

      <div class="form-group">   
        <div class="col-md-10">
          <textarea class="form-control" name='qna_content' rows='10' placeholder="내용" style='width: 50%;' >${qnaVO.qna_content }</textarea>
        </div>
      </div>
        
        <div class="form-group">
          <div class="col-md-12">
            <input type='text' class="form-control" name='qna_name'
              value='${qnaVO.qna_name }' placeholder="작성자"
              required="required" style='width: 10%;'
              autofocus="autofocus">
          </div>
        </div>
        
         <div class="form-group">
          <div class="col-md-12">
            <input type='password' class="form-control" name='qna_pass'
              value='' placeholder="비밀번호"
              required="required" style='width: 10%;'
              autofocus="autofocus">
          </div>
        </div>
              

        <DIV class='content_bottom_menu'>
              <button type="submit" class="btn btn-success">수정</button>
              <button type="button"
                onclick="location.href='./list.do?qnano=${param.qnano}'"
                class="btn btn-success">취소[목록]</button>
            </DIV>
      </FORM>
  </DIV> <!-- <DIV style='width: 100%;'> -->
</div><!--  <div style="margin:20px auto; width:80%"> -->
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

