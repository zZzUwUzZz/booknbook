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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>
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
                        <h1>도서 추가 등록</h1>
                        <table class="info-list">
                            <tr>
                                <td>책 제목</td>
                                <td colspan="6"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>ISBN</td>
                                <td colspan="6"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>저자</td>
                                <td colspan="6"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>책 소개</td>
                                <td colspan="6"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>판매 여부</td>
                                <td>
                                    <label class="switch-button">
                                        <input type="checkbox">
                                        <span class="onoff-switch"></span>
                                    </label>
                                </td>
                                <td>판매가</td>
                                <td>1원</td>
                                <td>판매 재고</td>
                                <td>10권</td>
                            </tr>
                            <tr>
                                <td>대여 여부</td>
                                <td>
                                    <label class="switch-button">
                                        <input type="checkbox">
                                        <span class="onoff-switch"></span>
                                    </label>
                                </td>
                                <td>대여료</td>
                                <td>1원</td>
                                <td>대여 재고</td>
                                <td>10권</td>
                            </tr>
                            <tr>
                                <td>중분류</td>
                                <td colspan="6">
                                    <div class="selectBox">
                                        <select class="select">
                                            <option disabled selected>중분류</option>
                                            <option value="1">중</option>
                                            <option value="2">분</option>
                                            <option value="3">류</option>
                                        </select>
                                        <span class="icoArrow"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                                          </svg></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>소분류</td>
                                <td colspan="6">
                                    <div class="selectBox">
                                        <select class="select">
                                            <option disabled selected>소분류</option>
                                            <option value="1">소</option>
                                            <option value="2">분</option>
                                            <option value="3">류</option>
                                        </select>
                                        <span class="icoArrow"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                                          </svg></span>                                    
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="gap"></div>
                        <table class="info-list">
                            <tr>
                                <td><input type="button" value="등록"></td>
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