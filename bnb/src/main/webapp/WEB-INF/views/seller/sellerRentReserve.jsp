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
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-3">
                    <div class="box-3">
                        <h1>대여 예약 신청 관리</h1>
                        <button id="res_status_save" onclick="updateSelectedsSatus()">저장</button>
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
                                <c:forEach items="${RentResList}" var="rentres" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" class="res_manage" name="res_manage"></td>
                                        <td>${rentres.rr_id}</td>
                                        <td>${rentres.rr_c_id}</td>
                                        <td>${rentres.b_title}</td>
                                        <td>${rentres.rr_reqdateStr}</td>
                                        <td>
                                            <select class="res_status" name="res_status_${status.index}">
                                                <c:forEach items="${ResStatusList}" var="ResStatus">
                                                    <c:choose>
                                                        <c:when test="${ResStatus.res_status == '예약취소'}">
                                                            <option value="${ResStatus.res_status}" disabled selected>
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
    document.addEventListener('DOMContentLoaded', function () {
        var button = document.getElementById('res_status_save');

        // 체크박스의 상태가 변경될 때마다 실행되는 함수
        document.addEventListener('change', function (event) {
            if (event.target.classList.contains('res_manage')) {
                updateButtonState(); // 체크박스 상태에 따라 버튼 상태 업데이트
            }
        });
    });

    function updateButtonState() {
        // 체크박스의 상태에 따라 버튼 활성화 또는 비활성화
        var selectedCheckboxes = document.querySelectorAll('input.res_manage:checked');
        var button = document.getElementById('res_status_save');

        if (selectedCheckboxes.length > 0) {
            button.disabled = false; // 체크된 경우 버튼 활성화
        } else {
            button.disabled = true; // 체크되지 않은 경우 버튼 비활성화
        }
    }

    // 페이지 로드 시 초기 버튼 상태 설정
    updateButtonState();

    function updateSelectedsSatus() {
        var selectedRows = document.querySelectorAll('input[type="checkbox"]:checked');
        var dataToSend = [];

        if (selectedRows.length > 0) {
            selectedRows.forEach(function (checkbox) {
                var row = checkbox.closest('tr'); // 체크박스가 속한 행 가져오기
                var rr_idElement = row.querySelector('td:nth-child(2)'); // 두 번째 td 요소에서 rr_id 가져오기
                var rr_id = rr_idElement.textContent.trim(); // rr_id 값 추출
                var resStatusElement = row.querySelector('select[name^="res_status"]'); // 선택 상자 가져오기
                var res_status = resStatusElement ? resStatusElement.value : null;

                if (rr_id !== null) {
                    dataToSend.push({
                        rr_id: rr_id,
                        res_status: res_status
                    });
                }
            });

            // 데이터를 서버로 보내고 업데이트 요청을 처리하는 부분 추가
            $.ajax({
                type: 'POST',
                url: '/seller/rent/reserve', // 서버의 업데이트 URL 경로 설정
                data: JSON.stringify(dataToSend),
                contentType: 'application/json',
                success: function (response) {
                    alert("예약 상태를 변경했습니다!");
                    // 성공 시 실행할 코드
                },
                error: function (error) {
                    alert("예약 상태 변경 실패");
                    // 실패 시 실행할 코드
                }
            });
        } else {
            alert("선택된 항목이 없습니다.");
            return; // 선택된 항목이 없을 경우 함수 종료
        }
    }
</script>



</html>