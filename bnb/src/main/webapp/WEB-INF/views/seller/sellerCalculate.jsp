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

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $("#Start_Date").datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월',
                    '12월'
                ],
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                dateFormat: "yymmdd",
                maxDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                onClose: function (selectedDate) {
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#endDate").datepicker("option", "minDate", selectedDate);
                }

            });
            $("#End_Date").datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월',
                    '12월'
                ],
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                dateFormat: "yymmdd",
                maxDate: 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                onClose: function (selectedDate) {
                    // 종료일(endDate) datepicker가 닫힐때
                    // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                    $("#startDate").datepicker("option", "maxDate", selectedDate);
                }

            });
        });
    </script>
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
                <div class="contain-Calc">
                    <div class="box-Calc">
                        <h1>정산 내역 조회</h1>
                        <form action="/seller/calculate" method="post">
                            <input type="text" id="Start_Date" name="Start_Date" placeholder="시작 날짜">
                            <input type="text" id="End_Date" name="End_Date" placeholder="종료 날짜">
                            <button>검색</button><br><br>
                        </form>
                        <table class="Calc-list">
                            <tr>
                                <td class="left">조회기간</td>
                                <td class="right">${Start_Date} ~ ${End_Date}</td>
                            </tr>
                            <tr>
                                <td class="left">대여료</td>
                                <td class="right">${CalculateRent}원</td>
                            </tr>
                            <tr>
                                <td class="left">연체료</td>
                                <td class="right">${CalculateLate}원</td>
                            </tr>
                            <tr>
                                <td class="left">판매금액</td>
                                <td class="right">${CalculateSell}원</td>
                            </tr>
                            <tr>
                                <td class="left">교환/환불금액</td>
                                <td class="right">${CalculateReturn}원</td>
                            </tr>
                            <tr>
                                <td class="left">수수료 (2%)</td>
                                <td class="right">${CalculateCommission}원</td>
                            </tr>
                            <tr>
                                <td class="left"></td>
                                <td class="right"></td>
                            </tr>
                            <tr>
                                <td class="left">총 정산 금액</td>
                                <td class="right">${CalculateTotal}원</td>
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