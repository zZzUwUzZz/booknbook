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
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/list.css">
    <link rel="stylesheet" href="/css/customer/main.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>Document</title>

    <style>
        .container-mypage {
            height: auto !important;
        }

 
    </style>
</head>

<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist" id="currpage">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>




        <div class="board-area">

            <div class="odtext_01">
                <span class="pagename">MY ORDER LIST</span>
            </div>

            <div class="datebox">
                <div>
                    <form action="/mypage/orderlist">
                        <input type="date" id="startDate" name="startDate" required>
                        <label for="startDate">부터</label>
                        <input type="date" id="endDate" name="endDate" required>
                        <label for="endDate">까지</label>
                        <button type="submit">조회</button>
                    </form>
                </div>
            </div>

            <div class="odListBox">

                <c:if test="${empty oList}">

                    <div>주문내역이 없습니다.</div>
                </c:if>


                <c:if test="${!empty oList}">
                    <c:forEach var="oItem" items="${oList}">
                        <div class="odListContain">
                            <article class="odItemBox">

                                <div class="odTitle">
                                    <div class="odText">
                                        주문번호
                                    </div>
                                    <div onclick="location.href='/mypage/orderdetail/${oItem.o_id}'" class="td-linked">
                                        #${oItem.o_id}
                                    </div>
                                </div>

                                <div class="odTitle">
                                    <div class="odText">주문날짜</div>
                                    <fmt:formatDate value="${oItem.o_date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                                </div>

                                <div class="odItem">
                                    <c:choose>
                                        <c:when test="${oItem.book_sorts_minus_one eq 0}">
                                            ${oItem.first_title}
                                        </c:when>
                                        <c:otherwise>
                                            ${oItem.first_title} 외 ${oItem.book_sorts_minus_one}건
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="odTitle">
                                    <div class="odText">주문상태</div>
                                    ${oItem.order_status}
                                </div>


                                <div class="odTitle">
                                    <div class="odText">수령방법</div>
                                    ${oItem.o_delivery_sort}
                                </div>

                                <div class="odTitle">
                                    <div class="odDetail" onclick="location.href='/mypage/orderdetail/${oItem.o_id}'">
                                        상세보기</div>
                            </article>
                        </div>


                    </c:forEach>
                </c:if>
            </div>

            <div class="pagenation">
                <div class="pagebox">${pageHtml}</div>
            </div>

        </div>


    </div>



    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>