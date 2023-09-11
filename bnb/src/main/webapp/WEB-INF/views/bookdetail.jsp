<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>Book Detail</title>

</head>

<body>
    <h1>카테고리 | ${bDto.category_m} | ${bDto.category_s}</h1>
    <img src="C:\Users\user\Desktop\bookcover.jpg" alt="책 표지">
    <h2>책 정보</h2>
    <p>제목: ${bDto.b_title}</p>
    <p>판매가: ${bDto.b_price}</p>
    <p>대여료: ${bDto.b_rent}</p>
    <p>저자: ${bDto.b_author}</p>

    <div>
        <button onclick="adjustQuantity(-1)">-</button>
        <span id="quantityCounter">0</span>
        <button onclick="adjustQuantity(1)">+</button>
    </div>

    <p>총 상품 금액: <span id="totalPrice">0</span></p>
    
    <button onclick="rentAdd()">대여하기</button>
    <button onclick="cartAdd()">장바구니에 추가</button>
    
    <p>도서 소개 간략한 도서 설명</p>
    
    <button id="likeButton" onclick="likeBook()">찜하기</button>
    <button id="notificationButton" disabled>알림</button>
    
</body>
</html>
