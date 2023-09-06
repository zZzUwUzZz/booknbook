<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="checkout.jsp">
    <title>주문 페이지</title>
    <!-- CSS 및 JavaScript 파일 링크 -->
</head>
<body>
    <h1>주문 페이지</h1>
    
    <!-- 주문 상품 목록 -->
    <h2>일반 상품</h2>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>선택</th>
            </tr>
        </thead>
        <tbody>
            <!-- 상품 목록을 동적으로 생성 -->
            <c:forEach items="${orderDto.orderItems}" var="item">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td><input type="checkbox" name="selectedItems" value="${item.productId}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 주문하기 버튼 -->
    <form action="/order/placeOrder" method="post">
        <input type="submit" value="주문하기">
    </form>

    <!-- 대여 상품 목록 (동일한 방식으로 생성) -->
    <h2>대여 상품</h2>
    <!-- 대여 상품 목록을 동적으로 생성 -->
    
    <!-- 배송지 정보 수정 -->
    <h2>배송지 정보 수정</h2>
    <form action="/order/updateShippingAddress" method="post">
        <!-- 배송지 정보 입력 폼 -->
    </form>

    <!-- 기타 주문 정보 입력 (결제 정보 입력, 주문 메모 등) -->

    <!-- 결제하기 버튼 -->
    <form action="/order/placeOrder" method="post">
        <input type="submit" value="결제하기">
    </form>
    
    <!-- 기타 페이지 요소 (로고, 로그인/회원가입 링크, 메뉴 등) -->
    <footer>
        <jsp:include page="../../tiles/footer.jsp"></jsp:include>
    </footer>
</body>
</html>