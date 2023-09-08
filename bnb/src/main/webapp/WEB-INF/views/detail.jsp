<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        .box {
            border: solid 1px black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 480px;
            height: 300px;
            margin: 70px auto;
            padding: 25px;
            font-weight: bold;
        }

        .btn {
            background: #ffff;
            border: solid 1px black;
            margin: 3px;
            padding: 5px 15px;
            font-size: 10px;
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
    </style>
</head>
<body>
    <div class="box">
        <div class="bookcover">
            <img src="C:\Users\user\Desktop\bookcover.jpg" alt="책 커버">
        </div>
        <div class="book-details">
            <p>책 제목</p>
            <p>책 가격</p>
            <p>책 저자</p>
            <div>수량</div>
            <button id="decreaseButton">-</button>
            <span id="quantityCounter">0</span>
            <button id="increaseButton">+</button>
            <p>총 상품 금액</p>
            <button type="button" class="btn btn-outline-dark">❤️</button>
            <button type="button" class="btn btn-outline-dark">알림</button>
            <button type="button" class="btn btn-outline-warning">대여하기</button>
            <button type="button" class="btn btn-outline-dark">장바구니</button>
        </div>
    </div>

    <script>
        const decreaseButton = document.querySelector('#decreaseButton');
        const increaseButton = document.querySelector('#increaseButton');
        const quantityCounter = document.querySelector('#quantityCounter');
        
        let totalQuantity = 0;

        function adjustQuantity(change) {
            totalQuantity += change;
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
