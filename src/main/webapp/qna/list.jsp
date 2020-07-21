<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>world</title>
 
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="../css/style.css" rel="Stylesheet" type="text/css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="../javascript/script.js"></script>
  
  <script type="text/javascript">
  $(function(){
 
  });
  </script>

  <style>
    table.tbl_sty{
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;    
    background-color: white;   
    }
    table.tbl_sty tr{
    border: 1px solid gray;
    background-color: white;
    }
    table.tbl_sty th{
    border: 1px solid gray;
    background-color: white;
    }
    table.tbl_sty td{
    border-bottom: 1px solid gray;   
    background-color: white;
    } 
  </style>   
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<div style="width: 80%; margin: 20px auto;">
  

  <div class="span9" id="qna_content">
          <div class="row-fluid"> <!-- 상단 레이아웃 -->
            <div class="alert alert-success">
              <h4>Q&A 게시판</h4>
              </div></div></div>
    <A href="./create.do?qnano=${qnaVO.qnano }" class="btn btn-success" >Q&A등록</A>
    <!--  <span class='menu_divide' >│</span> -->

  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
         <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 45%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr class="success">  <!-- 레이아웃 컬러-->
          <th style='text-align: center;'>NO.</th>
          <th style='text-align: center;'>문의유형</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>작성자</th>
        </tr>    
      </thead>
      
      <%-- table 내용 --%>
      <tbody>

        <c:forEach var="qnaVO" items="${list }">
          <c:set var="qnano" value="${qnaVO.qnano }" />
          <tr> 
            <td style='text-align: center;'>${qnaVO.qnano}</td>
            <td style='text-align: center;'>${qnaVO.qnacate}</td>
              <td style='text-align: center;'>
              <a href="./read.do?qnano=${qnano}">${qnaVO.qna_title}</a> 
            </td> 
            
            <td style='text-align: center;'>${qnaVO.qna_name}</td>
            <td style='text-align: center;'>${qnaVO.qna_date.substring(0, 10)}</td>
          </tr>
          </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div> <!-- <div style='width: 100%;'> -->
 </div><!--  <div style="width: 80%; margin: 20px auto;"> -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 