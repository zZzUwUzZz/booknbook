<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>

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


        <h1>CART</h1>

        <form action="/cart" method="POST" id="cartForm">

		<div class="cart_area"> <!--구매카트-->
			<div class="cart_subject">
                <h3>구매카트</h3>
            </div>
			<div class="cart_items">
				<table>
					<tr class="head_row">
						<th width="35px"><input type="checkbox" id="check_all_p"></th>
						<th>서점명</th>
						<th>도서명</th>
						<th width="130px">판매가</th>
						<th width="120px">수량</th>
						<th width="100px">금액</th>
						<th width="60px">삭제</th>
					</tr>
                    
                    <c:if test="${empty cPList}">
                        <tr>
                            <td colspan="7">구매카트에 상품이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty cPList}">

					    <c:forEach items="${cPList}" var="cPItem">
					    	<tr class="cart">
                                <c:choose>
                                    <c:when test="${cPItem.cart_amount eq 0}">
                                        <td><input type="checkbox" class="check_p check" name="pcart_idList" id="p-${cPItem.cart_id}" value="${cPItem.cart_id}" disabled></td>
                                        <td class="detail_link td_gray" onclick="location.href=''">${cPItem.s_storename}</td>
                                        <td class="detail_link td_gray" onclick="location.href='/books/detail/${cPItem.cart_b_isbn}/${cPItem.cart_s_id}'">${cPItem.b_title}</td>
                                        <td class="td_gray"><fmt:formatNumber value="${cPItem.b_price}" type="number" pattern="#,##0"/>원</td>
                                        <td>
                                            <input type="hidden" id="stock-${cPItem.cart_id}" value="${cPItem.b_salestock}">-
                                        </td> 
                                        <td><div class="soldout">일시품절</div></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><input type="checkbox" class="check_p check" name="pcart_idList" id="p-${cPItem.cart_id}" value="${cPItem.cart_id}"></td>
                                        <td class="detail_link" onclick="location.href=''">${cPItem.s_storename}</td>
                                        <td class="detail_link" onclick="location.href='/books/detail/${cPItem.cart_b_isbn}/${cPItem.cart_s_id}'">${cPItem.b_title}</td>
                                        <td><fmt:formatNumber value="${cPItem.b_price}" type="number" pattern="#,##0"/>원</td>
                                        <td>
                                            <input type="hidden" id="stock-${cPItem.cart_id}" value="${cPItem.b_salestock}">
                                            <input type="number" class="qty_input" id="q-${cPItem.cart_id}" name="cart_amount" value="${cPItem.cart_amount}" min="0" max="9" data-stock-id="stock-${cPItem.cart_id}">
                                            <button type="button" data-q-id="q-${cPItem.cart_id}" data-p-id="p-${cPItem.cart_id}" class="save-btn-p">변경</button>
                                        </td> 
                                        <td><fmt:formatNumber value="${cPItem.b_price * cPItem.cart_amount}" type="number" pattern="#,##0"/>원</td>
                                    </c:otherwise>
                                </c:choose>
					    		<td><button type="button" class="delete" data-p-id="p-${cPItem.cart_id}">삭제</button></td>
					    	</tr>
					    </c:forEach>

                    </c:if>

				</table> 
			</div> 
		</div>
		<div class="cart_area"> <!--대여카트-->
			<div class="cart_subject">
                <h3>대여카트</h3>
            </div>
			<div class="cart_items">
				<table>
					<tr class="head_row">
						<th width="35px"><input type="checkbox" id="check_all_r"></th>
						<th>서점명</th>
						<th>도서명</th>
						<th width="85px">대여료<span style="font-size: 11px;">(7일)</span></th>
						<th width="120px">대여기간</th>
                        <th width="65px">수량</th>
						<th width="100px">금액</th>
						<th width="60px">삭제</th>
					</tr>
                
                    <c:if test="${empty cRList}">
                        <tr>
                            <td colspan="8">대여카트에 상품이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty cRList}">

					    <c:forEach items="${cRList}" var="cRItem">
					    	<tr class="cart">
                                <c:choose>
                                    <c:when test="${cRItem.cart_amount eq 0}">
                                        <td><input type="checkbox" class="check_r check" name="rcart_idList" id="r-${cRItem.cart_id}" value="${cRItem.cart_id}" disabled></td>
                                        <td class="detail_link td_gray" onclick="location.href=''">${cRItem.s_storename}</td>
                                        <td class="detail_link td_gray" onclick="location.href='/books/detail/${cRItem.cart_b_isbn}/${cRItem.cart_s_id}'">${cRItem.b_title}</td>
                                        <td class="td_gray"><fmt:formatNumber value="${cRItem.b_rent}" type="number" pattern="#,##0"/>원</td>
                                        <td>-</td> 
                                        <td>
                                            <div class="qty_1">-</div>
                                        </td>
                                        <td><div class="soldout">전량대여중</div></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><input type="checkbox" class="check_r check" name="rcart_idList" id="r-${cRItem.cart_id}" value="${cRItem.cart_id}"></td>
                                        <td class="detail_link" onclick="location.href=''">${cRItem.s_storename}</td>
                                        <td class="detail_link" onclick="location.href='/books/detail/${cRItem.cart_b_isbn}/${cRItem.cart_s_id}'">${cRItem.b_title}</td>
                                        <td><fmt:formatNumber value="${cRItem.b_rent}" type="number" pattern="#,##0"/>원</td>
                                        <td>
                                            <select name="cart_rentalperiod" id="rp-${cRItem.cart_id}">
                                                <c:choose>
                                                    <c:when test="${cRItem.cart_rentalperiod eq 7}">
                                                        <option value="7" selected>7일</option>
                                                        <option value="14">14일</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="7">7일</option>
                                                        <option value="14" selected>14일</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                            <button type="button" data-rp-id="rp-${cRItem.cart_id}" data-r-id="r-${cRItem.cart_id}" class="save-btn-r">변경</button>
                                        </td> 
                                        <td>
                                            <div class="qty_1">${cRItem.cart_amount}</div>
                                        </td>
                                        <td><fmt:formatNumber value="${cRItem.b_rent * cRItem.cart_rentalperiod / 7}" type="number" pattern="#,##0"/>원</td>
                                    </c:otherwise>
                                </c:choose>

					    		<td><button type="button" class="delete" data-r-id="r-${cRItem.cart_id}">삭제</button></td>
					    	</tr>
					    </c:forEach>

                    </c:if>
				</table> 
			</div> 
		</div>

        <div class="button_area">
            <button type="button" onclick="location.href='/'">계속둘러보기</button>
            <div>
                <span>선택한 상품 </span>
                <button type="button" id="delete_all">삭제하기</button>
                <button type="submit" id="put_order">주문하기</button>
            </div>
        </div>

        </form>

    </div>


	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


	<script>

        let m = '${msg}'
		if (m != '') { alert(m) }

        // 1~9이외의 숫자나 문자 입력 제한
        $('.qty_input').on('focusout', function () {

            let qty = $(this).val()
            let qty_format = /^[0-9]$/

            if (!qty.match(qty_format)) {
                alert('1~9 사이의 숫자를 입력해주세요.')
                $(this).val(1)
            }

        })

        // 판매재고수량 이하만 입력 허용
        $('.qty_input').change(function () {

            let qty = $(this).val()
            let stock_id = $(this).data('stock-id')
            let stock = parseInt($('#'+stock_id).val())
            console.log(qty)
            console.log(stock)

            if (qty > stock) {
                alert('재고가 부족합니다.')
                $(this).val(stock)
            } else if (qty == 0) {
                $(this).val(1)
            }

        })

        $(document).ready(function () {

            // 전체체크박스-개별체크박스 동작
            $("#check_all_p").click(function () {

                let isChecked = $(this).prop("checked");
                $(".check_p").prop("checked", isChecked);

            });
            $(".check_p").click(function () {

                if ($(".check_p:checked").length !== $(".check_p").length) {
                    $("#check_all_p").prop("checked", false);
                } else {
                    $("#check_all_p").prop("checked", true);
                }
            });
            $("#check_all_r").click(function () {

                let isChecked = $(this).prop("checked");
                $(".check_r").prop("checked", isChecked);

            });
            $(".check_r").click(function () {

                if ($(".check_r:checked").length !== $(".check_r").length) {
                    $("#check_all_r").prop("checked", false);
                } else {
                    $("#check_all_r").prop("checked", true);
                }
            });

            // 구매카트항목 수량변경&저장
            $('.save-btn-p').click(function () {

                let p_id = $(this).data('p-id')
                let cart_id = parseInt($('#'+p_id).val())
                let q_id = $(this).data('q-id')
                let cart_amount = parseInt($('#'+q_id).val())

                $.ajax({
                    
                    type: "POST",
                    url: "/cartamountupdate",
                    data: { cart_id: cart_id, cart_amount: cart_amount },
                
                    success: function(response) {
                        $('#'+q_id).val(cart_amount);
                        alert("수량이 변경되었습니다.");
                    },
                
                    error: function() {
                        alert("변경 중 오류가 발생했습니다.");
                    }

                })

            })

            // 대여카트항목 대여기간변경&저장
            $('.save-btn-r').click(function () {

                let r_id = $(this).data('r-id')
                let cart_id = parseInt($('#'+r_id).val())
                let rp_id = $(this).data('rp-id')
                let cart_rentalperiod = parseInt($('#'+rp_id).val())

                $.ajax({
                    
                    type: "POST",
                    url: "/cartrentalperiodupdate",
                    data: { cart_id: cart_id, cart_rentalperiod: cart_rentalperiod },
                
                    success: function(response) {
                        $('#'+rp_id).val(cart_rentalperiod);
                        alert("대여기간이 변경되었습니다.");
                    },
                
                    error: function() {
                        alert("변경 중 오류가 발생했습니다.");
                    }

                })

            })


            // 카트내 개별항목 삭제
            $(".delete").click(function () {

                let conf = confirm('해당상품을 카트에서 삭제할까요?');

                if (conf == true) {
                
                    let td_id = $(this).data('p-id')
                    if(td_id == null) {td_id = $(this).data('r-id')}
                    let cart_id = parseInt($('#'+td_id).val())
                    let row = $(this).closest("tr");
                
                    $.ajax({
                    
                        type: "POST",
                        url: "/cartitemdelete",
                        data: { cart_id: cart_id },
                    
                        success: function(response) {
                            row.remove();
                        },
                    
                        error: function() {
                            alert("삭제 중 오류가 발생했습니다.");
                        }

                    })

                }

            })

            // 일괄삭제 버튼
            $("#delete_all").click(function () {

                if ($(".check_r:checked").length == 0 && $(".check_p:checked").length == 0) {

                    alert('선택한 상품이 없습니다.');

                } else {

                    let conf = confirm('선택한 상품을 카트에서 삭제할까요?');

                    if (conf == true) {

                        $(".check:checked").each(function () {

                            let cart_id = $(this).val()
                            let row = $(this).closest("tr");

                            $.ajax({

                                type: "POST",
                                url: "/cartitemdelete",
                                data: { cart_id: cart_id },

                                success: function(response) {
                                    row.remove();
                                },

                                error: function() {
                                    alert("삭제 중 오류가 발생했습니다.");
                                }

                            });

                        });

                    }

                }

            })

            // 주문하기 버튼
            $('#cartForm').submit(function(event) {

                event.preventDefault();

                if ($(".check_r:checked").length == 0 && $(".check_p:checked").length == 0) {

                    alert('선택한 상품이 없습니다.');
                
                } else {
                    this.submit();
                }
                return false
            })

        });
        
	</script>

</body>
</html>