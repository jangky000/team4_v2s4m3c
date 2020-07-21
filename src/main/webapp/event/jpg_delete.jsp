<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_send').on('click', send); 
  });

  // jQuery ajax 요청
  function send() {
    var frm = $('#frm');
    var eventno = $('#eventno', frm).val();
    var event_passwd = $('#event_passwd', frm).val();
    
    var params = 'eventno=' + eventno + '&event_passwd=' + event_passwd;
    var msg = '';

    $.ajax({
      url: './event_passwd.do',
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
         alert(rdata);
        var msg = "";
          
        if (rdata.cnt > 0) { // 패스워드 일치
          frm.submit();
        } else {  // 패스워드 불일치
          msg = "패스워드가 일치하지 않습니다.";
          
          $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
          $('#modal_title').html('패스워드 에러'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
  }

</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div class='material_center' style="height: 450px; background-image: url('./images/gallery_bg.png');background-size: contain;">

<div class='title_line_center'style='background-color: transparent; height: 30%; '><span class="title"style='text-align: center; background-color: transparent; '>
    ${eventVO.event_title} 관련 이미지 삭제
</span></div>

 
 <DIV style='width: 60%; margin:auto; padding-top:10%; background-color: transparent;'>
  <DIV style='width: 100%;'>
    <FORM name='frm' id='frm' method='POST' action='./jpg_delete.do' 
                class="form-horizontal"style="background-color: transparent; ">

      <input type='hidden' name='eventno' id='eventno' value='${param.eventno }'>
      
  

          <DIV style='margin: 0px auto; text-align: center; '>
            등록된 이미지를 삭제 하시겠습니까? <br>
            삭제된 파일은 복구 할 수 없습니다.<br>
            관련글명: ${eventVO.event_title}<br>
            파일명: ${eventVO.event_img}<br>
          </DIV>



      <div >   
            <div style="text-align: center;background-color: transparent;">
              <input type='password' name='event_passwd'
                id='event_passwd' value='' placeholder="패스워드"
                style='width: 50%;background-color: transparent !important;'>
            </div>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="button" id='btn_send' class="btn btn-info">삭제</button>
        <button type="button" 
                    onclick="history.back()" class="btn btn-info">취소</button>
      </DIV>
       
    </FORM>
  </DIV>
</DIV> 
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

