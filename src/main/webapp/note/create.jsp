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
    CKEDITOR.replace('note_content');  // <TEXTAREA>태그 id 값
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
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">



      <div class="form-group">
  
        <label class="control-label col-md"></label>
        <div class="col-md-12">
          <select name='notecate' class="form-control"style='width: 20%;'>
            <option value='선택' selected="selected">선택</option>
            <option value='이벤트공지'>이벤트공지</option>
            <option value='매장공지'>매장공지</option>
          </select>
        </div>
      </div>


        <div class="form-group">
          <div class="col-md-12">
            <input type='text' class="form-control" name='note_title'
              value='${noteVO.note_title}' placeholder="제목"
              required="required" style='width: 80%;'
              autofocus="autofocus">
          </div>
        </div>
        

      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='note_content' rows='10' placeholder="내용"></textarea>
        </div>
      </div>

        <div class="form-group">
          <label class="control-label col-md">출력 순서</label>
          <div class="col-md-12">
            <input type='number' name='note_seqno' value='1'
              required="required" placeholder="${note_seqno }" min="1"
              max="1000" step="1" style='width: 10%;'
              class="form-control">
          </div>
        </div>

        <div class="form-group">
          <div class="col-md-12">
            <input type='text' class="form-control" name='note_manager'
              value='${noteVO.note_manager }' placeholder="작성자"
              required="required" style='width: 10%;'
              autofocus="autofocus">
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-md-12">
            <input type='text' class="form-control" name='note_pass'
              value='${noteVO.note_pass }' placeholder="비밀번호"
              required="required" style='width: 10%;'
              autofocus="autofocus">
          </div>
        </div>


        <DIV class='content_bottom_menu'>
              <button type="submit" class="btn btn-primary">등록</button>
              <button type="button"
                onclick="location.href='./list.do?noteno=${param.noteno}'"
                class="btn btn-primary"">취소[목록]</button>
            </DIV>
      </FORM>
  </DIV>
</div>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

