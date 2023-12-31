<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYMENT</title>

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
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/order.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="wrapper">

        <h1>PAYMENT</h1>

        <form action="/payment/res" method="POST" id="payForm">

            <div class="cart_area">

                <div class="cart_subject">
                    <h3>대여주문</h3>
                </div>

                <div class="cart_items">
                    <table>

                        <tr class="head_row">
                            <th width="160px">서점명</th>
                            <th>도서명</th>
                            <th width="105px">기본대여료</th>
                            <th width="70px">수량</th>
                            <th width="130px">금액</th>
                        </tr>

                        <tr>
                            <input type="hidden" name="rr_id" value="${rrItem.rr_id}">
                            <td>${rrItem.s_storename}</td>
                            <td title="${rrItem.b_title}"><span>${rrItem.b_title}</span></td>
                            <td><fmt:formatNumber value="${rrItem.b_rent}" type="number" pattern="#,##0"/>원</td>
                            <td>1</td>
                            <td id="total_b_rent"><fmt:formatNumber value="${rrItem.b_rent}" type="number" pattern="#,##0"/>원</td>
                        </tr>
                    
                        <!-- <c:forEach items="${rrList}" var="rrItem">
                            <tr>
                                <input type="hidden" name="rr_idList" value="${rrItem.rr_id}">
                                <td>${rrItem.s_storename}</td>
                                <td title="${rrItem.b_title}"><span>${rrItem.b_title}</span></td>
                                <td><fmt:formatNumber value="${rrItem.b_rent}" type="number" pattern="#,##0"/>원</td>
                                <td>1</td>
                                <td><fmt:formatNumber value="${rrItem.b_rent * rrItem.r_rentalperiod / 7}" type="number" pattern="#,##0"/>원</td>
                            </tr>
                        </c:forEach> -->

                    </table> 
                </div> 
            </div>

            <div class="orderinfo_area">
                <div>
                    <input type="radio" id="parcel" name="o_delivery_sort" value="택배" checked/><label for="parcel">택배</label>
                    <input type="radio" id="visit" name="o_delivery_sort" value="방문수령"/><label for="visit">방문수령</label>
                    <div id="delivery_info">
                        <span class="label">배송지주소</span><input type="text" name="o_recip_addr" id="" value="${customer.m_addr}"><br>
                        <span class="label">수령인</span><input type="text" name="o_recip_name" id="" value="${customer.c_name}"><br>
                        <span class="label">수령인연락처</span><input type="text" name="o_recip_phone" id="" value="${customer.m_phone}">
                    </div>
                </div>
                <div id="payment_info">
                    <hr>
                    <div>
                        <span class="label">대여료</span>|&nbsp;&nbsp;
                        <input type="hidden" name="o_total_pricerent" value="${rrItem.b_rent}">
                        <span class="money"><fmt:formatNumber value="${rrItem.b_rent}" type="number" pattern="#,##0"/>원 |</span>
                    </div>
                    <div>
                        <span class="label">배송비</span>|&nbsp;&nbsp;
                        <input type="hidden" name="o_total_deliveryfee" value="${rrItem.s_deliveryfee}">
                        <span class="money fee_y">
                            <fmt:formatNumber value="${rrItem.s_deliveryfee}" type="number" pattern="#,##0"/>원 |
                        </span>
                        <span class="money fee_n" style="display: none">
                            <fmt:formatNumber value="0" type="number" pattern="#,##0"/>원 |
                        </span>
                    </div>
                    <hr>
                    <div>
                        <span class="label">주문금액</span>|&nbsp;&nbsp;
                        <input type="hidden" name="o_total_payment" value="${rrItem.b_rent + rrItem.s_deliveryfee}">
                        <span class="money fee_y">
                            <fmt:formatNumber value="${rrItem.b_rent + rrItem.s_deliveryfee}" type="number" pattern="#,##0"/>원 |
                        </span>
                        <span class="money fee_n" style="display: none">
                            <fmt:formatNumber value="${rrItem.b_rent}" type="number" pattern="#,##0"/>원 |
                        </span>
                    </div>
                    <hr>
                </div>
    
            </div>
    
            <div class="button_area">
                <button type="button" onclick="location.href='/mypage/rentalreservationlist'">돌아가기</button>
                <button type="submit" id="pay">결제하기</button>
            </div>
    
        </form>

    </div>


	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

        // 배송방법 선택에 따른 배송지정보 표시/감추기
        $(document).ready(function () {
        
            $("#parcel").click(function () {

                $('#delivery_info').show();
                $('.fee_y').show();
                $('.fee_n').hide();
            });

            $("#visit").click(function () {

                $('#delivery_info').hide();
                $('.fee_n').show();
                $('.fee_y').hide();
            });

            $('#payForm').submit(function(event) {

                event.preventDefault();

                let conf = confirm('주문을 계속할까요?')

                if (conf == true) {

                    alert('결제를 진행합니다...')

                    this.submit();
                }

            })

        })

    </script>

</body>
</html>