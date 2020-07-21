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

    <DIV class='message'>
      <fieldset class='fieldset_basic'>
        <UL>
          <c:choose>
            <c:when test="${param.upload_count > 0 }">
              <LI class='li_none'><span class='span_success'>파일을
                  등록했습니다.</span></LI>
              <LI class='li_none'><span class='span_success'>정상
                  등록된 파일 ${param.upload_count} 건</span></LI>
            </c:when>
            <c:otherwise>
              <LI class='li_none'><span class='span_fail'>파일
                  등록에 실패했습니다.</span></LI>
            </c:otherwise>
          </c:choose>
          <LI class='li_none'><br>
            <button type='button'
              onclick="location.href='./create.do?itemno=${param.itemno }'"
              class="btn btn-info">파일 계속 업로드</button>
            <button type='button'
              onclick="location.href='../item/read.do?itemnoo=${param.itemno }'"
              class="btn btn-info">업로드된 파일 확인</button>
            <button type='button'
              onclick="location.href='../item/read.do?itemno=${param.itemno }'"
              class="btn btn-info">글 조회</button>
            <button type='button'
              onclick="location.href='../item/list.do}'"
              class="btn btn-info">글 목록</button></LI>
        </UL>
      </fieldset>

    </DIV>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>


