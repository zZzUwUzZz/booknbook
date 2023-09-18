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
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/adminFile/customer.jsp"/>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist" id="currpage">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">
            
            <form action="/mypage/refundexchange" method="GET">

            <div>
                <h2 class="pagename">PURCHASE LIST</h2>
            </div>

            <div>
                <div class="tablebox">
                <table>
                    <tr class="headrow">
                        <th>주문번호</th>
                        <th>주문일자</th>
                        <th>도서명</th>
                        <th>수량</th>
                        <th>서점명</th>
                        <th>배송상태</th>
                        <th colspan="2">교환/반품이력</th>
                        <th width="40px"></th>
                    </tr>

                    <c:if test="${empty pList}">
                        <tr>
                            <td colspan="9">구매내역이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty pList}">
                        <c:forEach var="pItem" items="${pList}">
                            <tr>
                                <td onclick="location.href='/mypage/orderdetail/${pItem.o_id}'" class="td-linked">${pItem.o_id}</td>
                                <td><fmt:formatDate value="${pItem.o_date}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
                                <td>${pItem.b_title}</td>
                                <td>${pItem.p_amount}</td>
                                <td>${pItem.s_storename}</td>
                                <td>${pItem.delivery_status}</td>
                                <td>${pItem.re_sort}</td>
                                <td>${pItem.re_amount}</td>

                                <c:choose>
                                    <c:when test="${(pItem.p_delivery_status_id eq 4 || pItem.p_delivery_status_id eq 6 || pItem.p_delivery_status_id eq 7)
                                                    && (empty pItem.re_amount)}">
                                        <td><input type="checkbox" name="p_idList" value="${pItem.p_id}"></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><input type="checkbox" name="p_idList" value="${pItem.p_id}" disabled></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                         </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

            <div class="btnbox">
                <button type="submit" id="submit" disabled>교환/반품신청</button>
            </div>

            </form>

        </div>

        <div class="button-area">

            <div class="buttons"></div>
            <div class="buttons"></div>

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    $(document).ready(()=>{

        $('input[type="checkbox"]').change(function() {

            if ($('input[type="checkbox"]:checked').length > 0) {
                $('#submit').prop('disabled', false);
            } else {
                $('#submit').prop('disabled', true);
            }

        });

    })        

    </script>


</body>

</html>