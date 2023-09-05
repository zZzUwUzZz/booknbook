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
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>

        .opt_num {
            position: relative;
            display: block;
            border: solid 1px #fffbed;
        }
        .opt_ipt {
            display: block;
            width: 36px;
        }
        .opt_num input {
            width: 100%;
            height: 23px;
            line-height: 23px;
            font-size: 12px;
            color: #4c4240;
            text-align: center;
            border: none;

        }
        h4 {
            margin: 5px;
        }

    </style>

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

        <div class="board-area">

            <div>
                <h2 class="pagename">교환/반품 신청</h2>
            </div>

            <div class="container-0">
            <form action="/mypage/refundexchange" method="POST">
                <div class="container-1">
        
                    <table>
                        <tr>
                            <th></th>
                            <th>서점명</th>
                            <th>도서명</th>
                            <th>신청가능 수량</th>
                            <th>신청할 수량</th>
                        </tr>

                        <c:if test="${!empty pList_re}">
                            <c:forEach var="pItem" items="${pList_re}">
                                <tr>
                                    <td><input type="hidden" name="p_idList" value="${pItem.p_id}"></td>
                                    <td>${pItem.s_storename}</td>
                                    <td>${pItem.b_title}</td>
                                    <td id="max_q_${pItem.p_id}" value="${pItem.p_amount}">${pItem.p_amount}</td>

                                    <!-- <c:choose>
                                        <c:when test="${!empty pItem.re_amount}">
                                            <td class="max_q_${pItem.p_id}" value="${pItem.p_amount - pItem.re_amount}">
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="max_q_${pItem.p_id}" value="${pItem.p_amount}">
                                            </td>
                                        </c:otherwise>
                                    </c:choose> -->

                                    <td>
                                        <span class="opt_num">
                                            <span class="opt_ipt">
                                                <input type="text" id="q_${pItem.p_id}" class="inputbox" name="re_amountList" maxlength="1" value="1">
                                            </span>
                                            <span class="plus" data-q-id="q_${pItem.p_id}" data-max-q-id="max_q_${pItem.p_id}">+</span>
                                            <span class="minus" data-q-id="q_${pItem.p_id}" data-max-q-id="max_q_${pItem.p_id}">-</span>
                                        </span>
                                    </td>
                                </tr>
                             </c:forEach>
                        </c:if>
                    </table>
        
                </div>

                <div>
                    신청사유를 선택하세요.
                    <h4>단순변심</h4>
                    <label>
                        <input type="radio" name="re_reason" value="상품이 마음에 들지 않음">
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
        
                <div class="container-1">
                    <button><a href="<%=request.getContextPath()%>/mypage/purchaselist">돌아가기</a></button>
                    <input type="hidden" id="re_sort" name="re_sort" value="교환">
                    <button onclick="request_re('교환')" id="exchange-btn">교환신청</button>
                    <button onclick="request_re('반품')" id="refund-btn">반품신청</button>
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
                // 데이터 속성을 사용하여 연결된 입력 폼의 ID 가져오기
        let q_id = $(this).data('q-id')
        console.log(q_id)
        let max_q_id = $(this).data('max-q-id')
        console.log(max_q_id)
        
        let q = $('#'+q_id).val()
        console.log(q)
        let max_q = $('#'+max_q_id).val()
        console.log(max_q)


        // if (q === max_q) {
        //     alert('신청가능수량 초과입니다.');
        // } else {
        //     $('#'+q_id).val(q+1);
        // }

    });

    // $('.plus').on("click", function () {

    //     let qty = $(this).parent().children('span').children('input').val()
    //     console.log(qty)
    //     let max_qty = $(this).parent().parent().parent().children('.max_qty').val()
    //     console.log(max_qty)

    // })

    // $('.minus').on("click", function () {

    //     let qty = $(this).parent().children('span').children('input').val()
    //     console.log(qty)

    // })

    // function fn_qty_change(plus, p_item) {

    //     let qty = $('"#qty_'+pItem.p_id+'"').val()
    //     console.log(qty)
    //     let max_qty = $('.max_qty').val()

    //     if (plus) {
    //         if (qty == max_qty) {
    //             alert('신청가능수량 초과입니다.')
    //         } else {
    //             $(this).val(qty+1)
    //         }
    //     } else {
    //         if (qty == 1) {
    //             alert('최소 신청수량은 1권입니다.')
    //         } else {
    //             $(this).val(qty-1)
    //         }
    //     }

    // }

    function request_re(re_sort) {
    
        let conf = confirm(re_sort+'신청을 하시겠습니까?');

        if (conf == true) {
            
            if (re_sort == '반품') {
                $('#re_sort').val('반품');
            }
            location.href = '/mypage/refundexchange';
        }
        
    }


    </script>

</body>

</html>