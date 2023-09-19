<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <jsp:include page="/WEB-INF/views/adminFile/seller.jsp"/>
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

                    <form action="/seller/book/add" method="POST" id="addForm">

                    <div class="box-2">
                        <h1>도서 추가 등록</h1>
                        <table class="info-list">
                            <tr>
                                <td>책 제목</td>
                                <td colspan="6"><input type="text" name="b_title" required></td>
                            </tr>
                            <tr>
                                <td>ISBN</td>
                                <td colspan="6"><input type="text" id="isbn" name="b_isbn" required></td>
                            </tr>
                            <tr>
                                <td colspan="7"><p id="isbn_format_check" class="red_msg" style="display: none">13자리의 숫자를 입력해주세요.</p></td>
                            </tr>
                            <tr>
                                <td colspan="7"><p id="isbn_check" class="red_msg" style="display: none">이미 등록된 도서입니다.</p></td>
                            </tr>
                            <tr>
                                <td>저자</td>
                                <td colspan="6"><input type="text" name="b_author" required></td>
                            </tr>
                            <tr>
                                <td>책 소개</td>
                                <td colspan="6"><input type="text" name="b_bookdesc" required></td>
                            </tr>
                            <tr>
                                <td>판매 여부</td>
                                <td>
                                    <label class="switch-button">
                                        <input type="checkbox" id="p_btn" name="b_forsale">
                                        <span class="onoff-switch"></span>
                                    </label>
                                </td>
                                <td>판매가</td>
                                <td><input type="text" class="num_p" name="b_price" disabled></td>
                                <td>판매 재고</td>
                                <td><input type="text" class="num_p" name="b_salestock" disabled></td>
                            </tr>
                            <tr>
                                <td colspan="7"><p id="num_p_format_check" class="red_msg" style="display: none">6자리 이하의 숫자를 입력해주세요.</p></td>
                            </tr>
                            <tr>
                                <td>대여 여부</td>
                                <td>
                                    <label class="switch-button">
                                        <input type="checkbox" id="r_btn" name="b_forrental">
                                        <span class="onoff-switch"></span>
                                    </label>
                                </td>
                                <td>대여료</td>
                                <td><input type="text" class="num_r" name="b_rent" disabled></td>
                                <td>대여 재고</td>
                                <td><input type="text" class="num_r" name="b_rentalstock" disabled></td>
                            </tr>
                            <tr>
                                <td colspan="7"><p id="num_r_format_check" class="red_msg" style="display: none">6자리 이하의 숫자를 입력해주세요.</p></td>
                            </tr>
                            <tr>
                                <td>중분류</td>
                                <td colspan="6">
                                    <div class="selectBox">
                                        <select class="select" id="categories_m" required>
                                            <option disabled selected>중분류</option>
                                            <c:forEach var="bookDto" items="${categories_m}">
                                                <option value="${bookDto.category_m_id}">${bookDto.category_m}</option>
                                            </c:forEach>
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
                                        <select class="select" id="categories_s" name="b_category_s_id" required>
                                            <option disabled selected>소분류</option>
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
                                <td><input type="submit" value="등록"></td>
                                <td><input type="button" value="취소"></td>
                            </tr>
                        </table>
                    </div>

                    </form>

                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/tiles/footer.jsp" %>


    <script>

    $(document).ready(function () {

        $('#categories_m').change(function () {

            let category_m_id = $(this).val();

            let data = {};
            data.category_m_id = category_m_id;
            
            $.ajax({
                
                method: 'post',
                url: '/seller/book/add/getsmallcategories',
                data: data,
                dataType: 'json' 
                
            }).done(function(result) {

                let optionHtml = '<option disabled selected>소분류</option>';

                for (let bookDto of result) {

                    optionHtml += '<option value="' + bookDto.category_s_id + '">' + bookDto.category_s + '</option>';
                }

                $('#categories_s').html(optionHtml);

            }).fail(function(err) {

                console.log(err)

            })

        })

        $('#isbn').focusout(function () {

            let isbn_format = /^\d{13}$/;    // 13자리의 숫자만 입력 가능

            let isbn = $(this).val();
            console.log(isbn);

            if (!isbn.match(isbn_format)) {
                $('#isbn_format_check').css({'color': 'red', 'font-size': '12px', 'display': 'block'})
            } else {
                $('#isbn_format_check').css({'display': 'none'})
            }

            // 이미 등록된 도서인지 체크
            let data = {};
            data.b_isbn = isbn;
            
            $.ajax({
                
                method: 'post',
                url: '/seller/book/add/isbncheck',
                data: data,
                dataType: 'json' 
                
            }).done(function(result) {

                if (result) {
                    $('#isbn_check').css({'color': 'red', 'font-size': '12px', 'display': 'block'})
                } else {
                    $('#isbn_check').css({'display': 'none'})
                }

            }).fail(function(err) {

                console.log(err)

            })

        })

        $('.num_p').focusout(function () {

            let num_p_format = /^\d{1,6}$/;    // 6자리 이하의 숫자만 입력 가능

            let num_p = $(this).val();
            console.log(num_p);

            if (!num_p.match(num_p_format)) {
                $('#num_p_format_check').css({'color': 'red', 'font-size': '12px', 'display': 'block'})
            } else {
                $('#num_p_format_check').css({'display': 'none'})
            }

        })

        $('.num_r').focusout(function () {

            let num_r_format = /^\d{1,6}$/;    // 6자리 이하의 숫자만 입력 가능

            let num_r = $(this).val()
            if (!num_r.match(num_r_format)) {
                $('#num_r_format_check').css({'color': 'red', 'font-size': '12px', 'display': 'block'})
            } else {
                $('#num_r_format_check').css({'display': 'none'})
            }

        })

        $('#p_btn').change(function () {

            let checked = $(this).prop('checked');

            if (checked) {
                $('.num_p').prop('disabled', false);
            } else {
                $('.num_p').prop('disabled', true);
                $('.num_p').val('');
                $('#num_p_format_check').css({'display': 'none'})
            }
        })

        $('#r_btn').change(function () {

            let checked = $(this).prop('checked');

            if(checked) {
                $('.num_r').prop('disabled', false);
            } else {
                $('.num_r').prop('disabled', true);
                $('.num_r').val('');
                $('#num_r_format_check').css({'display': 'none'})
            }
        })

        $('#addForm').submit(function(event) {

            event.preventDefault();

            if ($('#isbn_format_check').css('display') == 'block' ||
                $('#isbn_check').css('display') == 'block' ||
                $('#num_p_format_check').css('display') == 'block' ||
                $('#num_r_format_check').css('display') == 'block') {
                    
                alert('입력하신 내용을 다시 확인해주세요');
                return false;
            }

            if ($('#categories_s option').text() == '소분류') {

                alert('카테고리를 선택해주세요.');
                return false;
            }

            console.log($('#categories_s').val());

            let conf = confirm('도서를 등록할까요?')
            
            if (conf == true) {
                this.submit();
            }
        })
    })        

    </script>

</body>

</html>