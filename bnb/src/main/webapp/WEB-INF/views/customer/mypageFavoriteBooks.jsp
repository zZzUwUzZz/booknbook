<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/fav.css">
    <link rel="stylesheet" href="/css/customer/main.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>찜한 도서</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/adminFile/customer.jsp"/>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks" id="currpage">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area" id="async_board">

            <c:if test="${empty favBooks}">
                <div>찜한 책이 아직 없습니다.</div>
            </c:if>

            <c:if test="${!empty favBooks}">
                <div class="container-fav">
                    <c:forEach var="favBook" items="${favBooks}">

                        <div class="favbook">
                            <a href="/books/detail/${favBook.b_isbn}/${favBook.b_s_id}">
                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/1500x0/pdt/${favBook.b_isbn}.jpg" alt="책표지사진">
                            </a>
                        </div>

                    </c:forEach>
                </div>
            </c:if>

            <div class="button-area">
                <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', -1)">
                    <span class="material-symbols-sharp">
                        chevron_left
                        </span>
                </div>
                <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', 1)">
                    <span class="material-symbols-sharp">
                        chevron_right
                        </span>
                </div>

            </div>
            
        </div>



    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

        function shiftPage(currPageNum, numOfPages, num) {
                    
            if (currPageNum == 1 && num == -1) {
                alert('첫 페이지입니다.');
                return;
            }
            if (currPageNum == numOfPages && num == 1) {
                alert('마지막 페이지입니다.');
                return;
            }

            let page = parseInt(currPageNum) + num;
            location.href='/mypage/favoritebooks?page='+page;

        }
    
    </script>

</body>

</html>