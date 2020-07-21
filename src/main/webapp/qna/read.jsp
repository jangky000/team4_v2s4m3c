<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>hyejung world</title>
 
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

  <c:set var="qnano" value="${qnaVO.qnano}" />
  

    <h3>${qna_title}</h3>
                   
  <ASIDE style='float: left;'>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?qnano=${qnano }' class="btn btn-success">목록</A>
    <span class='menu_divide' >  </span> 
    <A href='./update.do?qnano=${qnano }' class="btn btn-success">수정</A>
    <span class='menu_divide' >  </span> 
    <A href='./delete.do?qnano=${qnano }' class="btn btn-success">삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="qnano" value="${qnano}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 3px #AAAAAA;'>
            <h4>제목:${qnaVO.qna_title}</h4>
            <br>            
            <span>등록일:${qnaVO.qna_date.substring(0, 16)}</span>
          </li> 
          <li class="li_none">
           <DIV style='width:100px; margin: 0px auto; text-align: center;'>
           <IMG src="./storage/main_images/${qnaVO.upfile }" >
           </DIV>
           
          </li>
          <li class="li_none">
            <DIV>${qnaVO.qna_content }</DIV>
          </li>
        </ul>
      </fieldset>
      
  </FORM>
</div><!-- <div style="width: 80%; margin: 20px auto;">  -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>