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
            width: 470px;
            height: 270px;
            margin: 70px auto;
            padding: 25px;
            font-weight: bold;
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

        .book-introduction {
            border: solid 1px black;
            width: 470px;
            margin: 10px auto;
            padding: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="box">
        <div class="book-image">
            <img src="C:\Users\user\Desktop\bookcover.jpg" alt="책 이미지">
        </div>
        <div class="book-details">
            <p>도서명</p>
            <p>9,999원</p>
            <p>저자</p>
            <div>수량</div>
            <button id="decreaseButton">-</button>
            <span id="quantityCounter">0</span>
            <button id="increaseButton">+</button>
            <p>총 상품 금액</p>
            <button type="button" class="btn btn-outline-dark">찜하기</button>
            <button type="button" class="btn btn-outline-dark">알림</button>
            <button type="button" class="btn btn-outline-warning">대여하기</button>
            <button type="button" class="btn btn-outline-dark">장바구니</button>
        </div>
    </div>
    <div class="book-introduction">
        <h2>도서 소개</h2>
        <p> 이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은
            당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서...</p> 
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