<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/seller.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
</head>

<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <section>
        <div class="wrap">
            <div class="content">
                <div class="side-menu">
                    <div class="bsname">
                        <h1><a href="/seller/main">서점 이름</a></h1>
                    </div>
                    <div class="menu-title">
                        MENU
                    </div>
                    <div class="menu">
                        <div class="menu-group">
                            <div class="bigmenu"><span>서점 정보</span></div>
                            <div class="submenu"><a href="/seller/infoupdate">서점 정보 관리</a></div>
                            <div class="submenu"><a href="/seller/csmember">고객 정보 보기</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>도서 관리</span></div>
                            <div class="submenu"><a href="/seller/book/list">등록된 도서 리스트</a></div>
                            <div class="submenu"><a href="/seller/book/add">도서 추가 등록</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>대여 관리</span></div>
                            <div class="submenu"><a href="/seller/rent/reserve">예약 신청 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/curr">대여 내역</a></div>
                            <div class="submenu"><a href="/seller/rent/return">반납 내역</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>판매 관리</span></div>
                            <div class="submenu"><a href="/seller/sell/history">판매 내역</a></div>
                            <div class="submenu"><a href="/seller/sell/cancel">주문 취소 관리</a></div>
                            <div class="submenu"><a href="/seller/return/manage">반품/교환 관리</a></div>
                        </div>
                        <div class="menu-group">
                            <div class="bigmenu"><span>정산</span></div>
                            <div class="submenu"><a href="/seller/calculate">정산 내역</a></div>
                        </div>
                    </div>
                </div>
                <div class="contain-2">
                    <div class="box-2">
                        <h1>서점 정보 관리</h1>
                        <table class="info-list">
                            <tr>
                                <td>서점명</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>사업자 등록 번호</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>아이디</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>비밀번호 확인</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>서점 소개</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>서점 사진 업로드</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>배송비 설정</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>연체료 설정</td>
                                <td><input type="text"></td>
                            </tr>
                        </table>
                        <div class="gap"></div>
                        <table class="info-list">
                            <tr>
                                <td><input type="button" value="수정"></td>
                                <td><input type="button" value="취소"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>

</html>