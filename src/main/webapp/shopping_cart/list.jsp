<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- https://m.blog.naver.com/woo_jae_ho/220590136014 --%>

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
  
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
  <script src="${root }/javascript/script.js"></script>
  
  
  <style type="text/css">
    .table_sty {
      border-collapse: collapse;   
      border-top: 3px solid gray;
      border-bottom: 1px solid gray;
    }
    .table_sty tr{
      /* border-top: 1px solid gray; */
      border-bottom: 1px solid gray;
    }
    .table_sty th{
      /* border: 1px solid gray; */
    }
    .table_sty td{
      /* border: 1px solid gray; */
    }
  </style>
</head>

<body onload="showImage()">
<!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
<!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
<jsp:include page="/menu/top.jsp" flush='false' />

  <!--컨텐츠 들어가는 부분: 여기에 각자 작업해서 업로드 하면 될듯-->
  <!-- 리스트 페이지 시작 -->
  <div style="margin: 20px auto; width: 80%;">
    로그인 시에만 접근 허용**
    
    <div>
      <h2 style="display: inline;">장바구니</h2>
      <span style="float: right;"><strong style="background-color: #ffffff;">1. 장바구니</strong> ＞ 2. 주문/결제 ＞ 3. 주문 완료</span>
    </div>
    
    <!-- 정렬 -->
