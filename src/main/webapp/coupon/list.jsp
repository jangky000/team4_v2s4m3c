<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>♥SKINFIT♥</title>
  
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${root }/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="${root }/javascript/script.js"></script>
  
  <style type="text/css">
    body{
      background-color: #D7DCE0;
    }
  
    .bordered {
        *border-collapse: collapse; /* IE7 and lower */
        border-spacing: 0;
        width: 100%;
        border: solid #ccc 1px;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
        -webkit-box-shadow: 0 1px 1px #ccc;
        -moz-box-shadow: 0 1px 1px #ccc;
        box-shadow: 0 1px 1px #ccc;
    }
     
    .bordered tr:hover {
        background: #fbf8e9;
        -o-transition: all 0.1s ease-in-out;
        -webkit-transition: all 0.1s ease-in-out;
        -moz-transition: all 0.1s ease-in-out;
        -ms-transition: all 0.1s ease-in-out;
        transition: all 0.1s ease-in-out;
    }
     
    .bordered td, .bordered th {
        border-left: 1px solid #ccc;
        border-top: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }
     
    .bordered th {
        background-color: #dce9f9;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
        background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
        -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
        -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;
        box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
        border-top: none;
        text-shadow: 0 1px 0 rgba(255,255,255,.5);
    }
     
    .bordered td:first-child, .bordered th:first-child {
        border-left: none;
    }
     
    .bordered th:first-child {
        -moz-border-radius: 6px 0 0 0;
        -webkit-border-radius: 6px 0 0 0;
        border-radius: 6px 0 0 0;
    }
     
    .bordered th:last-child {
        -moz-border-radius: 0 6px 0 0;
        -webkit-border-radius: 0 6px 0 0;
        border-radius: 0 6px 0 0;
    }
     
    .bordered th:only-child{
        -moz-border-radius: 6px 6px 0 0;
        -webkit-border-radius: 6px 6px 0 0;
        border-radius: 6px 6px 0 0;
    }
     
    .bordered tr:last-child td:first-child {
        -moz-border-radius: 0 0 0 6px;
        -webkit-border-radius: 0 0 0 6px;
        border-radius: 0 0 0 6px;
    }
     
    .bordered tr:last-child td:last-child {
        -moz-border-radius: 0 0 6px 0;
        -webkit-border-radius: 0 0 6px 0;
        border-radius: 0 0 6px 0;
    }
    
    /* to make a circle around the question mark */
    div.tip{
        background-color: #BCDBEA;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        font-size: 14px;
        line-height: 26px;
        cursor: default;
        text-align: center;
        display: inline-block;
        margin-left: 5px;
    }
    
    tbody.new_tr tr:nth-child(1){
      -webkit-animation:blink 1.5s ease-in-out;
      -moz-animation:blink 1.5s ease-in-out;
      animation:blink 1.5s ease-in-out;
    }
    @-webkit-keyframes blink{
        0% {background-color: #fbf8e9;}
        100% {}
    }
    @-moz-keyframes blink{
        0% { background-color: #fbf8e9;}
        100% {}
    }
    @keyframes blink{
        0% {background-color: #fbf8e9;}
        100% {}
    }
    
  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 이벤트 추가 모달 시작 -->
  <div id="event-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <a class="close" data-dismiss="modal">×</a>
          <h3>이벤트 쿠폰 추가</h3>
        </div>
        <form id="couponCreateForm" name="couponCreateForm" role="form" action="./create.do" method='post' enctype="multipart/form-data">
          <div class="modal-body">
            *: 필수 입력 <br><br>
            <div class="form-group">
              <label for="cpname">쿠폰 이름*</label>
              <input type="text" id="cpname" name="cpname" class="form-control" required="required">
            </div>
            <div class="form-group">
              <label for="cpimg">쿠폰 이미지</label>
              <input type="file" id="cpimgMF" name="cpimgMF" class="form-control">
            </div>
            <div class="form-group">
              <label for="cpdiscount">쿠폰 할인금액*</label>
              <input type="number" id="cpdiscount" name="cpdiscount" class="form-control" required="required">
            </div>
            <div class="form-group">
              <label for="cpstock">쿠폰 재고*<div class='tip' data-content="고객에게 배포할 쿠폰의 총 수">?</div></label>
              <input type="number" id="cpstock" name="cpstock" class="form-control" required="required">
            </div>
            <div class="form-group">
              <label for="cpcate">사용 가능 카테고리<div class='tip' data-content="공백으로 등록시 모든 품목에 대해 적용">?</div></label>
              <input type="text" id="cpcate" name="cpcate" class="form-control">
            </div>      
          </div>
          <div class="modal-footer">          
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            <!-- <input type="submit" class="btn btn-success" id="submit" value='등록'> -->
            <button type='button' class="btn btn-success" id="coupon_create">등록</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- 이벤트 추가 모달 종료 -->
  
  <!-- 이벤트 쿠폰 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      * 관리자만 접근<br>
      <h2 style="display: inline;">이벤트쿠폰</h2>
      <span style="float: right;">관리자 ＞ <strong style="background-color: #ffffff;">쿠폰 목록 관리</strong></span>
    </div>
    
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 이벤트쿠폰 정보 시작 -->
    <div style="margin: 20px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray">
        <h3 style='display: inline-block;'>이벤트쿠폰 목록</h3>
        <!--  class="btn btn-info btn" -->
        <span style="float:right; margin: 20px 0 0 0;"><button type="button" class='btn btn-default' data-toggle="modal" data-target="#event-modal">이벤트쿠폰 추가하기</button></span>
      </div>
      <div style="margin: 20px auto; width: 95%;"><a style="margin:10px;">현재진행중</a><a style="margin:10px;">진행완료</a></div>
      <div style="margin: 20px auto; width: 95%;">
        <table class="bordered" style='width: 100%;'>
          <!-- table 이름 -->
          <thead>
            <tr>
              <th style='text-align: center;'>쿠폰no</th>
              <th style='text-align: center;'>쿠폰이미지</th>
              <th style='text-align: center;'>쿠폰이름</th>
              <th style='text-align: center;'>쿠폰할인금액</th>
              <th style='text-align: center;'>쿠폰재고</th>
              <th style='text-align: center;'>사용가능카테고리</th>
              <th></th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody ${param.cnt == 1 ? "class='new_tr'" : "" }>
            <c:forEach var="couponVO" items="${list }">
              <c:set var="couponno" value="${couponVO.couponno }" />
              <c:set var="cpimg" value="${couponVO.cpimg }" />
              <c:set var="cpupimg" value="${couponVO.cpupimg }" />
              <c:set var="cpthumb" value="${couponVO.cpthumb }" />
              <c:set var="cpname" value="${couponVO.cpname }" />
              <c:set var="cpdiscount" value="${couponVO.cpdiscount }" />
              <c:set var="cpstock" value="${couponVO.cpstock }" />
              <c:set var="cpcate" value="${couponVO.cpcate }" />
              
              <tr> 
                <td style='text-align: center;'>${couponno}</td>
                <td style='text-align: center;'><img src='./storage/${cpthumb}' style="width: 120px; height:80px;">${cpimg}</td>
                <td style='text-align: center;'>${cpname} </td>
                <td style='text-align: center;'>${cpdiscount} </td>
                <td style='text-align: center;'>${cpstock} </td>
                <td style='text-align: center;'>${cpcate} </td>
                <td style='text-align: center;'>
                  <button type="button" class='btn btn-default' onclick="location.href='#' ">수정</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      
      <!-- 페이징 시작-->
      <DIV class='bottom_menu'>${paging }</DIV>
      <br><br>
      <!-- 페이징 종료 -->
      
    </div>
    <!-- 이벤트쿠폰 정보 종료 -->
  </div>
  <!-- 이벤트쿠폰 리스트 종료 -->
  
  
   
   <div><!-- 레이어 깨지는 문제때문에 넣어 놓음 -->
   <jsp:include page="/menu/bottom.jsp" flush='false' />
   <script type="text/javascript">
    $(function(){
      $('#coupon_create').on('click', couponCreateFunc);
      
      $('div.tip').popover({
        trigger: 'hover',
        'placement': 'auto'
       });
      
    });
    
    function couponCreateFunc(){
      /* alert($('#cpimgMF', frm)[0].files[0].name);
      return; */
      
      var frm = $('#couponCreateForm'); 
      frm.submit();
      /* var params = {
                          'cpname':$('#cpname', frm).val(), 
                          'cpimgMF':$('#cpimgMF', frm)[0].files[0].name,
                          'cpdiscount':$('#cpdiscount', frm).val(),
                          'cpstock':$('#cpstock', frm).val(),
                          'cpcate':$('#cpcate', frm).val(),
                         };
      $('#event-modal').modal('hide');
      
      $.ajax({
        url: './create.do',
        type: 'post',
        cache: false, // 응답 결과 임시 저장 취소
        async: false,  // false: 동기 통신 -> 주문이 중복으로 들어가는 것을 방지, 절차적으로 처리
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          //alert(rdata.cnt);
          if(rdata.cnt == 1){
            alert("쿠폰 등록 완료");
            location.reload(true); // 새로고침
          } else{
            alert("쿠폰 등록 실패");
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
      }); */
      
    }
   </script>
</body>
</html>