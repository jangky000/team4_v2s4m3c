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
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../javascript/script.js"></script>
<script type="text/javascript">

$(function() { // 자동 실행
  list_by_eventno_add_view()  // 댓글 목록 출력
  
  $('#btn_create').on('click', reply_create);  // 댓글 등록

/*   if ('${sessionScope.memberno}' != '') { // 로그인된 경우
    // alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

    var frm_reply = $('#frm_reply');
    $('#content', frm_reply).attr('placeholder', '댓글 작성');
  } */

  $('#modal_panel').on('keypress', function (event) {
    // alert("닫기 버튼을 클릭하지 않으셨네요~");
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      // alert("ENTER 눌렀네요~");
      $('#modal_panel_close').click();  // 모달 창 닫기 
    }
  });

  // 댓글 삭제 modal 창이 open 됬을 때 focus 자동 설정
  $('#modal_panel_delete').on(
      'shown.bs.modal', function() {
        $('#passwd', '#frm_reply_delete').focus();  
      }
  );

  $("#addBtn").on("click", list_by_eventno_add_view); // 더보기 버튼 이벤트 등록
});

//  댓글 등록 처리
function reply_create() {
  $('#modal_panel_close').focus();    // 모달 창 닫기
  
  var frm_reply = $('#frm_reply');
  var params = frm_reply.serialize();
  // alert('checkId() 호출됨: ' + params);
  // return;
  
/*   if ($('#memberno', frm_reply).val().length == 0) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
    $('#modal_panel').modal();            // 다이얼로그 출력
    return;  // 실행 종료
  } */
  
  // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
  // alert('내용 길이: ' + $('#content', frm_reply).val().length);
  // return;
  if ($('#content', frm_reply).val().length > 300) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
    $('#modal_panel').modal();           // 다이얼로그 출력
    return;  // 실행 종료
  }
  
  $.ajax({
    url: "../reply/create.do", // action 대상 주소
    type: "post",          // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = ""; // 메시지 출력
      var tag = ""; // 글목록 생성 태그
      
      if (rdata.count > 0) {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "댓글을 등록했습니다.";
        $('#content', frm_reply).val('');
        $('#passwd', frm_reply).val('');
        
        // 하나의 글만 있으므로 배열에서 첫번째 요소만 추출
        var row = rdata.replyMemberVO[0]; // 하나의 글만 있음.
        // alert(row);
        tag += "<DIV id='"+row.replyno+"'style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
        tag += "<span style='font-weight: bold;'>" + row.id + "</span>";
        tag += "  " + row.rdate;
        //if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
          tag += " <A href='javascript:reply_delete("+row.replyno+")'><IMG src='./images/delete.png'></A>";
        //}
        tag += "  " + "<br>";
        tag += row.content;
        tag += "</DIV>";
        // alert(msg);
        $('#reply_list').prepend(tag); //reply_list 가장 앞부분에 추가
        
      } else {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "댓글 등록에 실패했습니다.";
      }
      
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html(msg);     // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); // Chrome에 출력
    }
  });
}

// eventno 별 소속된 댓글 목록 + 더보기 버튼
function list_by_eventno_add_view() {
  var replyPage = parseInt($("#reply_list").attr("data-replyPage")); // 현재 페이지 
  var params = 'eventno=' + ${eventVO.eventno } + "&replyPage="+replyPage;

  $.ajax({
    url: "../reply/list_by_eventno_join_add_view.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      $("#reply_list").attr("data-replyPage", replyPage+1);  // 개발자정의 속성 쓰기
      // alert(rdata);
      var msg = '';
      
      // $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
      
      for (i=0; i < rdata.list.length; i++) {
        var row = rdata.list[i];
        
        msg += "<DIV id="+row.replyno+" style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
        msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
        msg += "  " + row.rdate;
       // if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
          msg += " <A href='javascript:reply_delete("+row.replyno+")'><IMG src='./images/delete.png'></A>";
        //}
        msg += "  " + "<br>";
        msg += row.content;
        msg += "</DIV>";
      }
      // alert(msg);
      $('#reply_list').append(msg);
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });
  
}
// 댓글 삭제 레이어 출력
function reply_delete(replyno) {
   alert('replyno: ' + replyno);
  var frm_reply_delete = $('#frm_reply_delete');
  $('#replyno', frm_reply_delete).val(replyno); // 삭제할 댓글 번호 저장
  $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
}

