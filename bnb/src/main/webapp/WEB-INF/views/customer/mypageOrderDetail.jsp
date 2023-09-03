<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

    <style>
        h3 {
            margin: 10px 0 5px;
        }
    </style>

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
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">
            
            <div>
                <h2 class="pagename">MY ORDER DETAILS</h2>
                <!-- <h5>주문번호 ${oInfo.o_id}</h5>
                <h5>주문일자 ${oInfo.o_date}</h5> -->
            </div>

            <div>
                <h3 class="tablename">구매</h3>
                <div class="table_lists">
                <table>
                    <tr>
                        <th>서점명</th>
                        <th>구매품목</th>
                        <th>판매단가</th>
                        <th>수량</th>
                        <th>주문상태</th>
                        <th>배송상태</th>
                        <th>배송완료일</th>
                    </tr>

                    <c:if test="${empty oPList}">
                        <tr>
                            <td colspan="7">구매항목이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty oPList}">
                        <c:forEach var="oPItem" items="${oPList}">
                            <tr>
                                <td>${oPItem.s_storename}</td>
                                <td>${oPItem.b_title}</td>
                                <td>${oPItem.b_price}</td>
                                <td>${oPItem.p_amount}</td>
                                <td>${oPItem.order_status}</td>
                                <td>${oPItem.delivery_status}</td>
                                <td>${oPItem.p_deliverydate}</td>
                            </tr>
                         </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

            <div>
                <h3 class="tablename">대여</h3>
                <div class="table_lists">
                <table>
                    <tr>
                        <th>서점명</th>
                        <th>구매품목</th>
                        <th>기본대여료</th>
                        <th>대여기간</th>
                        <th>주문상태</th>
                        <th>배송상태</th>
                        <th>배송완료일</th>
                    </tr>

                    <c:if test="${empty oRList}">
                        <tr>
                            <td colspan="7">대여항목이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty oRList}">
                        <c:forEach var="oRItem" items="${oRList}">
                            <tr>
                                <td>${oRItem.s_storename}</td>
                                <td>${oRItem.b_title}</td>
                                <td>${oRItem.b_rent}</td>
                                <td>${oRItem.r_rentalperiod}</td>
                                <td>${oRItem.order_status}</td>
                                <td>${oRItem.delivery_status}</td>
                                <td>${oRItem.r_deliverydate}</td>
                            </tr>
                         </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

            <div>
                <button onclick="location.href='/mypage/orderlist'">전체목록</button>
                <button onclick="location.href=''">주문취소</button>
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