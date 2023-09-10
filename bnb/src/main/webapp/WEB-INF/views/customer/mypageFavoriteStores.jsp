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
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>

    <title>즐겨찾는 서점</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores" id="currpage">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <c:if test="${empty favStores}">
                <div>즐겨찾는 서점이 아직 없습니다.</div>
            </c:if>

            <c:if test="${!empty favStores}">
                <div class="container-fav">
                    <c:forEach var="favStore" items="${favStores}">

                        <div class="favstore">
                            <a href="/storedetail?s_id=${favStore.m_id}">
                                <br>
                                여기에 서점사진 들어가야됨!<br>
                                -<br>
                                ${favStore.m_id}<br>
                                ${favStore.s_storename}
                            </a>
                        </div>


                    </c:forEach>
                </div>
            </c:if>

        </div>

        <div class="button-area">

            <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', 1)">다음</div>
            <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', -1)">이전</div>

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
            location.href='/mypage/favoritestores?page='+page;

        }

    </script>

</body>

</html>