// 댓글 삭제 처리
function reply_delete_proc(replyno) {
  // alert('replyno: ' + replyno);
  var params = $('#frm_reply_delete').serialize();
  $.ajax({
    url: "../reply/delete.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.count ==1) { // 패스워드 일치
        if (rdata.delete_count == 1) { // 삭제 성공

          $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
          
          $('#' + replyno).remove(); // 태그 삭제
            
          return; // 함수 실행 종료
        } else {  // 삭제 실패
          msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
          msg += " 다시한번 시도해주세요."
        }
      } else { // 패스워드 일치하지 않음.
        // alert('패스워드 불일치');
        // return;
        
        msg = "패스워드가 일치하지 않습니다.";
        $('#modal_panel_delete_msg').html(msg);

        $('#passwd', '#frm_reply_delete').focus();
        
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
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
          <button type="button" id='modal_panel_close' class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <!-- 댓글 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_reply_delete' id='frm_reply_delete'>
            <input type='hidden' name='replyno' id='replyno' value=''>
            
            <label>패스워드</label>
            <input type='password' name='passwd' id='passwd' class='form-control'>
            <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
          </form>
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-danger' 
                       onclick="reply_delete_proc(frm_reply_delete.replyno.value); frm_reply_delete.passwd.value='';">삭제</button>

          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_reply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 댓글 삭제폼 종료 -->  
  <div class=material>
    <c:set var="eventno" value="${eventVO.eventno }" />
    <DIV class='title_line'>
      <span class="title"> 이 벤 트 </span>

    </DIV>
    <div class='menu_line'></div>

    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="eventno" value="${eventno}"> <input
        type='hidden' name='event_recom' id='event_recom' value='0'>
      <ul>
        <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
          <span class="content_title">${eventVO.event_title}</span>
          <ASIDE
            style='float: right; font-size: 12px; margin-bottom: 0px;'>


            <A href="javascript:location.reload();" class="bluelink">새로고침</A>
            <span class='menu_divide'> | </span> <A
              href='./list_paging.do' class="bluelink">목록</A> <span
              class='menu_divide'> | </span> <A
              href='./update.do?eventno=${eventno }' class="bluelink">수정</A>

            <span class='menu_divide'> | </span> <A
              href='./delete.do?eventno=${eventno }' class="bluelink">삭제</A>
            <!-- 이미지 등록! -->
            <c:choose>
              <c:when test="${eventVO.event_img.trim().length() > 0 }">
                <span class='menu_divide'> | </span>
                <A href='./jpg_delete.do?eventno=${eventno}'>이미지 삭제</A>
              </c:when>
              <c:otherwise>
                <span class='menu_divide'> | </span>
                <A href='./jpg_create.do?eventno=${eventno}'>이미지 등록</A>
              </c:otherwise>
            </c:choose>
          </ASIDE> <span>${eventVO.event_rdate.substring(0, 16)}</span>
        </li>


        <div class="read">
          <c:set var="event_img"
            value="${eventVO.event_img.toLowerCase() }" />
          ${eventVO.event_content }
          <c:choose>
            <c:when
              test="${event_img.endsWith('jpg') || event_img.endsWith('png') || event_img.endsWith('gif')}">
              <IMG src="./storage/imgstorage/${eventVO.event_img }"
                style="width: 80%">
            </c:when>
            <c:otherwise>
              <!-- 이미지가 아닌 일반 파일 -->
                  ${eventVO.event_img}
                </c:otherwise>
          </c:choose>

        </div>



    </FORM>
  </div>

 <!-- 댓글 영역 시작 -->
  <DIV style='width: 80%; margin: 0px auto;'>
      <HR>
      <FORM name='frm_reply' id='frm_reply'> <%-- 댓글 등록 폼 --%>
          <input type='hidden' name='eventno' id='eventno' value='${eventno}'>
          <input type='hidden' name='memno' id='memno' value='1'>
          
          <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글을 입력하세요"></textarea>
          <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
          <button type='button' id='btn_create'>등록</button>
      </FORM>
      <HR>
      <DIV id='reply_list' data-replyPage='1'>  <%-- 댓글 목록 --%>
      
      </DIV>
      <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
          <button id='addBtn' style='width: 100%;'>더보기 ▽</button>
      </DIV>  
    
  </DIV>
  
  <!-- 댓글 영역 종료 -->



  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