<!--     <div style="margin: 20px auto;">
      <a href="#">최신순</a> | 
      <a href="#">오래된 순</a>
    </div> -->
    <!-- 정렬 종료 -->
    
    <!-- 리스트 테이블 시작 -->
    <div style="margin-top: 10px;">
      <!-- <form action="../porder/create.jsp" method="get"> -->
        <table class='table_sty' style='width: 100%; outline: 1px solid gray;'>
            <colgroup>
              <col style="width: 5%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 15%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 10%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <!-- 장바구니no, 회원no, 상품no, 상품 그룹no, 상품 그룹 이름 -->
                <th style='text-align: center;'>선택</th>
                <th style='text-align: center;'>상품 이미지</th>
                <th style='text-align: center;'>상품이름</th>
                <th style='text-align: center;'>가격</th>
                <th style='text-align: center;'>수량</th>
                <th style='text-align: center;'>배송비</th>
                <th style='text-align: center;'>배송일정</th>
                <th style='text-align: center;'>기타</th>
              </tr>
            
            </thead>
            
            <%-- table 내용 --%>
            <tbody>
              <%
                // 상품 이름
                /* String[] item_name={"화려한 조명이 나를 감싸네 썬블록",
                                                   "시간이 멈추길 기도해 썬크림",
                                                   "불 꺼진 무대 위 홀로 남아서 자외선 차단제",
                                                   "떠나간 그대의 목소릴 떠올리네 썬블록",
                                                   "나 쓰러질 때까지 널 위해 춤을 줘 썬크림"
                                                  };
                request.setAttribute("item_name", item_name); */
                
                // 상품 정가
               /*  int[] item_price={100, 200, 300, 400, 500};
                request.setAttribute("item_price", item_price); */
                
                // 상품 할인률
                /* int[] discount_rate={10, 20, 30, 40, 50};
                request.setAttribute("discount_rate", discount_rate); */
              %>
              <c:if test="${list=='[]'}">
                <tr><td colspan=8 style="text-align: center; height: 100px;">장바구니에 담은 상품이 없습니다.<br><button type='button'>쇼핑하러 가기</button></td></tr>
              </c:if> 
              <c:forEach var="Shop_item_grpVO" items="${list }" varStatus="sample">
                <c:set var="name" value="${Shop_item_grpVO.name }" />
                <c:set var="item_name" value="${Shop_item_grpVO.item_name }" />
                <c:set var="item_price" value="${Shop_item_grpVO.item_price }" />
                <c:set var="discount_rate" value="${Shop_item_grpVO.discount_rate }" />
                <c:set var="item_type" value="${Shop_item_grpVO.item_type }" />
                <c:set var="item_origin" value="${Shop_item_grpVO.item_origin }" />
                <c:set var="thumb" value="${Shop_item_grpVO.thumb }" />
                
                <c:set var="shopping_cartno" value="${Shop_item_grpVO.shopping_cartno }" />
                <c:set var="memno" value="${Shop_item_grpVO.memno }" />
                <c:set var="itemno" value="${Shop_item_grpVO.itemno }" />
                <c:set var="quantity" value="${Shop_item_grpVO.quantity }" />
                
                <tr data-discount="<fmt:formatNumber value="${item_price*(discount_rate)/100 }" type="number"/>" data-delivery="2500">
                  <td class="select_check" style='text-align: center; vertical-align: middle;'><input type="checkbox" class="check_item" name="shopping_cartno" value="${shopping_cartno }"></td>
                  <td style='text-align: center;'>
                    <img src='./${thumb}' style="width: 100px; height: 100px;" alt='상품 이미지'>
                  </td>
                  <td style='text-align: center; vertical-align: middle;'><a href="#">[${name }, ${item_type }] ${item_name}(#${itemno})</a></td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <s><span id="itp-${shopping_cartno }"><fmt:formatNumber value="${item_price }" type="number"/></span>원</s>
                    (
                    <fmt:formatNumber value="${item_price*(100-discount_rate)/100 }" type="number"/>원
                    )
                  </td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <button type="button" class="btn_quantitydown" value="${shopping_cartno }" style="width: 25px;"><strong>-</strong></button>
                    <input type='text' id="qt-${shopping_cartno }" value='${quantity }' readonly="readonly" style="width: 40px; text-align: right;">
                    <button type="button" class="btn_quantityup" value="${shopping_cartno }" style="width: 25px;"><strong>+</strong></button>
                  </td>
                  <td style='text-align: center; vertical-align: middle;'>2,500</td>
                  <td style='text-align: center; vertical-align: middle;'>오늘 출고</td>
                  <td style='text-align: center; vertical-align: middle;'>
                    <form action="../porder/payment.do" method="post">
                      <input type="hidden" name="shopping_cartno" value="${shopping_cartno }">
                      <input type="hidden" name="item_price_sum" value="${item_price*quantity }">
                      <fmt:parseNumber var= "ids" integerOnly= "true" value= "${item_price*(discount_rate)/100*quantity }"/>
                      <input type="hidden" name="item_discount_sum" value="${ids }">
                      <input type="hidden" name="coupon_discount_sum" value="-2500">
                      <input type="hidden" name="delivery_fee" value="2500">
                      <fmt:parseNumber var= "pp" integerOnly= "true" value= "${item_price*(100-discount_rate)/100*quantity }"/>
                      <input type="hidden" name="payment_price" value='${pp}'>
                      <button type="submit" style="width: 80px;">바로 구매</button>
                    </form>
                    <button type="button" style="width: 80px;" onclick="location.href='./delete.do?shopping_cartno=${shopping_cartno}'">삭제</button>
                  </td>
                </tr>
              </c:forEach>
              
            </tbody>
          </table>
      <!-- </form> -->
    </div>
    <!-- 리스트 테이블 종료 -->
    
    <div style="margin: 0 0 20px 10px;">
      <label><input type="checkbox" id="input_checkAll">전체 선택</label>
      <button type="button" onclick="delete_selected();">삭제</button>
    </div>
    
    <!-- 금액 합계 시작 -->
    <h3 style="margin: 10px 0;"><u>결제 예상 금액</u></h3>
    <div style="outline: 1px solid grey; margin: 10px auto;">
      <table class='table_sty' style="width: 100%;">
        <colgroup>
          <col style="width: 20%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 20%;"></col>
        </colgroup>
        <thead>
          <tr>
            <th style='text-align: center;'>판매가총액(<span id="type_sum"></span>종/<span id="ea_sum"></span>개)</th>
            <th style='text-align: center;'>할인총액</th>
            <th style='text-align: center;'>배송비</th>
            <th style='text-align: center;'>결제 예정금액</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td style='text-align: center;'><span id="item_price_sum"></span>원</td>
            <td style='text-align: center;'>-<span id="item_discount_sum"></span>원</td>
            <td style='text-align: center;'><span id="delivery_fee">2,500</span>원</td>
            <td style='text-align: center;'><span id="payment_price"></span>원</td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- 금액 합계 종료 -->
    
    <div style="text-align: right;">
      <button type="button" onclick="location.href='../';">쇼핑하기</button>
      <button type="button" id="btn_porder">구매하기</button>
    </div>
  </div>
  <!-- 리스트 페이지 종료 -->
  <!--컨텐츠 들어가는 부분: 여기에 각자 작업해서 여기까지-->
  <div id="test"></div>

 <jsp:include page="/menu/bottom.jsp" flush='false' />
 
 <script type="text/javascript">
    $(function(){
      $("#input_checkAll").on("click", checkAll);
      $(".check_item").change(isCheckAll);
      $("#btn_porder").on("click", porder);
      $(".btn_quantitydown").on("click", quantitydown);
      $(".btn_quantityup").on("click", quantityup);
      // $("td.select_check").on("click", select_check);
      price_summary();
    });
    
    // 전체 선택하기
    function checkAll(){
      //alert("전체 선택");
      if($("#input_checkAll").prop("checked"))
        $(".check_item").prop("checked", true);
      else
        $(".check_item").prop("checked", false);
      
      price_summary();
    }
    
    // 체크 박스 전체 선택되었는지 확인
    function isCheckAll(){
      if($(".check_item:checked").length == $(".check_item").length)
        $("#input_checkAll").prop("checked", true);
      else
        $("#input_checkAll").prop("checked", false);
      
      // 합계 업데이트
      price_summary();
    }
    
    function porder(){
      if($("input:checkbox[name=shopping_cartno]:checked").length == 0){
        //https://sweetalert.js.org/
        alert("상품을 1개 이상 선택해주세요.");
        return
      }
      
      //var str="";
      var form = document.createElement("form");
      form.action="../porder/payment.do";
      form.method="get";
      //자식 추가
      $("body").append(form);
      
      var input;
      // 해당 조건에 맞는 태그를 각각 function 수행, for문을 사용x
      $("input:checkbox[name=shopping_cartno]:checked").each(function(){
        //str += $(this).val() + "\n"; // value 가져오기
        create_hidden("shopping_cartno", $(this).val(), form);
      });
      
      // 상품 테이블이 없어서 사용함 -> 삭제할 것
/*       create_hidden("item_price_sum", $("#item_price_sum").html(), form);
      create_hidden("item_discount_sum", $("#item_discount_sum").html(), form);
      create_hidden("coupon_discount_sum", $("#coupon_discount_sum").html(), form);
      create_hidden("delivery_fee", $("#delivery_fee").html(), form);
      create_hidden("payment_price", $("#payment_price").html(), form); */

      form.submit();
    }
    
    function create_hidden(name, val, form){
      input = document.createElement("input");
      input.type = "hidden";
      input.name = name;
      input.value = parseInt(val.replace(/,/, ''));
      form.append(input);
    }
    
    function quantitydown(){
      // 숫자 확인: 0이하 체크
      //alert($(this).val()); //shopping_cartno
      var shopping_cartno = $(this).val();
      
      /* 
      https://www.codingfactory.net/10290
      */
      
      // prop는 제이쿼리 메소드
      // alert($(this).prop('tagName')); // button
      // parent()도 제이쿼리 메소드
      // alert($(this).parent().prop('tagName')); // td
      // alert($(this).parent().children('input').val()); //input value값, quantity
      if($(this).parent().children('input').val() < 2){
        alert("최소 구매 개수는 1개입니다.");
        return;
      }
      // ajax 사용, post, /quantitydown.do
      // ajax로 바꾸기
      ajax_get("quantity_down", shopping_cartno);
      //location.href="./quantity_down.do?shopping_cartno="+shopping_cartno;
      
      //합계 업데이트
      // price_summary();
    }
    
    function quantityup(){
      //
      //alert($(this).val());//shopping_cartno
      var shopping_cartno = $(this).val();
      
      //ajax로 바꾸기
      ajax_get("quantity_up", shopping_cartno);
      // location.href="./quantity_up.do?shopping_cartno="+shopping_cartno;
      
      //합계 업데이트
      // price_summary();
    }
    
    function ajax_get(url, shopping_cartno){
      // url: ./quantity_up.do ./quantity_down.do
      
      var frm = document.createElement("form");
      $("body").append(frm);
      // 키와 값
      var params = 'shopping_cartno=' + shopping_cartno; // shopping_cartno
      // alert('params: ' + params);
      // return;
      
      $.ajax({
        url: './'+url+'.do',
        type: 'get', // 가져올 땐 get 많이 사용
        cache: false, // 응답받은 결과를 브라우저 임시 메모리에 저장하지 않음
        async: true, // true: 비동기 통신
        dataType: 'json', // 응답 형식: json > html >> xml ... 
        data: params, // 보내는 데이터
        success: function(rdata){ // 응답이 온 경우
          var msg = "";
          
          if (rdata.cnt > 0) {
            // $('#modal_content').attr('class', 'alert alert-danger'); // 부트스트랩 CSS 클래스속성 변경
            // msg = "이미 사용중인 ID 입니다.";
            //alert("수량 업데이트 성공");
            $('#qt-'+shopping_cartno).val(rdata.quantity);
            
            price_summary();
          } else {
            // $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
            // msg = "사용 가능한 ID 입니다.";
            // $.cookie('checkId', 'TRUE'); // jquery Cookie 기록
          }
         
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우에만 작동, 통신에러(?), dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
      });
    }
    
    function price_summary(){
      // 체크 가격 가져오기
      
      //var str="";
      var type_sum = 0;
      var ea_sum = 0;
      var item_price_sum = 0;
      var item_discount_sum = 0;
      $("input:checkbox[name=shopping_cartno]:checked").each(function(){
        //str += $(this).parent().parent().data("price") + "\n"; // data 속성 값 가져오기
        type_sum += 1;
        var ea = parseInt( $('#qt-'+$(this).val()).val() )
        ea_sum += ea;
        item_price_sum += parseInt( $('#itp-'+$(this).val()).html().replace(/,/g, '') ) * ea;
        var tr = $(this).parent().parent(); // tr
        item_discount_sum += parseInt(tr.data("discount").replace(/,/g, ''))*ea;
      });
      // alert(sum);
      $("#type_sum").html(type_sum);
      $("#ea_sum").html(ea_sum);
      $("#item_price_sum").html(String(item_price_sum).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
      $("#item_discount_sum").html(String(item_discount_sum).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
      $("#payment_price").html(String(item_price_sum-item_discount_sum+2500).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
    
    function delete_selected(){
      if($("input:checkbox[name=shopping_cartno]:checked").length == 0){
        //https://sweetalert.js.org/
        alert("상품을 1개 이상 선택해주세요.");
        return
      }
      
      //var str="";
      var form = document.createElement("form");
      form.action="./delete.do";
      form.method="get";
      //자식 추가
      $("body").append(form);
      
      var input;
      // 해당 조건에 맞는 태그를 각각 function 수행, for문을 사용x
      $("input:checkbox[name=shopping_cartno]:checked").each(function(){
        //str += $(this).val() + "\n"; // value 가져오기
        create_hidden("shopping_cartno", $(this).val(), form);
      });

      form.submit();
    }
    
/*     function select_check(){
      var input = $(this).children();
      if(input.prop("checked"))
        input.prop("checked", false);
      else
        input.prop("checked", true);
      
      price_summary();
    } */
    
  </script>
</body>
</html>