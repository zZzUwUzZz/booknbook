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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400&family=Noto+Sans+KR:wght@400&family=Space+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/cardboard.css">
  
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
                <h2 class="pagename">나의 회원정보</h2>
            </div>

            <div class="formbox">

                <div class="imgbox">
                    <img src="https://e1.pxfuel.com/desktop-wallpaper/701/393/desktop-wallpaper-motivational-about-writing-handwriting.jpg"/>
                </div>

                <div class="tablebox infotable">
        
                    <table>
                        <tr>
                            <td class="label">아이디</td> <td>${mDto.m_id}</td>
                        </tr>
                        <tr>
                            <td class="label">이름</td> <td>${mDto.c_name}</td>
                        </tr>
                        <tr>
                            <td class="label">주소</td> <td>${mDto.m_addr}</td>
                        </tr>
                        <tr>
                            <td class="label">휴대전화번호</td> <td>${mDto.m_phone}</td>
                        </tr>
                        <tr>
                            <td class="label">이메일</td> <td>${mDto.m_email}</td>
                        </tr>
                        <tr>
                            <td class="label">가입일자</td> <td><fmt:formatDate value="${mDto.m_joindate}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>
                        </tr>
                    </table>
        
                </div>
        
                <div class="buttonbox">
                    <button onclick="location.href='/mypage'">돌아가기</button>
                    <div>
                        <button onclick="location.href='/member/unregister'">회원탈퇴</button>
                        <button onclick="location.href='/member/resetPw'">비밀번호재설정</button>
                        <button onclick="location.href='/mypage/updateinfo'">회원정보수정</button>
                    </div>
                </div>
            
            </div>

        </div>

    </div>



    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>