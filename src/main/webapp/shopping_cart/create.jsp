<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>SKINFIT</title>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
  <div style="width: 50%; margin: 20px auto; outline: solid 1px gray;">
    <h4 style="padding: 20px 0;">장바구니 페이지</h4>
    *: 필수 입력
    <form name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
      <div class="form-group">
        <label for="memno" class="col-md-2 control-label" style='font-size: 0.9em;'>회원번호*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='memno' id='memno' value='' required="required" style='width: 50%;' placeholder="회원번호">
        </div>
      </div>       
      
      <div class="form-group">
        <label for="itemno" class="col-md-2 control-label" style='font-size: 0.9em;'>상품번호*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='itemno' id='itemno' value='' required="required" style='width: 50%;' placeholder="상품번호">
        </div>
      </div> 
  
      <div class="form-group">
        <label for="quantity" class="col-md-2 control-label" style='font-size: 0.9em;'>수량*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='quantity' id='quantity' value='' required="required" style='width: 50%;' placeholder="수량">
        </div>
      </div>
      <div style="text-align: right;">
        <button type="submit" class="btn btn-default">등록</button>
      </div>
    </form>
  </div>
  ** 삭제할 페이지
</body>
</html>