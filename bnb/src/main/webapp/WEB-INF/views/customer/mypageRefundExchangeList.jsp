<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

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
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/list.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist" id="currpage">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div>
                <h2 class="pagename">EXCHANGE/RETURN LIST</h2>
            </div>

            <div>
                <div class="tablebox">
                <table>
                    <tr class="headrow">
                        <th>구분</th>
                        <th>신청일자</th>
                        <th>주문번호</th>
                        <th>서점명</th>
                        <th>신청품목</th>
                        <th>금액/수량</th>
                        <th>처리상태</th>
                    </tr>

                    <tr>
                        <td>교환</td>
                        <td>2023-08-29</td>
                        <td>12345</td>
                        <td>효진이네서점</td>
                        <td>누가 내 머리에 똥 쌌어</td>
                        <td>10,000/1</td>
                        <td>교환불가</td>  <!-- 교환불가/반품불가인 경우 클릭활성화 및 사유확인가능해야함-->
                    </tr>

                    <c:if test="${empty reExList}">
                        <tr>
                            <td colspan="7">교환/반품내역이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty reExList}">
                        <c:forEach var="reExItem" items="${reExList}">
                            <tr>
                                <td>${reExItem.re_sort}</td>
                                <td>${reExItem.re_reqdate}</td>
                                <td>${reExItem.re_o_id}</td>
                                <td>${reExItem.s_storename}</td>
                                <td>${reExItem.b_title}</td>
                                <td>${reExItem.total_price} ${reExItem.re_amount}</td>
                                <td>${reExItem.process_status}</td>
                            </tr>
                         </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

        </div>

        <div class="button-area">

            <div class="buttons"></div>
            <div class="buttons"></div>

        </div>

    </div>



    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>