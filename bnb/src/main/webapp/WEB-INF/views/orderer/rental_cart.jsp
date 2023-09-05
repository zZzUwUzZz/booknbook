<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대여 장바구니</title>
    <link rel="stylesheet" href="style/main_style.css">

</head>

<body>
    <header>
        <jsp:include page="../../tiles/header.jsp"></jsp:include>
        <jsp:include page="../../tiles/orderer/cart_topline.jsp"></jsp:include>
        <!-- 페이지 슬라이드  -->
        <div class="rental_page" id="final_rental_show"></div>
    </header>

    <main>
    </main>

    <footer>
        <jsp:isnclude page="../../tiles/footer.jsp"></jsp:isnclude>
    </footer>
</body>

</html>