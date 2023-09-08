<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문/결제 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
</head>
<!-- 주문/결제 페이지에서는 장바구니에서 일반/대여 장바구니에 담겨있는 상품
두 장바구니에서 상품을 선택했을 때는 payment페이지에서 둘 다 나타나도록
둘 중 하나면 그 부분만 나타나도록 -->


<body>
        <jsp:include page="../../tiles/header.jsp"></jsp:include>

<!-- 상단 부분 -->
    
<!-- end상단 부분 -->

<!-- 메인 부분 -->
<body>
    <div class="cart-tit" id="cart-name">
    <h2>주문/결제 페이지</h2>
    </div>
    
    <!-- 배송지 변경 -->
    <h2>배송지 변경</h2>
    <form action="updateShippingAddress.jsp" method="post">

        <label for="name">수령인:</label>
        <input type="text" id="name" name="name" value="${userInfo.name}" required><br>
        
        <label for="address">배송주소:</label>
        <input type="text" id="address" name="address" value="${userInfo.address}" required><br>
        
        <label for="streetAddress">수령인 연락처:</label>
        <input type="text" id="streetAddress" name="streetAddress" value="${userInfo.streetAddress}" required><br>
        
        <input type="submit" value="배송지 변경">

    </form>
    
    <!-- 결제 정보 -->
    <h2>결제 정보</h2>
    <p>배송비: ${shippingFee}원</p>
    <p>총 결제금액: ${totalAmount}원</p>
    
    <!-- 결제 방법 선택 -->
    <h2>결제 방법 선택</h2>
    <form action="payment.jsp" method="post">
        <input type="radio" id="bankTransfer" name="paymentMethod" value="bankTransfer">
        <label for="bankTransfer">계좌이체</label><br>
        
        <input type="radio" id="mobilePayment" name="paymentMethod" value="mobilePayment">
        <label for="mobilePayment">휴대폰 결제</label><br>
        
        <input type="radio" id="creditCard" name="paymentMethod" value="creditCard">
        <label for="creditCard">신용/체크카드</label><br>
        
        <input type="radio" id="virtualAccount" name="paymentMethod" value="virtualAccount">
        <label for="virtualAccount">무통장입금(가상계좌)</label><br>
        
        <button type="submit">결제</button>
    </form>
        <div class="cart-tit" id="cart-name">
            <p>장바구니</p>
        </div>
        <!-- 상품 정보 영역 -->
       <div id="payment-method"></div>
       <div id="agreement"></div>
    </header>

    <main>
        <script>
            const specific = "cho_bookstore"     //서점을 특정하는 키 
            const customerKey = "cho_customer"  //결제 고객을 특정하는 키 
            const amout = "price"          //결제 금액
            
            //결제 페이지는 로그아웃하면 사라진다.
            //회원 결제 초기화를 시켜줘야 한다.

            //
            const paymentWidget = PaymentWidget(specific, customerKey) // 회원 결제 초기화
            // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제 초기화
            paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount)
  
            // 약관부분
            const paymentAgreement = paymentWidget.renderAgreement('#agreement')
        </script>

        <div class="pay" id="go_pay">
            <button type="button" class="choice">결제</button>
        </div>
        <script>
            const payButton = document.getElementById("pay-button");
            payButton.addEventListener('click', () => {
                document.getElementById("pay-button").onclick = function () {
                    alert("결제되셨습니다.");
                };
            });
        </script>

    <!-- end메인 부분 -->

    <!-- 하단 부분 -->
        <jsp:include page="../../tiles/footer.jsp"></jsp:include>
        <!-- end하단 부분 -->
</body>

</html>