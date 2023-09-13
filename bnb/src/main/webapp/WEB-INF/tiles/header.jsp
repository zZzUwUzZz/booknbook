<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <script src="/js/noti.js"></script>
    <script src="/js/search.js"></script>
    <script src="/js/main.js"></script>
</head>
     <!-- modal -->

     <div id="small-menu">
        <p class="smallmenuId">${sessionScope.loggedInUser}</p>
        <div class="smMenuList">
            <a href="/mypage">마이페이지</a><br>
            <a href="/mypage/orderlist">주문 내역</a><br>
            <a href="/mypage/rentallist">대여 내역</a><br>
            <a href="/member/logout">LOGOUT</a><br>
        </div>
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
                <a href="<%=request.getContextPath()%>/cart">CART</a>
                <a>WISH</a>

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

window.onload = function() {
    var msg = "${msg}";
    if (msg === '이미 로그인 된 상태입니다.') {
        alert(msg);
    }
};
    document.addEventListener("DOMContentLoaded", function() {
    var loginLogoutButton = document.getElementById("login-logout-button");
    var loggedInUser = "${sessionScope.loggedInUser}";
  
    // 로그인 상태를 문자열 "null"과 비교하여 확인
    if (loggedInUser !== null && loggedInUser !== "null" && loggedInUser !== "") {
      // 로그인 상태일 경우 마이페이지로 이동
      loginLogoutButton.addEventListener("click", function() {
        window.location.href = "/mypage"; // 로그아웃 컨트롤러로 이동
      });
    } else {
      // 로그아웃 상태일 경우, 로그인 페이지로 이동
      loginLogoutButton.addEventListener("click", function() {
        window.location.href = "/member/login"; // 로그인 페이지로 이동
      });
    }
  });


// 로그인 시 ACCOUNT 마우스 오버 시 작은 메뉴 
$(document).ready(function() {
    var loggedInUser = "${sessionScope.loggedInUser}";
    var button = $("#login-logout-button");
    // For login status based on session
    if (loggedInUser !== null && loggedInUser !== "null" && loggedInUser !== "") {
        button.attr("id", "login-logout-button-login"); // Add "login" to the ID
        button.text("ACCOUNT"); // Change the button text to ACCOUNT

        // If already logged in, redirect to mypage on click
        button.click(function() {
            window.location.href = "/mypage";
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
 
