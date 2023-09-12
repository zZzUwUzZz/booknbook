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
.qty_input {
    width: 35px;
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
#success {
    background-color: rgb(150, 150, 150);
    width: 900px;
    height: 400px;
    font-size: xx-large;
    text-align: center;
    line-height: 400px;
    border-bottom: 1px solid #36593a;
    margin: auto;
}

</style>

</head>
<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="wrapper">

        <h1>PAYMENT SUCCESSFUL</h1>

        <div id="success">

            결제가 완료되었습니다!
            
        </div>

        <div class="button_area">
            <button type="button" onclick="location.href='/'">메인홈으로</button>
            <button type="button" onclick="location.href='/mypage'">마이페이지로</button>
        </div>

    </div>


	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


</body>
</html>