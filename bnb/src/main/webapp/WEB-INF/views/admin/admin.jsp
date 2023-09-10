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
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/adminmain.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>ADMIN PAGE</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/admin" id="currpage">관리자페이지 홈</a></li>
                <hr>
                <li><a href="/admin/reportlist">독립서점 제보</a></li>
                <li><a href="/admin/sellerlist">서점회원 리스트</a></li>
                <li><a href="/admin/customerlist">일반회원 리스트</a></li>
            </ul>
        </div>

        <div class="board-area">
            
            <div>
                <h2 class="pagename">ADMIN PAGE</h2>
            </div>

            <div class="container-1">

                <div class="container-2">
    
                    <div class="container-3 card-main cards">
                        <p>카테고리관리</p>
                    </div>

                    <div class="container-3 card-button cards" onclick="location.href='/mypage/info'">
                        나의 회원정보
                    </div>

                </div>
    
                <div class="container-2">
    
                    <div class="container-3 card-top cards">

                        <h3>총 입점서점 수 : <a href="/admin/sellerlist">${num_of_seller}건</a></h3>
                        <h3>총 일반회원 수 : <a href="/admin/customerlist">${num_of_customer}건</a></h3>
                        <h3>총 주문 건수 : <a href="/mypage/rentallist">${num_of_order}건</a></h3>
                        <h3>총 구매항목 수 : <a href="/mypage/rentallist">${num_of_purchaseItem}건</a></h3>
                        <h3>총 대여항목 수 : <a href="/mypage/rentallist">${num_of_rentalItem}건</a></h3>
                        <h3>총 주문취소 건수 : <a href="/mypage/rentallist">${num_of_ordercancel}건</a></h3>

                    </div>
                    
                    <div class="container-3 card-bottom cards">

                        <h3>대여도서 반납 연체자 : <a href="/admin/rentallist">${num_of_latereturn}건</a></h3>
                        <table>
                            <tr>
                                <th>제목</th>
                                <th>서점</th>
                                <th>반납기한</th>
                                <th>대여상태</th>
                            </tr>

                            <c:if test="${empty curr_rList}">
                                <tr>
                                    <td colspan="4">대여 중인 도서가 없습니다.</td>
                                </tr>
                            </c:if>
                
                            <c:if test="${!empty curr_rList}">
                                <c:forEach var="rItem" items="${curr_rList}">
                                    <tr>
                                        <td>${rItem.b_title}</td>
                                        <td>${rItem.s_storename}</td>
                                        <td>${rItem.r_duedate}</td>
                                        <td>${rItem.rental_status}</td>
                                    </tr>
                                    </c:forEach>
                            </c:if>
                        </table>

                    </div>

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