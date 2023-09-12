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
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-3">
                    <div class="box-3">
                        <h1>대여 예약 신청 관리</h1>
                        <button id="res_status_save">저장</button>
                        <button id="res_refuse">거절</button><br><br>
                        <table class="seller-list">
                            <thead>
                                <tr>
                                    <th>
                                        <!-- 공백 -->
                                    </th>
                                    <th>예약번호</th>
                                    <th>아이디</th>
                                    <th>제목</th>
                                    <th>신청일자</th>
                                    <th>예약상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${RentResList}" var="rentres">
                                    <tr>
                                        <td><input type="checkbox" id="res_manage" name="res_manage"></td>
                                        <td>${rentres.rr_id}</td>
                                        <td>${rentres.rr_c_id}</td>
                                        <td>${rentres.b_title}</td>
                                        <td>${rentres.rr_reqdateStr}</td>
                                        <td>
                                            <select id="res_status" name="res_status">
                                                <option value="">죽음</option>
                                                <c:forEach items="${ResStatusList}" var="ResStatus">
                                                    <c:choose>
                                                        <c:when test="${ResStatus.res_status == '예약취소'}">
                                                            <option value="${ResStatus.res_status}" selected disabled>
                                                                ${ResStatus.res_status}
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${ResStatus.res_status}">
                                                                ${ResStatus.res_status}
                                                            </option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
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
    document.getElementById('res_status_save').addEventListener('click', function () {
        var selectedOptions = [];
        var checkboxes = document.querySelectorAll('.res_manage:checked');

        checkboxes.forEach(function (checkbox) {
            var select = checkbox.closest('tr').querySelector('.res_status');
            var selectedValue = select.value;

            // selectedOptions 배열에 선택된 값 저장함
            selectedOptions.push({
                rr_id: checkbox.value,
                res_status: selectedValue
            });
        });

    });
</script>

</html>