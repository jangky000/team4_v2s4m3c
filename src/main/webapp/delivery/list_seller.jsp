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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="${root }/javascript/script.js"></script>
  
  <style type="text/css">
    table {
      border-collapse: collapse;
    }
    table div{
     
    }
    table thead tr{
     border: none;
    }
    table tbody tr{
     border: 1px solid white;
    }
    table tbody tr:nth-child(3n+1){
     border-left: 1px solid gray;
     border-right: 1px solid gray;
    }
    table tbody tr:nth-child(3n+2){
     border-left: 1px solid gray;
     border-right: 1px solid gray;
    }
    table tbody tr:nth-child(3n){
     border-left: 1px solid gray;
     border-right: 1px solid gray;
     border-bottom: 1px solid gray;
    }
    table th{
      font-size: 14px;
      border-bottom: 2px solid gray;
      background-color: #ffffff;
    }
    table td{
      font-size: 16px;
    }
    table td.td-th{
      font-weight: bold;
      text-align: center;
      border-right: none; 
    }

  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문/배송관리 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      <h2 style="display: inline;">주문/배송관리</h2>
      <span style="float: right;">판매자 ＞ <strong style="background-color: #ffffff;">주문/배송관리</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>

<!-- 출고중지요청, 출고지연, 배송지연, 장기미배송
결제완료, 상품준비중, 배송지시, 배송중, 배송완료 -->

    <div>
      <div style="width:20%; height:160px;  display: inline-block; border: 1px solid gray;">
        <div style="float: left;">
          <ul style="list-style: none; margin: 0; padding: 5px 0 0 10px;">
            <li style="height: 40px;">출고중지요청</li>
            <li style="height: 40px;">출고지연</li>
            <li style="height: 40px;">배송지연</li>
            <li style="height: 40px;">장기미배송</li>
          </ul>
        </div>
        <div style="float: right;">
          <ul style="list-style: none; margin: 0; padding: 5px 10px 0 0;">
            <li style="height: 40px;">0건</li>
            <li style="height: 40px;">0건</li>
            <li style="height: 40px;">0건</li>
            <li style="height: 40px;">0건</li>
          </ul>
        </div>
      </div>
      <div style="width:75%; margin:0 0 0 3%; height:160px; display: inline-block;">
        <div style="width:100%; display: table; text-align:center;">
          <div style="width:20%; height:160px; display: table-cell; vertical-align: middle; border: 1px solid gray;">결제완료<br>0건</div>
          <div style="width:20%; height:160px; display: table-cell; vertical-align: middle; border: 1px solid gray;">상품준비중<br>0건</div>
          <div style="width:20%; height:160px; display: table-cell; vertical-align: middle; border: 1px solid gray;">배송지시<br>0건</div>
          <div style="width:20%; height:160px; display: table-cell; vertical-align: middle; border: 1px solid gray;">배송중<br>0건</div>
          <div style="width:20%; height:160px; display: table-cell; vertical-align: middle; border: 1px solid gray;">배송완료<br>0건</div>
        </div>
      </div>
    </div>
    
    <!-- 배송 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray"><h3>배송등록</h3></div>
      <div style="margin: 20px auto; width: 95%;">
        <table style='width: 100%;'>
          <colgroup>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 5%;"></col>
              <col style="width: 15%;"></col>
              <col style="width: 5%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 5%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 5%;"></col>
            </colgroup>
          <!-- table 이름 -->
          <thead>
            <tr>
              <th style='text-align: center;'>주문번호</th>
              <th style='text-align: center;'>주문<br>상세번호</th>
              <th style='text-align: center;'>결제일</th>
              <th style='text-align: center;'>재고</th>
              <th style='text-align: center;'>운송장번호<br>등록일시</th>
              <th style='text-align: center;'>수취인</th>
              <th style='text-align: center;'>연락처</th>
              <th style='text-align: center;'>배송상태</th>
              <th style='text-align: center;'>배송상태<br>최종 처리일</th>
              <th style='text-align: center;'>주문<br>취소/반품</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
