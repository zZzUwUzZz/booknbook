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
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/seller.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="/js/slide.js"></script>
</head>

<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <jsp:include page="/WEB-INF/views/adminFile/seller.jsp"/>
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
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-1">
                    <div class="box-1">
                        <h1>오늘 주문 내역</h1>
                        <table class="box-list">
                            <tr>
                                <td>총 주문</td>
                                <td>${TodayOrderCnt}건</td>
                                <td>배송 준비중</td>
                                <td>${TodayDeliPre}건</td>
                            </tr>
                            <tr>
                                <td>└ 판매</td>
                                <td>${TodaySellCnt}건</td>
                                <td>배송중</td>
                                <td>${TodayDeliShip}건</td>
                            </tr>
                            <tr>
                                <td>└ 대여</td>
                                <td>${TodayRentCnt}건</td>
                                <td>배송 완료</td>
                                <td>${TodayDeliComplete}건</td>
                            </tr>
                            <tr>
                                <td>└ 대여 예약</td>
                                <td>${TodayRentResCnt}건</td>
                            </tr>
                        </table>
                    </div>
                    <div class="gap"></div>
                    <div class="box-1">
                        <h1>즐겨찾기한 회원 수</h1>
                        <table class="box-list">
                            <tr>
                                <td>오늘</td>
                                <td>${TodayBookmarkCnt}명</td>
                                <td>이번 주</td>
                                <td>${WeekBookmarkCnt}명</td>
                                <td>이번 달</td>
                                <td>${MonthBookmarkCnt}명</td>
                            </tr>
                        </table>
                    </div>
                    <div class="gap"></div>
                    <div class="box-1">
                        <table class="box-list">
                            <h1>최근 한 달간 취소 내역</h1>
                            <tr>
                                <td>취소요청</td>
                                <td>${MonthCanelCnt}건</td>
                                <td>반품/교환 요청</td>
                                <td>${MonthReturnCnt}건</td>
                            </tr>
                        </table>
                    </div>
                    <div class="gap"></div>
                    <div class="box-1">
                        <table class="box-list">
                            <h1>정산 내역</h1>
                            <tr>
                                <td>오늘 정산</td>
                                <td>${TodaySumAmount}원</td>
                                <td>이 달 정산</td>
                                <td>${MonthSumAmount}원</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>

</html>