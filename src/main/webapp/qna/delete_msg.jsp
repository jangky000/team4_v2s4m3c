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
 

<DIV class='message'>
  <fieldset class='fieldset_basic'>

    <UL style = "width:30%: text-align:center;" >
    
      <c:choose>
        <c:when test="${passwd_cnt == 1 }"> <!-- 패스워드 일치 -->
          <c:choose>
            <c:when test="${cnt == 1}"> <!-- 글 삭제 성공 -->
           
              <LI class='li_none'>
                <span class='span_success' > 등록된 Q&A 삭제완료</span>
              </LI>
            </c:when>
            <c:otherwise>    <!-- 글 삭제 실패 -->
              <LI class='li_none'>
                <span class='span_fail'>공지사항 삭제에 실패했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_fail'>다시 시도해주세요.</span>
              </LI>
            </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise> <!-- 패스워드 불일치 -->
          <LI class='li_none'>
            <span class='span_fail'>패스워드가 일치하지 않습니다. 다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${cnt == 1 && passwd_cnt == 1}">
          <LI class='li_none'>
            <button type='button' 
                        onclick="location.href='./list.do?'"
                        class="btn btn-primary">목록</button>                        
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-primary">재시도</button>
            <button type='button' 
                        onclick="location.href='./list.do?'"
                        class="btn btn-primary">목록</button>                        
          </LI>
        </c:otherwise> 
      </c:choose>
      
     </UL>
  </fieldset>
 
</DIV>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
