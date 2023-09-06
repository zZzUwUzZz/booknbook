<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
</head>

<body>
    <header>
        <jsp:include page="../../tiles/header.jsp"></jsp:include>
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
            <script>
                const payButton = document.getElementById("pay-button");
                payButton.addEventListener('click', () => {
                    document.getElementById("pay-button").onclick = function () {
                        alert("결제되셨습니다.");
                    };
                });
            </script>
        </div>
    </main>
    
    <footer>
        <jsp:include page="../../tiles/footer.jsp"></jsp:include>
    </footer>
</body>

</html>