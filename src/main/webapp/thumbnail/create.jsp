<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>hyejung world</title>

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link
  href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
  rel="stylesheet">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
table.tbl_sty {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	background-color: white;
}

table.tbl_sty tr {
	border: 1px solid gray;
	background-color: white;
}

table.tbl_sty th {
	border: 1px solid gray;
	background-color: white;
}

table.tbl_sty td {
	border-bottom: 1px solid gray;
	background-color: white;
}
</style>
</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div style="width: 80%; margin: 20px auto;">
    <DIV class='title_line'>첨부 파일</DIV>

    <ASIDE style='float: left;'>신규 등록</ASIDE>
    <ASIDE style='float: right;'>
      <A href='./list.do'>목록</A>
      <!-- <span class='menu_divide' >│</span> -->
    </ASIDE>

    <div class='menu_line'></div>
    <DIV style='width: 100%;'>
      <FORM name='frm' method='POST' action='./create.do'
        enctype="multipart/form-data" class="form-horizontal">

        <!-- FK cateno 지정 -->
        <input type='hidden' name='itemno' id='itemno'
          value='${param.itemno }'>

        <div class="form-group">
          <div class="col-md-12">
            <input type='file' class="form-control" name='fnamesMF'
              value='' placeholder="파일 선택" multiple="multiple">
          </div>
        </div>

        <DIV class='content_bottom_menu'>
          <button type="submit" class="btn btn-info">파일 전송</button>
          <button type="button"
            onclick="location.href='./list.do?itemno=${param.itemno}'"
            class="btn btn-info">취소[목록]</button>
        </DIV>

      </FORM>
    </DIV>

  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>


