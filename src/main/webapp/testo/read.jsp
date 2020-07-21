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
    <c:set var="testqno" value="${testoVO.testqno }" />
    <c:set var="testono" value="${testoVO.testono }" />
    <c:set var="testo_seqno" value="${testoVO.testo_seqno }" />
    <DIV class='title_line'>
      <span class="title"> 자 가 진 단 질 문 항 목 조 회 </span>

    </DIV>
    <div class='menu_line'></div>

    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="testqno" value="${testqno}"> <input
        type='hidden' name='testq_seqno' id='testq_seqno'
        value='${testo_seqno }'> <input type='hidden'
        name='testq_tot' id='testq_tot' value='${testono }'>


          <ASIDE style='float: right; font-size: 12px; margin-bottom: 0px;'>


            <A href="javascript:location.reload();" class="bluelink">새로고침</A>
            <span class='menu_divide'> | </span> <A
              href='./list_all.do' class="bluelink">목록</A> <span
              class='menu_divide'> | </span> <A
              href='./update.do?testono=${testono }' class="bluelink">수정</A>

            <span class='menu_divide'> | </span> <A
              href='./delete.do?testono=${testono }' class="bluelink">삭제</A>
            
          </ASIDE> 

         <div>
          <li class="li_none">
            ${testoVO.testo_content }
          </li>
         </div>
        

      <!--     </fieldset> -->
    </FORM>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
