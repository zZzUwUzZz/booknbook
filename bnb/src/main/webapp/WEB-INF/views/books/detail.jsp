<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/slide.css">
<link rel="stylesheet" href="/css/books.css">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/main.js"></script>
<script src="/js/search.js"></script>


    <style>
        .box {
            border: solid 1px black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 470px;
            height: 270px;
            margin: 70px auto;
            padding: 25px;
            font-weight: bold;
            background-color:#fffbed;
        }

        .book-image img {
            max-width: 100%;
            height: auto;
            width: 180px;
            float: left;
            margin-right: 13px;
        }

        .book-details {
            text-align: left; 
        }

        .btn {
            background: #ffff;
            border: solid 1px black;
            margin: 3px;
            padding: 5px 12px;
            font-size: 10px;
        }
           /*도서소개 상자*/
        .book-introduction {
            border: solid 1px black;
            width: 470px;
            margin: 10px auto;
            padding: 20px;
            font-weight: bold;
            background-color:#fffbed;
        }
        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }
           /*찜하기,알림,대여 등  버튼*/
        #btn-outline-dark{
            position: relative;
            width:70px;
            height: 30px;
            border-radius: 20px;
            right:10px;
            background-color: #fffbed;
            border:1px soild black;

        }
           /*장바구니 버튼*/
        #addToCartButton {
            position: relative;
            width:70px;
            height: 30px;
            left:220px;
            top:-30px;
            border-radius: 20px;
            background-color: #fffbed;
            border: 1px solid #ff9946;
        }
        /*마이너스 버튼*/
        #decreaseButton{
            position: relative;
            width:20px;
            height: 20px;
            border-radius: 20px;
            background-color: #fffbed;
          
        }
           /*플러스 버튼*/
        #increaseButton{
            position: relative;
            width:20px;
            height: 20px;
            border-radius: 20px;
            background-color: #fffbed;
        }


    </style>
</head>
<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>

    <div class="box">
        <div class="book-image">
            <img src="C:\Users\user\Desktop\bookcover.jpg" alt="책 이미지">
        </div>
        <div class="book-details">
            <p>도서명</p>
            <p>9,999원</p>
            <p>저자</p>
            <div>수량</div>
            <button id="decreaseButton" style=" border:1px soild #ff9946;">-</button>
            <span id="quantityCounter">0</span>
            <button id="increaseButton"style=" border:1px soild #ff9946;">+</button>
            <p>총 상품 금액</p>
            <button type="button" id="btn-outline-dark">찜하기</button>
            <button type="button" id="btn-outline-dark">알림</button>
            <button type="button"id="btn-outline-dark">대여하기</button>
            <button id="addToCartButton">장바구니</button>
            <div class="modal">
                <div class="modal_content" title="클릭하면 창이 닫힙니다.">
                        <url="bnb/src/main/webapp/WEB-INF/views/orderer/shopping_cart_list.jsp"
                    상품을 장바구니에 담았습니다. <button class="cart_button">장바구니로 가기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="book-introduction">
        <h2>도서 소개</h2>
        <p>정말 웃겨서 숨을 쉴 수 없습니다. 맙소사, 이와 같은 드립은 어디서 오는 것입니까? 혹여 가보로 내려옵니까? 나의 공중제비를 멈추게 하십시오! 당신과 같은 재미있는 분들 덕분에    
            정말 웃겨서 숨을 쉴 수 없습니다. 당신과 같은 재미있는 분들 덕분에 인생이 굉장히 재미있습니다. 그러한 드립은 비밀히 보관하지 말고, 재빨리 내용물을 꺼내 주십시오.    
            세상에 이런 드립이 다 있겠습니까?...</p>
        </div>
    </div>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>

    <script>
        const addToCartButton = document.querySelector('#addToCartButton');
        addToCartButton.addEventListener('click', function () {
            // Show the modal
            const modal = document.querySelector('.modal');
            modal.style.display = 'block';
        });

        // Add an event listener to close the modal when clicking outside of it
        const modal = document.querySelector('.modal');
        modal.addEventListener('click', function (event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
        const decreaseButton = document.querySelector('#decreaseButton');
        const increaseButton = document.querySelector('#increaseButton');
        const quantityCounter = document.querySelector('#quantityCounter');

        let totalQuantity = 0;

        function adjustQuantity(change) {
            totalQuantity += change;
            if (totalQuantity < 0) {
                totalQuantity = 0; 
            }
            quantityCounter.textContent = totalQuantity;
        }

        function manageQuantity(event) {
            const buttonClicked = event.target.id;

            if (buttonClicked === 'decreaseButton') {
                adjustQuantity(-1);
            } else if (buttonClicked === 'increaseButton') {
                adjustQuantity(1);
            }
        }

        decreaseButton.addEventListener('click', manageQuantity);
        increaseButton.addEventListener('click', manageQuantity);
    </script>

</body>
</html>