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
  $(function(){
    $('#btn_next').on('click', cookie_save);
    $('#btn_result').on('click', check_cookie);
  });

  function check_cookie(){
    cookie_save();
    
    //alert('check_cookie');
    /* for(var i = 0; i<13; i++){ 
      alert(getCookie(i));
    } */
    /* location.href="./test_result.do"; */
    var frm = $('#frm');
    frm.submit();
  }
  
  function cookie_save(){
    var frm = $('#frm');
    var testqno = $('#testqno', frm).val();
    // alert(testqno);
    var testo_seqno = $('input:radio[name=testo_seqno]:checked').val();
    if(testo_seqno == null){
      alert('정확한 진단을 위해 항목을 체크해주시기 바랍니다♥♥');
      return;
    }
    // alert(testo_seqno);
    /* var testqArr = new Array();
    testqArr.push(testqno);

    var testoArr = new Array();
    testoArr.push(testo_seqno);
 */    
    /* setCookie('testqno', testqArr, 30); // 30분
    setCookie('testo_seqno', testoArr, 30);
 */
    //deleteCookie(testqno+1);

    setCookie("tq"+testqno, testo_seqno, 30);

    if(testqno < 12){
      location.href='./apply.do?testqno=${param.testqno+1}';
    }
    
  }

  function setCookie(name, value, exp){ // exp는 분단위 -> 30 지정
    var date = new Date();
    date.setTime(date.getTime() * exp*60*1000);
    document.cookie = name + '=' + value + ";expires=" + date.toUTCString() + ';path=/';
  }

  function getCookie(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
  };

  function deleteCookie(name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    }


</script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />
  <div class='material_center'
    style=" background-image: url('./images/gallery_bg.png'); background-size: contain; width: 40%;">
    <FORM id='frm' name='frm' method="post" action='./test_result.do'
      style="background-color: transparent;">
      <input type="hidden" id="testqno" name="testqno" value="${param.testqno}">
      <div class="question">${testqVO.testq_content}</div>
      <br>
      <div>
         ${testqVO.testq_img}
      </div>

      <c:forEach var="testoVO" items='${list}'>
        <c:set var="testo_content" value="${testoVO.testo_content}" />
        <c:set var="testo_seqno" value="${testoVO.testo_seqno}" />

        <div class="option" style="background-color: transparent;">
          <label style="background-color: transparent;"><input type="radio" name="testo_seqno" value="${testo_seqno }">${testo_content}</label>
        </div>
      </c:forEach>
      <br>
      <div style="text-align: center; background-color: transparent; margin-top: 10%">
      <c:choose>
        <c:when test="${testqVO.testqno<13}">
            <button type="button" id="btn_next" class="click" style="font-size: 20px; ">다음</button><!-- onclick="location.href='./apply.do?testqno=${param.testqno+1}' -->
        </c:when>
        <c:otherwise>
          <button type="button" id="btn_result" class="click"style="font-size: 20px; ">진단결과보기</button>
           <button type="button" class="click" onclick="location.href='./apply.do?testqno=0'"style="font-size: 20px; ">다시하기</button>
        </c:otherwise>
      </c:choose>
      </div>
    </FORM>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
