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
 

</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <div class='material_center' style="height: 450px; background-image: url('./images/gallery_bg.png');background-size: contain;">

<div class='title_line_center'style='background-color: transparent; height: 30%; '><span class="title"style='text-align: center; background-color: transparent; '>
    당신의 진단결과는
</span></div>

 
 </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

