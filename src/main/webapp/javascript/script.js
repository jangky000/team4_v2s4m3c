
//메인 이미지 코드 시작
  var imgArray = new Array();
  imgArray[0] = "./logo_blue.svg";
  imgArray[1] = "./logo_green.svg";
  imgArray[2] = "./logo_pink.svg";
  imgArray[3] = "./logo_purple.svg";
  imgArray[4] = "./logo_yellow.svg";

  function showImage() {
    var imgNum = Math.round(Math.random() * 4);
    var objImg = document.getElementById("introImg");
    objImg.src = imgArray[imgNum];

    setTimeout("showImage()", 2000);
  }

//메인 이미지 끝

// 좌측 네비게이션 시작

  function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
  }

  /* Set the width of the side navigation to 0 */
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0px";
  }
//좌측 네비게이션 끝

// 검색창
  function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
  }

  function closeSearch() {
    document.getElementById("myOverlay").style.display = "none";

  }
//검색창끝
