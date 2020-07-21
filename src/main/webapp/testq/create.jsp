<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>♥SKINFIT♥</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.1/js/bootstrap.min.js"></script>

<script src="../javascript/script.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
  
</script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div class=material>
    <DIV class='test_title_line'>
      <span class="title"> ♥피부 타입 자가진단 질문♥ </span>


    </DIV>
    <div>
      <ASIDE style='float: right;'>
        <A href='./list_paging.do'>목록</A>

      </ASIDE>
    </div>
    <div class='testq_area'>

      <FORM name='frm' method='POST' action='./create.do'
        class="form-horizontal" enctype="multipart/form-data">

        <div class="formarea">
          <textarea class="textarea" name='testq_content'
            id='testq_content' rows='6' placeholder="질문을입력하세요"
            style='width: 80%;'></textarea>
        </div>

        <div class="formarea">
          <input type='file' class="form-control" name='testq_imgMF'
            id='testq_imgMF' value='' placeholder="파일 선택"
            multiple="multiple">
        </div>


        <div class="formarea">
          <input type='number' name='testq_seqno' value='1'
            required="required" placeholder="${testq_seqno }" min="1"
            max="1000" step="1" placeholder='출력순서' style='width: 30%;'>
        </div>


        <button type="submit" class="click">등록</button>
        <button type="button" class="click"onclick="location.href='./list_paging.do'">취소[목록]</button>


      </FORM>
    </div>
  </div>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