<!--             <tr style="text-align: center;">
              <td>1</td>
              <td>1</td>
              <td>2020-06-16</td>
              <td>100</td>
              <td><input type="number" placeholder="운송장번호" style="width: 100px;"><button>등록</button></td>
              <td>왕눈이</td>
              <td>010-1234-1234</td>
              <td>준비중</td>
              <td></td>
              <td><button>반품</button></td>
            </tr>
            <tr>
              <th>상품명(수량)</th>
              <td colspan="9"> OO 썬크림 200ml (10개)</td>
            </tr>
            <tr>
              <th>배송지</th>
              <td colspan="9">서울특별시 강남구</td>
            </tr> -->
            <c:forEach var="porder_detailVO" items="${list }">
              <c:set var="porder_detailno" value="${porder_detailVO.porder_detailno }" />
              <c:set var="porderno" value="${porder_detailVO.porderno }" />
              <c:set var="itemno" value="${porder_detailVO.itemno }" />
              <c:set var="quantity" value="${porder_detailVO.quantity }" />
              <c:set var="item_price_sum" value="${porder_detailVO.item_price_sum }" />
              <c:set var="item_discount_sum" value="${porder_detailVO.item_discount_sum }" />
              <c:set var="payment_price" value="${porder_detailVO.payment_price }" />
              <c:set var="porder_detail_status" value="${porder_detailVO.porder_detail_status }" />
              <c:set var="trackingno" value="${porder_detailVO.trackingno }" />

              <tr style="text-align: center;">
                <td>${porderno }</td>
                <td>${porder_detailno }</td>
                <td>2020-06-16</td>
                <td>100</td>
                <td>
                  <span id="trackinginfo-${porder_detailno }">
                    <c:choose>
                      <c:when test="${trackingno==null or trackingno==-1 }">
                        <%-- <input type="text" name='trackingno' value='' placeholder="운송장번호" style="width: 100px;"><button type="button" class='btn_trackingno' name='${porder_detailno }'>등록</button> --%>
                        <div class="trackingno_input" style="display: block;"><input type="text" name='trackingno'  placeholder="운송장번호" style="width: 100px;"><button type="button" class='btn_trackingno' name='${porder_detailno }'>등록</button></div>
                        <div class="trackingno_view" style="display: none;"><span>${trackingno }</span><button type="button" class='btn_change_trackingno' name='${porder_detailno }'>변경</button><button type="button" class='btn_delete_trackingno' name='${porder_detailno }'>삭제</button></div>
                      </c:when>
                      <c:otherwise>
                        <div class="trackingno_input" style="display: none;"><input type="text" name='trackingno' placeholder="운송장번호" style="width: 100px;"><button type="button" class='btn_trackingno' name='${porder_detailno }'>등록</button><button type="button" class='btn_cancel' name='${porder_detailno }'>취소</button></div>
                        <div class="trackingno_view" style="display: block;"><span>${trackingno }</span><button type="button" class='btn_change_trackingno' name='${porder_detailno }'>변경</button><button type="button" class='btn_delete_trackingno' name='${porder_detailno }'>삭제</button></div>
                      </c:otherwise>
                    </c:choose>
                  </span>
                </td>
                <td>왕눈이</td>
                <td>010-1234-1234</td>
                <td>준비중</td>
                <td></td>
                <td><button type="button">반품</button></td>
              </tr>
              <tr>
                <td class='td-th'>상품명(수량)</td>
                <td colspan="9"> 상품번호${porder_detailno } (${quantity }개)</td>
              </tr>
              <tr>
                <td class='td-th'>배송지</td>
                <td colspan="9">서울특별시 강남구</td>
              </tr>

            </c:forEach>
          </tbody>
        </table>
      </div>  
    </div>
    <!-- 배송 정보 종료 -->
    
  </div>
  <!-- 주문/배송관리 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
   <script>
      $(function(){
        $('.btn_trackingno').on('click', {mode:'update'}, update_tackingno);
        $('.btn_change_trackingno').on('click', change_display);
        $('.btn_cancel').on('click', change_display);
        $('.btn_delete_trackingno').on('click', {mode:'delete'}, update_tackingno);
      });
      
      function update_tackingno(event){
        // alert(event.data.mode);
        var porder_detailno = $(this).attr('name');
        var trackingno = "";
        if(event.data.mode == 'update'){
          trackingno = $(this).parent().children('input').val();
          if(trackingno == ''){
            alert('운송장 번호가 입력되지 않았습니다.');
            return;
          }
        } else if(event.data.mode == 'delete'){
          trackingno = -1; // 삭제처리하다가 그만 둠
        }
        
        // alert('porder_detailno: ' + porder_detailno + '\n'+'trackingno: '+trackingno);
        // return;
        
        var params = {"porder_detailno": porder_detailno, "trackingno": trackingno};
        //alert(JSON.stringify(params));
        //return;
        
        // ajax 처리
        $.ajax({
          url: './update_trackingno.do',
          type: 'post',
          //traditional: true, // json 배열 전송??
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // false: 동기 통신 -> 주문이 중복으로 들어가는 것을 방지, 절차적으로 처리
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
            //var msg = "";
            //alert(rdata.result);
            if(rdata.cnt == 1){
              
              if(rdata.trackingno == -1){
                // 삭제 완료 시
                alert("운송장번호 삭제 완료");
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_view').children('span').empty();
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_input').children('input').val('');
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_input').show(); // 펼치기
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_view').hide(); // 숨기기
              } else{
                // 업데이트 완료시
                alert("운송장번호 등록 완료");
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_view').children('span').empty();
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_view').children('span').append(rdata.trackingno);
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_view').show(); // 펼치기
                $('#trackinginfo-'+porder_detailno).children('div.trackingno_input').hide(); // 숨기기
              }
              
            } else{
              alert("운송장번호 등록 실패");         
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
      
      function change_display(){
        if($(this).parent().parent().children('div.trackingno_input').css('display') == 'none'){
          $(this).parent().parent().children('div.trackingno_input').show(); // 펼치기
          $(this).parent().hide(); // 숨기기
        }else{
          $(this).parent().parent().children('div.trackingno_view').show(); // 펼치기
          $(this).parent().hide(); // 숨기기
        }
      }
      
      
   </script>
</body>
</html>