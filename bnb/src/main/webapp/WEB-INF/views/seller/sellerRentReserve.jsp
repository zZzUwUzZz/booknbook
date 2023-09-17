<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-3">
                    <div class="box-3">
                        <h1>대여 예약 신청 관리</h1>
                        <table class="seller-list">
                            <thead>
                                <tr>
                                    <th>예약번호</th>
                                    <th>아이디</th>
                                    <th>제목</th>
                                    <th>신청일자</th>
                                    <th>예약상태</th>
                                    <th>예약수락</th>
                                    <th>거절사유</th>
                                    <th>예약거절</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${RentResList}" var="rentres" varStatus="status">
                                    <tr>
                                        <td>${rentres.rr_id}</td>
                                        <td>${rentres.rr_c_id}</td>
                                        <td>${rentres.b_title}</td>
                                        <td>${rentres.rr_reqdateStr}</td>
                                        <td id="res_status">${rentres.res_status}</td>
                                        <td><button id="res_accept_btn">수락</button></td>
                                        <td><input type="text" id="res_refuse_input" placeholder=""
                                                data-rejection-reason="${rentres.rr_rejection_reason}"></td>
                                        <td><button id="res_refuse_btn">거절</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var rows = document.querySelectorAll('.seller-list tbody tr');

        rows.forEach(function (row) {
            var status_td = row.querySelector('#res_status');
            var accept_btn = row.querySelector('#res_accept_btn');
            var refuse_input = row.querySelector('#res_refuse_input');
            var refuse_btn = row.querySelector('#res_refuse_btn');

            if (status_td && accept_btn && refuse_input && refuse_btn) {
                if (status_td.textContent === '승인대기') {
                    accept_btn.style.display = 'block';
                    refuse_input.style.display = 'block';
                    refuse_btn.style.display = 'block';

                    refuse_input.placeholder = '거절 사유를 입력하세요';
                } else if (status_td.textContent === '예약불가') {
                    var refusereason = refuse_input.getAttribute('data-rejection-reason');
                    refuse_input.style.display = 'block';
                    refuse_input.placeholder = refusereason;
                } else {
                    accept_btn.style.display = 'none';
                    refuse_input.style.display = 'none';
                    refuse_btn.style.display = 'none';
                }

                accept_btn.addEventListener('click', function () {
                    var rr_id = row.querySelector('td:first-child').textContent;

                    if (rr_id) {
                        fetch('reserve/accept', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify({
                                    rr_id: rr_id,
                                }),
                            })
                            .then(function (response) {
                                if (response.ok) {
                                    alert('예약 신청을 수락하였습니다!');
                                    status_td.textContent = '예약중';
                                    accept_btn.style.display = 'none';
                                    refuse_input.style.display = 'none';
                                    refuse_btn.style.display = 'none';
                                }
                            });
                    }
                });

                refuse_btn.addEventListener('click', function () {
                    var rr_id = row.querySelector('td:first-child').textContent;
                    var rr_rejection_reason = refuse_input.value;

                    if (!rr_rejection_reason) {
                        alert('거절 사유를 입력하세요');
                        return;
                    }

                    if (rr_id) {
                        fetch('reserve/refuse', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify({
                                    rr_id: rr_id,
                                    rr_rejection_reason: rr_rejection_reason,
                                }),
                            })
                            .then(function (response) {
                                if (response.ok) {
                                    alert('예약 신청을 거절했습니다');
                                    status_td.textContent = '예약불가';
                                    accept_btn.style.display = 'none';
                                    refuse_btn.style.display = 'none';
                                }
                            });
                    }
                });
            }
        });
    });
</script>

</html>