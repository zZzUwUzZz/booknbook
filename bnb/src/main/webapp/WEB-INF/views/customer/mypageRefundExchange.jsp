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

        <div class="board-area" id="board-area-flexible">

            <div>
                <h2 class="pagename">교환/반품 신청</h2>
            </div>

            <div class="formbox" id="formbox-refexch">
            <form id="refExchForm" action="/mypage/refundexchange" method="POST">
                <div class="tablebox refexch">
        
                    <table>
                        <tr>
                            <th class="headrow">서점명</th>
                            <th class="headrow"><span>도서명</span></th>
                            <th class="headrow" width="120px">신청가능 수량</th>
                            <th class="headrow" width="120px">신청할 수량</th>
                        </tr>

                        <c:if test="${!empty pList_re}">
                            <c:forEach var="pItem" items="${pList_re}">
                                <tr>
                                    <input type="hidden" name="p_idList" value="${pItem.p_id}">
                                    <td>${pItem.s_storename}</td>
                                    <td>${pItem.b_title}</td>

                                    <c:choose>
                                        <c:when test="${!empty pItem.re_amount}">
                                            <td>
                                                ${pItem.p_amount - pItem.re_amount}
                                                <input type="hidden" id="max_q_${pItem.p_id}" value="${pItem.p_amount - pItem.re_amount}">
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                                ${pItem.p_amount}
                                                <input type="hidden" id="max_q_${pItem.p_id}" value="${pItem.p_amount}">
                                            </td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td>
                                        <div class="counterbox">
                                            <input type="text" id="q_${pItem.p_id}" class="inputbox" name="re_amountList" maxlength="1" value="1">
                                            <div class="minus" data-q-id="q_${pItem.p_id}" data-max-q-id="max_q_${pItem.p_id}">−</div>
                                            <div class="plus" data-q-id="q_${pItem.p_id}" data-max-q-id="max_q_${pItem.p_id}">+</div>
                                        </div>
                                    </td>
                                </tr>
                             </c:forEach>
                        </c:if>
                    </table>
        
                </div>

                <div class="reasonbox refexch">

                    <div id="imgbox-refexch">
                        <img src="https://w0.peakpx.com/wallpaper/30/166/HD-wallpaper-vintage-teal-typewriter-beside-book.jpg"/>
                    </div>

                    <div>
                        (신청사유를 선택하세요.)
                        <h4>단순변심</h4>
                        <label>
                            <input type="radio" name="re_reason" value="상품이 마음에 들지 않음" checked="true">
                            상품이 마음에 들지 않음
                        </label><br>
                        <label>
                            <input type="radio" name="re_reason" value="더 저렴한 상품을 발견함">
                            더 저렴한 상품을 발견함
                        </label><br>
                        <h4>배송문제</h4>
                        <label>
                            <input type="radio" name="re_reason" value="잘못된 상품이 배송됨">
                            잘못된 상품이 배송됨
                        </label><br>
                        <h4>상품문제</h4>
                        <label>
                            <input type="radio" name="re_reason" value="상품이 파손되어 배송됨">
                            상품이 파손되어 배송됨
                        </label><br>
                        <label>
                            <input type="radio" name="re_reason" value="상품에 결함/이상이 있음">
                            상품에 결함/이상이 있음
                        </label>
                    </div>

                </div>
        
                <div class="buttonbox refexch">
                    <button type="button" onclick="location.href='/mypage/purchaselist'">돌아가기</button>
                    <!-- <button><a href="<%=request.getContextPath()%>/mypage/purchaselist">돌아가기</a></button> -->
                    <div>
                        <input type="hidden" id="re_sort" name="re_sort" value="교환">
                        <button id="exch-btn">교환신청</button>
                        <button id="ref-btn">반품신청</button>
                    </div>
                </div>
            </form>
            </div>

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    $('.inputbox').on('focusout', function () {

        let qty = $(this).val()
        let qty_format = /^[0-9]$/

        if (!qty.match(qty_format)) {
            alert('숫자를 입력해주세요.')
            $(this).val(1)
        }

    })

    $('.plus').on('click', function () {
        
        // 버튼의 data-데이터명 속성에 input폼id 저장해놓은거 꺼내오기 (input태그의 id만 저장가능한듯.. 다른태그의 id 저장해놓고 value꺼내기 해보니 안 됨)
        let q_id = $(this).data('q-id')
        console.log(q_id)
        let max_q_id = $(this).data('max-q-id')
        console.log(max_q_id)
        
        let q = parseInt($('#'+q_id).val())
        console.log(q)
        let max_q = parseInt($('#'+max_q_id).val())
        console.log(max_q)


        if (q === max_q) {
            alert('신청가능수량 초과입니다.');
        } else {
            $('#'+q_id).val(q+1);
        }

    });

    $('.minus').on('click', function () {
        
        let q_id = $(this).data('q-id')
        console.log(q_id)
        let q = parseInt($('#'+q_id).val())
        console.log(q)


        if (q === 1) {
            alert('최소 신청수량은 1권입니다.');
        } else {
            $('#'+q_id).val(q-1);
        }

    });

    $(document).ready(function () {

        $('#refExchForm').submit(function (event) {
        
            event.preventDefault();

            let sort_of_req = $('#re_sort').val()
            let conf = confirm(sort_of_req+'신청을 하시겠습니까?')

            if (conf == true) {
                this.submit();
            }
        })

        $('#exch-btn').on('click', function() {
            $('#re_sort').val('교환');
        })

        $('#ref-btn').on('click', function() {
            $('#re_sort').val('반품');
        })

    })


    </script>

</body>

</html>