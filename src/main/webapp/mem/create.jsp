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
  <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="${root }/javascript/script.js"></script>

  <style>
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 500px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #b9e1fc;
  width: 120px;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #4aa8d8;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}

select {
  background: #f2f2f2;
  width: 30%;
  border: 0;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

</style>

<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_checkID').on('click', checkID);
    $('#btn_send').on('click', send);   
  });

  // jQuery ajax 요청
  function checkID() {
    var frm = $('#frm');
    var mem_id = $('#mem_id', frm).val();
    var params = '';
    var msg = '';

    if ($.trim(mem_id).length == 0) { // id를 입력받지 않은 경우
      alert('ID를 입력하세요.');

      return false;
    } else {  // when ID is entered
      params = 'mem_id=' + mem_id;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합

      $.ajax({
        url: './checkID.do',
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          
          if (rdata.cnt > 0) {
            alert('이미 사용중인 아이디 입니다.');
          } else {
            alert('사용 가능한 ID 입니다.');

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

  }

  function send() {
	var frm = $('#frm');
	var mem_id = $('#mem_id', frm).val();
	if ($.trim(mem_id).length == 0) { // id를 입력받지 않은 경우
	   alert('ID를 입력하세요.');

	  return false;
	}

	var mem_pw = $('#mem_pw', frm).val();
	if ($.trim(mem_pw).length == 0) { // id를 입력받지 않은 경우
		   alert('비밀번호를 입력하세요.');

		  return false;
		}

	var mem_pw2 = $('#mem_pw2', frm).val();
	if ($.trim(mem_pw2).length == 0) { // id를 입력받지 않은 경우
		   alert('비밀번호를 확인하세요.');

		  return false;
		}
	
	var mem_name = $('#mem_name', frm).val();
	if ($.trim(mem_name).length == 0) { // id를 입력받지 않은 경우
	   alert('이름을 입력하세요.');

	  return false;
	}
	
 	var mem_yy = $('#mem_yy', frm).val();
	var mem_mm = $('#mem_mm', frm).val();
	var mem_dd = $('#mem_dd', frm).val();
	if ($.trim(mem_yy).length == 0)
	 { 
	   alert('생년월일을 정확하게 입력하세요.');

	  return false;
	}
	if ($.trim(mem_mm).length == 0)
	 { 
	   alert('생년월일을 정확하게 입력하세요.');

	  return false; 
	}
	if ($.trim(mem_dd).length == 0)
	 { 
	   alert('생년월일을 정확하게 입력하세요.');

	  return false;
	}
		
	var mem_phone = $('#mem_phone', frm).val();
	if ($.trim(mem_phone).length == 0) {
	   alert('전화번호를 정확하게 입력하세요.');

	  return false;
	}

	var mem_email = $('#mem_email', frm).val();
	if ($.trim(mem_email).length == 0) { // id를 입력받지 않은 경우
	   alert('이메일을 입력하세요.');

	  return false;
	}
    if ($('#mem_pw').val() != $('#mem_pw2').val()) {
      alert('입력된 패스워드가 일치하지 않습니다.');
      
      return false; // submit 중지
    }

    $('#frm').submit();
  }
</script>
</head> 

<body onload="showImage()">
  <jsp:include page="/menu/top.jsp" flush='false' />

  <div class="form" style="margin:20px auto; width:80%; text-align:center">


  <DIV style="font-size:20px;" class='title_line'>
    회원 가입
  </DIV>
  <br>
  
  <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">

    <div>
      <label for="mem_id" style='font-size: 0.9em;'>아이디</label>    
      <div>
        <input type='text' name='mem_id' id='mem_id' value='' required="required"  placeholder="아이디" autofocus="autofocus">
      </div>
    </div>
    <br>
        <button style='width: 80%; 'type='button' id="btn_checkID" class="btn btn-info btn-md"> 아이디 중복확인</button>            
    
    <br><br>
    <div>
      <label for="mem_pw" style='font-size: 0.9em;'>패스워드</label>    
      <div>
        <input type='password' name='mem_pw' id='mem_pw' value='' required="required" placeholder="패스워드">
      </div>
    </div>   

    <div>
      <label for="mem_pw2" style='font-size: 0.9em;'>패스워드 확인</label>    
      <div>
        <input type='password' name='mem_pw2' id='mem_pw2' value='' required="required" placeholder="패스워드 확인">
      </div>
    </div>   
    <br>
    <div>
      <label for="mem_name"style='font-size: 0.9em;'>이름</label>    
      <div>
        <input type='text' name='mem_name' id='mem_name' 
                   value='' required="required" placeholder="이름">
      </div>
    </div>   

    <div>
      <label  style='font-size: 0.9em;'>생년월일</label>    
      <div >
        <input type='number' name='mem_yy' id='mem_yy' min=0 max =99
                   value='' required="required" style='width: 30%;' aria-label="년(2자)" placeholder="년(2자)"> 
        <input type='number' name='mem_mm' id='mem_mm' 
                   value='' required="required" style='width: 30%;' aria-label="월" placeholder="월"> 
        <input type='number' name='mem_dd' id='mem_dd' 
                   value='' required="required" style='width: 30%;' aria-label="일" placeholder="일"> 
      </div>
    </div>  
    <br>
    <div>
      <label for="mem_telecom"style='font-size: 0.9em;'>통신사</label>
      <div>
      <select name='mem_telecom' id='mem_telecom'>
	     <option value="LG U+">LG U+</option>
	     <option value="KT">KT</option>
	     <option value="SKT">SKT</option>
	  </select>
	  </div>
    </div>   
    
    <br>
    
    <div>
      <label for="mem_phone" style='font-size: 0.9em;'>전화번호</label>    
      <div>
        <input type='number' name='mem_phone' id='mem_phone' 
                   placeholder="'-'제외한 11자리를 입력하시오." required="required" >
      </div>
    </div>  
    
    <div>
      <label for="mem_email" style='font-size: 0.9em;'>이메일</label>    
      <div>
        <input type='text' name='mem_email' id='mem_email' 
                   value='' required="required" placeholder="이메일">
      </div>
    </div>  
    
    <div>
      <div>
      <br>
        <button type="button" id='btn_send'>가입</button>
        <button type="button" onclick="location.href='../index.jsp'">취소</button>

      </div>
    </div>   
  </FORM>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>


