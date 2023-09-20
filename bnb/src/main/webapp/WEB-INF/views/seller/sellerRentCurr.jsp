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
    <jsp:include page="/WEB-INF/views/adminFile/seller.jsp"/>
    <section>
        <div class="wrap">
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
                    <h1>대여 현황</h1>
                    <button id="status_save" onclick="updateSelectedStatus()">저장</button><br><br>
                    <table class="seller-list">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>주문일자</th>
                                <th>아이디</th>
                                <th>제목</th>
                                <th>대여기간</th>
                                <th>대여시작일</th>
                                <th>반납예정일</th>
                                <th>수령방법</th>
                                <th colspan="2">주문상태</th>
                                <th colspan="2">대여상태</th>
                                <th>연체일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${RentCurrentList}" var="rentcurrent" varStatus="status">
                                <tr id="row_${status.index}">
                                    <td>${rentcurrent.o_id}</td>
                                    <td>${rentcurrent.o_dateStr}</td>
                                    <td>${rentcurrent.o_c_id}</td>
                                    <td>${rentcurrent.b_title}</td>
                                    <td id="rental_period_${status.index}">${rentcurrent.r_rentalperiod}</td>
                                    <td id="del_date_text_${status.index}">${rentcurrent.deliverydateStr}</td>
                                    <td id="due_date_text_${status.index}">${rentcurrent.r_duedateStr}</td>
                                    <td>${rentcurrent.o_delivery_sort}</td>
                                    <td id="del_status_text_${status.index}">${rentcurrent.delivery_status}</td>
                                    <td>
                                        <select class="del_status" name="del_status_${status.index}">
                                            <c:forEach items="${DeliveryStatusList}" var="DelStatus">
                                                <option value="${DelStatus.delivery_status}" <c:if
                                                    test="${rentcurrent.delivery_status == DelStatus.delivery_status}">
                                                    selected
                                                    </c:if>>
                                                    ${DelStatus.delivery_status}
                                                </option>
                                            </c:forEach>
                                        </select>

                                    </td>
                                    <td id="rent_status_text_${status.index}">${rentcurrent.rental_status}</td>
                                    <td>
                                        <c:if
                                            test="${rentcurrent.rental_status == '대여중' || rentcurrent.rental_status == '연체'}">
                                            <button id="UpdateRentStatus_Return_${status.index}"
                                                class="rent-return-button" data-index="${status.index}">반납 완료</button>
                                        </c:if>
                                    </td>
                                    <td>${rentcurrent.overdue_days}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>
<script>
    function updateSelectedStatus() {
        var data = [];
        var rows = document.querySelectorAll('.seller-list tbody tr');

        rows.forEach(function (row, index) {
            var o_id = row.querySelector('td:first-child').textContent;
            var b_title = row.querySelector('td:nth-child(4)').textContent;
            var select = row.querySelector('.del_status');
            var delivery_status = select.options[select.selectedIndex].value;

            data.push({
                o_id: o_id,
                b_title: b_title,
                delivery_status: delivery_status,
            });
        });

        console.log(data);

        $.ajax({
            url: '/seller/rent/curr/save',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (response) {
                console.log('서버 응답:', response);
                alert('상태가 저장되었습니다!');

                response.forEach(function (item, index) {
                    var del_status_before = $('#del_status_text_' + index).text();
                    var del_status_text = $('#del_status_text_' + index);
                    var del_date_text = $('#del_date_text_' + index);
                    var due_date_text = $('#due_date_text_' + index);
                    // var rental_period = $('#rental_period_' + index).val(); // Added '#'
                    // rental_period = parseInt(rental_period);

                    // if (isNaN(rental_period)) { // Check for NaN
                    //     console.error("rental_period is not a number");
                    //     return;
                    // }

                    if (del_status_before != item.delivery_status) {
                        del_status_text.text(item.delivery_status);
                        if (item.delivery_status == '배송완료' || item.delivery_status == '수령완료') {
                            $('#rent_status_text_' + index).text('대여중');
                            $('#UpdateRentStatus_Return_' + index).show();
                            // if (del_date_text.text() == '' || due_date_text.text() == '') {
                            //     var today = new Date();
                            //     var year = today.getFullYear();
                            //     var month = String(today.getMonth() + 1).padStart(2, '0');
                            //     var day = String(today.getDate()).padStart(2, '0');
                            //     var formattedDate = year + '-' + month +'-' + day;

                            //     del_date_text.text(formattedDate);

                            //     today.setDate(today.getDate() + rental_period);

                            //     year = today.getFullYear();
                            //     month = String(today.getMonth() + 1).padStart(2, '0');
                            //     day = String(today.getDate()).padStart(2, '0');
                            //     formattedDate = year + '-' + month +'-' + day;
                                
                            //     due_date_text.text(formattedDate);
                            // }
    
                        } else {
                            $('#rent_status_text_' + index).text('대여시작전');
                            $('#UpdateRentStatus_Return_' + index).hide();
                            del_date_text.text('');
                            due_date_text.text('');
                        }
                    }
                });
            },
            error: function (error) {
                console.error('오류 발생:', error);
                alert('상태 저장 실패');
            }
        });
    }

    $(document).ready(function () {
        $(document).on('click', '.rent-return-button', function () {
            var index = $(this).data('index');
            UpdateRentStatus_Return(index);
        });
    });

    function UpdateRentStatus_Return(index) {
        var row = document.getElementById('row_' + index);

        if (row) {
            var o_id = row.querySelector('td:first-child').textContent;
            var b_title = row.querySelector('td:nth-child(3)').textContent;

            $.ajax({
                url: '/seller/rent/curr/return',
                method: 'POST',
                data: JSON.stringify({
                    o_id: o_id,
                    b_title: b_title
                }),
                contentType: 'application/json',
                success: function (response) {
                    console.log('처리 성공 : ', response);
                    alert('반납 완료 처리되었습니다!');
                },
                error: function (error) {
                    console.log('오류 발생 : ', error);
                    alert('반납 처리 중 오류가 발생하였습니다');
                }
            });
        }
    }
</script>

</html>