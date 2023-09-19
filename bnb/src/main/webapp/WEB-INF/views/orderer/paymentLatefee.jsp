<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYMENT</title>

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
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/order.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>
<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="wrapper">

        <h1>PAYMENT - LATEFEE</h1>

        <form action="/payment/latefee" method="POST" id="payForm">

        <div class="cart_area">

            <div class="cart_subject">
                <h3>연체료</h3>
            </div>

            <div class="cart_items">
                <table>

                    <tr class="head_row">
                        <th width="170">서점명</th>
                        <th>도서명</th>
                        <th width="140px">반납기한</th>
                        <th width="80px">연체일수</th>
                        <th width="140px">누적연체료</th>
                    </tr>
                
                    <c:forEach items="${lateList}" var="lateDto">
                        <tr>
                            <input type="hidden" name="r_idList" value="${lateDto.r_id}">
                            <td>${lateDto.s_storename}</td>
                            <td><span>${lateDto.b_title}</span></td>
                            <td><fmt:formatDate value="${lateDto.r_duedate}" pattern="yyyy-MM-dd"/></td>
                            <td>${lateDto.overdue_days}일</td>
                            <td><fmt:formatNumber value="${lateDto.r_latefee_total}" type="number" pattern="#,##0"/>원</td>
                        </tr>
                    </c:forEach>

                    <tr class="last_row">
                        <td colspan="4">
                        <td><fmt:formatNumber value="${total_latefee}" type="number" pattern="#,##0"/>원</td>
                    </tr>

                </table> 
            </div>
            
        </div>

        <div class="button_area">
            <button type="button" onclick="location.href='/mypage/rentallist'">돌아가기</button>
            <button type="submit">결제하기</button>
        </div>

        </form>

    </div>


	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

        $(document).ready(function () {

            $('#payForm').submit(function(event) {

                event.preventDefault();

                let conf = confirm('계속할까요?')

                if (conf == true) {

                    alert('결제를 진행합니다...')

                    this.submit();
                }

            })

        })

    </script>

</body>
</html>