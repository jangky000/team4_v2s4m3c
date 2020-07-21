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
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  

  <ASIDE style='float: left;'>
    ${eventVO.event_title} 관련 이미지 삭제
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='javascript: history.back()'>취소</A>
    <span class='menu_divide' >│</span> 
    <A href='./list_paging.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' id='frm' method='POST' action='./jpg_delete.do' 
                class="form-horizontal">
      <!-- FK memberno 지정 -->

      <!-- FK categrpno 지정 -->

      <input type='hidden' name='eventno' id='eventno' value='${param.eventno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <DIV style='width:640px; margin: 0px auto;'>
            등록된 이미지를 삭제 하시겠습니까? 삭제된 파일은 복구 할 수 없습니다.<br>
            관련글명: ${eventVO.event_title}<br>
            파일명: ${eventVO.event_img}<br>
          </DIV>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12" style='text-align: center;'>
          <input type='password' class="form-control" name='event_passwd' id='event_passwd' value='' placeholder="패스워드" 
                    style='width: 20%; margin: 0px auto;'>
        </div>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="button" id='btn_send' class="btn btn-info">삭제</button>
        <button type="button" 
                    onclick="history.back()" class="btn btn-info">취소</button>
      </DIV>
       
    </FORM>
  </DIV>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

