<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="/css/noti.css">

    <!-- SockJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<!-- STOMP.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>


    <script src="/js/noti.js"></script>
    <script src="/js/search.js"></script>
    <script src="/js/main.js"></script>

    <style>
 
 body{
    animation: fadein 1500ms ease-out;
    -moz-animation: fadein 1500ms ease-out; /* Firefox */
    -webkit-animation: fadein 1500ms ease-out; /* Safari and  Chrome */
    -o-animation: fadein 1500ms ease-out; /* Opera */
}
@keyframes fadein {
    from {opacity:0;}
    to {opacity:1;}
}
@-moz-keyframes fadein { /* Firefox */
    from {opacity:0;}
    to {opacity:1;}
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {opacity:0;}
    to {opacity:1;}
}
@-o-keyframes fadein { /* Opera */
    from {opacity:0;}
    to {opacity: 1;}
}

.notilistbox {
  display: flex;
    flex-flow: wrap-reverse;
}
    </style>
</head>
     <!-- modal -->
 
     <div id="small-menu">
        
         <div class="smMenuList">
            <c:choose>
                <c:when test="${sessionScope.M_ROLE == 'USER'}">
                    <p class="smallmenuId">${sessionScope.loggedInUser}</p>
                    <a href="/mypage">마이페이지</a><br>
                    <a href="/mypage/orderlist">주문 내역</a><br>
                    <a href="/mypage/rentallist">대여 내역</a><br>
                </c:when>
                <c:when test="${sessionScope.M_ROLE == 'SELLER'}">
                    <p class="smallmenuId">${sessionScope.loggedInUser}</p>
                    <a href="/seller/main">서점 관리 홈</a><br>
                    <a href="/seller/sell/history">판매 내역</a><br>
                    <a href="/seller/book/list">도서 관리</a><br>
                    <a href="/seller/rent/curr">대여 관리</a><br>
                </c:when>
                <c:when test="${sessionScope.M_ROLE == 'ADMIN'}">
                    <p class="smallmenuId" style="color:red;"><b>${sessionScope.loggedInUser}<b></p>
                    <a href="/admin" style="color:red;"><b>관리자 페이지<b></a><br>
                </c:when>
            </c:choose>
            <a href="/member/logout">LOGOUT</a><br>
        </div>
     </div>

  <div style="position: absolute;">
     <%= "Session loggedInUser: " + session.getAttribute("loggedInUser") %>
    <%= "Session isLoggedIn: " + session.getAttribute("isLoggedIn") %>
    Session M_ROLE value: ${sessionScope.M_ROLE}
</div>

    <div class="noti_md">
        <div class="noti_tt">
            <p>알림</p>
        </div>
        <div class="notilistbox">
        </div>
    </div>
 

<div class="sc_md">
    <div class="sc_cls">
        <span class="material-symbols-outlined">
            close
        </span>
    </div>

    <form id="searchForm">
        <div class="scmd_input_box">
            <div class="scip_box">
                <span class="material-symbols-outlined">
                    search
                </span>
                <input class="scbook" type="text" id="searchInput" name="keyword" placeholder="Search...">
            </div>
        </div>
    </form>
</div>


<header>

    <div class="hd">
 
        <div class="hd_02">
            <div class="menu_01">
                <a href="<%=request.getContextPath()%>/bookstore">BOOKSTORE</a>
                <a href="<%=request.getContextPath()%>/books">BOOKS</a>
                <a>NEW</a>
                <a>RENT</a>
            </div>

            <div class="logo">
                <a href="/">BOOK N BOOK</a>
            </div>



            <div class="menu_02">
                <div class="bk_sc">SEARCH</div>
                <div id="cartbtn">CART</div>
                <div id="wishbtn">WISH</div>

                <div id="login-logout-button">
                    ${empty sessionScope.loggedInUser ? 'LOGIN' : 'ACCOUNT'}
                </div>
 

            <div class="login_bell">
                <div class="noti_btn">
                    <span class="material-symbols-rounded">
                        notifications
                    </span>
                </div>
                </div>
            </div>



        </div>

    </div>
    
 


 <script>
    

