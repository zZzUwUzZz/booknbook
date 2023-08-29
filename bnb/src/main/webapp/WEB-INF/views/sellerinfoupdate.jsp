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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/seller.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>
</head>

<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <section>
        <div id="wrapper">
            <div class="side-menu">
                <div class="bsname">
                    <h1><a href="#">서점 이름</a></h1>
                </div>
                <ul class="menu">
                    <li class="menu-item">
                        <a class="bigmenu" href="#">정보 수정　　</a>
                    </li>
                    <li class="menu-item">
                        <a class="bigmenu" href="#">
                            도서 관리　
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-chevron-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="submenu">
                            <ul>
                                <li><a href="#">등록된 도서　　</a></li>
                                <li><a href="#">도서 추가 등록　　</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu-item">
                        <a class="bigmenu" href="#">
                            대여 관리　
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-chevron-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="submenu">
                            <ul>
                                <li><a href="#">예약 신청 관리</a></li>
                                <li><a href="#">대여 현황</a></li>
                                <li><a href="#">반납 현황</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu-item">
                        <a class="bigmenu" href="#">
                            판매 관리　
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-chevron-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="submenu">
                            <ul>
                                <li><a href="#">판매 내역</a></li>
                                <li><a href="#">주문 취소 관리</a></li>
                                <li><a href="#">반품/교환 관리</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu-item">
                        <a class="bigmenu" href="#">정산 내역　　</a>
                    </li>
                    <li class="menu-item">
                        <a class="bigmenu" href="#">고객 관리　　</a>
                    </li>
                </ul>
            </div>
            <div class="contain-1">
                <div class="box-1">
                    <h1>서점 정보 수정</h1>
                    <table class="info-list">
                        <tr>
                            <td>서점 이름</td>
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
                            <td>소개</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>서점 사진</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>계좌 정보</td>
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
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>
</body>

</html>