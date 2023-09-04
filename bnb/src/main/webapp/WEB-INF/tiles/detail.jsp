<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Detail</title>
</head>
<body>
    <h1>카테고리 제목</h1>
    <img src="C:\Users\user\Desktop\bookcover.jpg" alt="책 표지">
    <h2>책 정보</h2>
    <p>제목: 책 제목</p>
    <p>가격: 책 가격</p>
    <p>저자: 책 저자</p>

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