// 알림창 목록 
    $(document).ready(function () {
 
 var userId = "${sessionScope.loggedInUser}";
 var isLoggedIn = "${sessionScope.isLoggedIn}" === "true";

 var notifications = []; // 알림 목록

if (!isLoggedIn) {
  // 로그인이 안 되어 있을 때의 처리
  return;
}

// 1. 페이지 로딩 시 서버에서 알림 목록을 불러옵니다.
$.get("/notifications?userId=" + userId, function(data) {
  console.log("Server response: ", data); // 이 부분을 추가
  notifications = data;

  // nb_date 기준으로 내림차순 정렬
  notifications.sort((a, b) => {
  if (a.nb_date > b.nb_date) return -1;
  if (a.nb_date < b.nb_date) return 1;
  return 0;
});

  setDefaultNotification();

  let hasUnread = false;
  for (const notification of notifications) {
    if (notification.nb_read === 'N') {
      hasUnread = true;
      break;
    }
  }

  if (hasUnread) {
    newNotificationReceived();
  } else {
    removeNewDot();
  }
});



// 알림 아이콘 버튼 이벤트
$(".noti_btn").click(function (event) {
 $(".noti_md").toggle();
 markAllAsRead();  // 모든 알림을 읽음 상태로 변경
 event.stopPropagation();
});


// 모든 알림을 읽음 상태로 변경하는 함수
function markAllAsRead() {

 var userId = "${sessionScope.loggedInUser}";  

 // 서버에 읽음 상태로 바꾸는 요청을 보냅니다.
 $.post("/markAllAsRead", { userId: userId }, function(response) {
     // 모든 알림을 읽음 상태로 변경한 후에 빨간 점을 제거합니다.
     $(".noti_btn .new_dot").remove();
 });
}

function removeNewDot() {
 $(".noti_btn .new_dot").remove();
}


 $(".noti_md").click(function (event) {
   event.stopPropagation();
 });

 $(document).click(function () {
   $(".noti_md").hide();
 });


 // 초기 알림 상태 설정
 setDefaultNotification();

// WebSocket 초기화
var socket = new SockJS('/ws');
var stompClient = Stomp.over(socket);
var userId = "${sessionScope.loggedInUser}";  

stompClient.connect({}, function (frame) {
  stompClient.subscribe('/topic/notifications/' + userId, function (notification) {
   console.log("WebSocket notification: ", notification); // 이 부분을 추가

    var noti = JSON.parse(notification.body);
    notifications.push(noti);
    setDefaultNotification();
    showNotification(noti.userId, noti.b_title, noti.s_storename, noti.b_isbn, noti.b_s_id);
    newNotificationReceived();  // 새로운 알림이 있을 때 빨간 점 추가

  });
});

 
 // 빨간 점 추가
 function newNotificationReceived() {
   $(".noti_btn").each(function () {
     if (!$(this).find('.new_dot').length) { // new_dot이 없을 경우에만 추가
       var redDot = $('<span>').addClass('new_dot').text('●');
       $(this).append(redDot);
     }
   });
 }


// setDefaultNotification 함수 수정
function setDefaultNotification() {
 var notiBox = $('.notilistbox').first();
 notiBox.html('');
 
 let hasUnread = false;

 if (!isLoggedIn) {
   notiBox.append('<div class="noti_ngout">로그인이 필요한 서비스입니다.</div>');
 } else if (notifications.length === 0) {
   notiBox.append('<div class="noti_ng">표시할 알림이 없습니다.</div>');
 } else {
   notifications.forEach(function (notification) {
     
     if (notification.nb_read === 'N') {
       hasUnread = true;
     }
     console.log("DB에 있는 알림 목록", notification);

     var newDiv = $('<div></div>');
     newDiv.addClass('noti_item');
     newDiv.attr('data-read', 'false');
     
     var aTag = $('<a></a>');
     aTag.attr('href', '/books/detail/' + notification.b_isbn + '/' + notification.b_s_id);
 
     // nb_msg 값을 기반으로 다양한 메시지를 생성합니다.
     var fullMessage = '';
     if (notification.nb_msg === '입고') {
       fullMessage = `"` + notification.b_title + `" 상품이 재입고되었습니다! 지금 바로 확인해보세요.` + " ― " + notification.s_storename;
     } else if (notification.nb_msg === '대여가능') {
       fullMessage = `"` + notification.b_title + `" 상품 대여 가능 합니다! 지금 바로 확인해보세요.` + " ― " + notification.s_storename;
     } 
     // 추가적인 조건을 이곳에 작성
    
    
     aTag.html(fullMessage);
   
     var dateSpan = $('<span></span>');
     dateSpan.addClass('noti_date');
     dateSpan.html(notification.nb_date);
   
     newDiv.append(aTag);
     newDiv.append(dateSpan);
     newDiv.click(markAsRead);
     
     notiBox.prepend(newDiv);
     newNotificationReceived();
   });
 }
}

 function markAsRead(event) {
   const notiItem = $(event.currentTarget);
   notiItem.attr('data-read', 'true').css('background', '#cdcdcd');
   checkAllNotificationsRead();
 }

 if (hasUnread) {
   newNotificationReceived();
 } else {
   removeNewDot();
 }
 
})


 
    jQuery(function ($) {
        $("body").css("display", "none");
        $("body").fadeIn(1000);
        $("a.transition").click(function (event) {
            event.preventDefault();
            linkLocation = this.href;
            $("body").fadeOut(500, redirectPage);
        });
        function redirectPage() {
            window.location = linkLocation;
        }
    });

