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
                        <th></th>
                    </tr>

                    <c:if test="${empty reList}">
                        <tr>
                            <td colspan="7">교환/반품내역이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty reList}">
                        <c:forEach var="reItem" items="${reList}">
                            <tr>
                                <td>${reItem.re_sort}</td>
                                <td><fmt:formatDate value="${reItem.re_reqdate}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
                                <td onclick="location.href='/mypage/purchaselist'" class="td-linked">${reItem.re_o_id}</td>
                                <td>${reItem.s_storename}</td>
                                <td>${reItem.b_title}</td>
                                <td>${reItem.re_amount}</td>
                                <td>${reItem.process_status}</td>
                                <c:choose>
                                    <c:when test="${reItem.re_process_status_id eq 1}">
                                        <td><button onclick="cancel('${reItem.re_id}')" class="cancel_btn">요청취소</button></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td width="80px"></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                            <c:if test="${!empty reItem.re_rejection_reason}">
                                <tr>
                                    <td class="rej_reason" colspan="7">${reItem.re_rejection_reason}</td>
                                </tr>
                            </c:if>
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


    <script>

    function cancel(re_id) {

        let conf = confirm('교환/반품 신청을 취소할까요?');
        
        if (conf == true) {
            location.href="/mypage/refundexchangecancel/" + re_id;
        }
        
    }

    </script>

</body>

</html>