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
            border: solid 1px #ebebeb;
        }
        .opt_ipt {
            display: block;
            width: 36px;
        }
        .opt_num input {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 23px;
            line-height: 23px;
            font-size: 12px;
            color: #666;
            text-align: center;
            border: none;
            vertical-align: top;
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
                                    <td><input type="hidden" name="p_id" value="${pItem.p_id}"></td>
                                    <td>${pItem.s_storename}</td>
                                    <td>${pItem.b_title}</td>

                                    <c:choose>
                                        <c:when test="${!empty pItem.re_amount}">
                                            <td class="amount">${pItem.p_amount - pItem.re_amount}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="amount">${pItem.p_amount}</td>
                                        </c:otherwise>
                                    </c:choose>

                                    <td>
                                        <span class="opt_num">
                                            <span class="opt_ipt">
                                                <input type="text" name="qty" maxlength="1" value="1" onblur="fn_qty_check()">
                                            </span>
                                            <a href="javascript:fn_qty_change(false)" class="minus"></a>
                                            <a href="javascript:fn_qty_change(true)" class="plus"></a>
                                        </span>
                                    </td>
                                </tr>
                             </c:forEach>
                        </c:if>
                    </table>
        
                </div>
        
                <div class="container-1">
                    <button onclick="location.href='/mypage/purchaselist'">돌아가기</button>
                    <button onclick="">교환요청</button>
                    <button onclick="">반품요청</button>
                </div>
            
            </div>

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    function fn_qty_check() {

        let qty = $('#qty').val
        let qty_format = /^[0-9]+$/

        if (!qty.match(qty_format)) {
            alert('숫자를 입력해주세요.')
            $('#qty').val(1)
        }

    }

    function fn_qty_change(up) {

        let qty = $('#qty').val
        let max_qty = $('#max_qty').val

        if (up) {
            if (qty == max_qty) {
                alert('신청가능수량 초과입니다.')
            } else {
                $('#qty').val(qty+1)
            }
        } else {
            if (qty == 1) {
                alert('최소 신청수량은 1권입니다.')
            } else {
                $('#qty').val(qty-1)
            }
        }

    }


    </script>

</body>

</html>