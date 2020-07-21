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

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div class=material>

    <DIV class='title_line'>
      <span class="title"> 자 가 진 단 질 문 항 목 수 정 </span>

    </DIV>
    <div class='menu_line'></div>

    <FORM name='frm' method="post" action='./update.do'>
      <c:set var="testqno" value="${testoVO.testqno }" />
      <c:set var="testono" value="${testoVO.testono }" />
      <c:set var="testo_seqno" value="${testoVO.testo_seqno }" />
      <input type="hidden" name="testqno" value="${testqno}"> 
       


          <ASIDE style='float: right; font-size: 12px; margin-bottom: 0px;'>


            <A href="javascript:location.reload();" class="bluelink">새로고침</A>
            <span class='menu_divide'> | </span> <A
              href='./list.do' class="bluelink">목록</A> <span
              class='menu_divide'> | </span> <A
              href='./update.do?testono=${testono }' class="bluelink">수정</A>

            <span class='menu_divide'> | </span> <A
              href='./delete.do?testono=${testono }' class="bluelink">삭제</A>
            
          </ASIDE> 


      <div class="form-group">   
        <div class="col-md-12">
         <div class="formarea">
         <input type='text' name='testo_content' id='testo_content' rows='6' placeholder="${testoVO.testo_content }" style='width:80%;'></textarea>
         </div>
  
        <label>출력 순서</label>
          <input type='number' name='testq_seqno' value='${testo_seqno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
        </div>
      </div>   
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" onclick="location.href='./list.do'" class="btn btn-info">취소[목록]</button>
      </DIV>
      <!--     </fieldset> -->
    </FORM>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