window.onload = function() {
    var msg = "${msg}";
    if (msg === '이미 로그인 된 상태입니다.') {
        alert(msg);
    }
};




document.addEventListener("DOMContentLoaded", function() {
  var loginLogoutButton = document.getElementById("login-logout-button");
  var cartbtn = document.getElementById("cartbtn");
  var wishbtn = document.getElementById("wishbtn");
  var loggedInUser = "${sessionScope.loggedInUser}";

  // 로그인 상태를 문자열 "null"과 비교하여 확인
  if (loggedInUser !== null && loggedInUser !== "null" && loggedInUser !== "") {
    // 로그인 상태일 경우
    loginLogoutButton.addEventListener("click", function() {
      window.location.href = "/mypage"; // 마이페이지로 이동
    });
    cartbtn.addEventListener("click", function() {
      window.location.href = "/cart"; // 카트 페이지로 이동
    });
    wishbtn.addEventListener("click", function() {
      window.location.href = "/mypage/favoritebooks"; // 위시리스트 페이지로 이동
    });
  } else {
    // 로그아웃 상태일 경우
    loginLogoutButton.addEventListener("click", function() {
      window.location.href = "/member/login"; // 로그인 페이지로 이동
    });
    cartbtn.addEventListener("click", function() {
      alert("로그인이 필요한 페이지입니다."); // 알림창 띄우기
    });
    wishbtn.addEventListener("click", function() {
      alert("로그인이 필요한 페이지입니다."); // 알림창 띄우기
    });
  }
});



// 로그인 시 ACCOUNT 마우스 오버 시 작은 메뉴 
$(document).ready(function() {
  var loggedInUser = "${sessionScope.loggedInUser}";
  var userRole = "${sessionScope.M_ROLE}";  // Add this line to get the role
  var button = $("#login-logout-button");

  // For login status based on session
  if (loggedInUser !== null && loggedInUser !== "null" && loggedInUser !== "") {
    button.attr("id", "login-logout-button-login"); // Add "login" to the ID
    button.text("ACCOUNT"); // Change the button text to ACCOUNT

    // If already logged in, redirect to appropriate page based on role
    button.click(function() {
      switch(userRole) {
        case "USER":
          window.location.href = "/mypage";
          break;
        case "SELLER":
          window.location.href = "/seller/main";
          break;
        case "ADMIN":
          window.location.href = "/admin";
          break;
        default:
          // Handle any other cases if needed
          break;
      }
    });
  } else {
    // If not logged in, redirect to login page on click
    button.click(function() {
      window.location.href = "/member/login";
    });
  }
});



// small menu 
$(document).ready(function() {
    var isOverButton = false;
    var isOverMenu = false;
    var timeoutId;

    // 메뉴를 숨길지 결정하는 함수
    function checkHideMenu() {
        if (!isOverButton && !isOverMenu) {
            // 메뉴를 숨기기 전에 약간의 딜레이를 줍니다.
            timeoutId = setTimeout(function() {
                $('#small-menu').hide();
            }, 200);  
        } else {
            // 마우스가 버튼이나 메뉴 위에 있다면 딜레이를 취소합니다.
            clearTimeout(timeoutId);
        }
    }

    // 버튼에 마우스가 들어갔을 때와 나갔을 때의 이벤트
    $('#login-logout-button-login').hover(
        function() {
            isOverButton = true;
            $('#small-menu').show();
        },
        function() {
            isOverButton = false;
            checkHideMenu();
        }
    );

    // 메뉴에 마우스가 들어갔을 때와 나갔을 때의 이벤트
    $('#small-menu').hover(
        function() {
            isOverMenu = true;
            clearTimeout(timeoutId);  // 기존의 딜레이를 취소
        },
        function() {
            isOverMenu = false;
            checkHideMenu();
        }
    );
});


 </script>


</header>
 