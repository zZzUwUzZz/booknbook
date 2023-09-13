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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
<style>

.wrapper {
    margin-top: 40px;
}

h1 {
    border-bottom: 1px solid #36593a;
}

h1, h3 {
    box-sizing: border-box;
    background-color: rgb(150, 150, 150);
    width: 900px;
    margin: auto;
    padding: 10px;
}

.cart_area {
    background-color: rgb(150, 150, 150);
    width: 900px;
    margin: auto;
}

table {
    background-color: white;
    width: 880px;
    margin: auto;
    text-align: center;
    padding: 5px;
}

tr {
    height: 30px;
}

.button_area {
    box-sizing: border-box;
    display: flex;
    justify-content: space-between;
    background-color: rgb(150, 150, 150);
    width: 900px;
    margin: auto;
    padding: 20px 10px;
}

</style>

</head>
<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="wrapper">

        <h1>연체료</h1>

        <div class="cart_area">

            <div class="cart_subject">
                <h3>연체 도서 목록</h3>
            </div>

            <div class="cart_items">
                <table>
                    <tr>
                        <th>서점명</th>
                        <th>도서명</th>
                        <th>연체료</th>
                    </tr>
                    <c:forEach items="${lateFeeList}" var="lateFee">
                        <tr>
                            <td>${lateFee.s_storename}</td>
                            <td>${lateFee.b_title}</td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            
            <div class="show_all">
                <table>
                    <tr>
                        <th>결제수단</th>

                        <th>연체일</th> 
                        <th>연체료 총액</th> <!--모든 도서들의 연체료 총금액-->
                    <tr>
                        <td>카드 결제</td>
                        <td>권</td> <!--연체된 책들 모두 -->
                        <td>원</td> <!--연체된 모든 책들의 연체료총액-->
                    </tr>
                    <c:forEach items="${lateFeeList}" var="lateFee">
                        <tr>
                            <td></td>
                            <td></td>
                            <td>${lateFee.r_latefee_total}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>

        <div class="button_area">
            <button type="button" onclick="location.href='/mypage/rentallist'">돌아가기</button>
            <button type="button" onclick="location.href='/paymentlatefee'">결제하기</button>
        </div>

    </div>


	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


</body>
</html>