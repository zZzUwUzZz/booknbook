<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/seller.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>
</head>

<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <section>
        <div class="wrap">
            <div class="content">
                <div class="side-menu">
                    <div class="bsname">
                        <h1><a href="/seller/main">서점 이름</a></h1>
                    </div>
                    <div class="menu-title">
                        MENU
                    </div>
                    <div class="menu">
                        <div class="menu-group">
                            <div class="bigmenu"><span>서점 정보</span></div>
                            <div class="submenu"><a href="/seller/infoupdate">서점 정보 관리</a></div>
                            <div class="submenu"><a href="/seller/csmember">고객 정보 보기</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>도서 관리</span></div>
                            <div class="submenu"><a href="/seller/book/list">등록된 도서 리스트</a></div>
                            <div class="submenu"><a href="/seller/book/add">도서 추가 등록</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>대여 관리</span></div>
                            <div class="submenu"><a href="/seller/rent/reserve">예약 신청 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/curr">대여 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/return">반납 내역</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>판매 관리</span></div>
                            <div class="submenu"><a href="/seller/sell/history">판매 내역</a></div>
                            <div class="submenu"><a href="/seller/sell/cancel">주문 취소 관리</a></div>
                            <div class="submenu"><a href="/seller/return/manage">반품/교환 관리</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>정산</span></div>
                            <div class="submenu"><a href="/seller/account">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-3">
                    <div class="box-3">
                        <h1>등록된 도서 리스트</h1>
                        <table class="book-list">
                            <thead>
                                <tr>
                                    <th>분류</th>
                                    <th>제목</th>
                                    <th>저자</th>
                                    <th>판매재고</th>
                                    <th>대여재고</th>
                                </tr>
                            </thead>
                            <!-- <tbody>
                                <c:forEach items="${books}">
                                    <tr>
                                        <td>${books.b_title}</td>
                                        <td>${books.b_author}</td>
                                        <td>${books.b_salestock}</td>
                                        <td>${books.b_rentalstock}</td>
                                    </tr>
                            </c:forEach> -->
                            </tbody>
                        </table>
                        <div class="gap"></div>
                        <h1>대여중인 회원 리스트</h1>
                        <table class="member-list">
                            <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>아이디</th>
                                    <th>구매 횟수</th>
                                    <th>대여 횟수</th>
                                    <th>연체 횟수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>이름</td>
                                    <td>아이디</td>
                                    <td>구매 횟수</td>
                                    <td>대여 횟수</td>
                                    <td>연체 횟수</td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>아이디</td>
                                    <td>구매 횟수</td>
                                    <td>대여 횟수</td>
                                    <td>연체 횟수</td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>아이디</td>
                                    <td>구매 횟수</td>
                                    <td>대여 횟수</td>
                                    <td>연체 횟수</td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>아이디</td>
                                    <td>구매 횟수</td>
                                    <td>대여 횟수</td>
                                    <td>연체 횟수</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>

</html>