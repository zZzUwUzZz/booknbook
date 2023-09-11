<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="/js/cart.js"></script> -->
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/slide.css">
   
<!-- 나중에 디자인 수정 위치 표시용 -->
<style>

div {
        margin: 10px;
        text-align: center;
}
.wrapper{
    border: 4px double #84a784;
}
.content_area{
    border: 4px double #e3ec90;
}
.all_check_input_div{
    border: 4px double #e3ec90;
    width: 90px;
    height: 30px;
    float: left;
}
.subject_table{
    border: 4px double #ecbc90;
}
.content_total_section{
    border: 4px double #ec9e90;
}
.boundary_div{
    border: 4px double #0f0f18;
}
.content_area_second{
    border: 4px double #e3ec90;
}
.cart_retrun_table{
    border: 4px double #ec9e90;
}
.content_total_second{
    border: 4px double #e3ec90;
}
.boundary_div_second{
    border: 4px double #0f0f18;
}
.content_total_section_second{
    border: 4px double #ec9e90;
}

.content_totalCount_section{
	border: 4px double #73a573;
}
.content_middle_section{
	border: 4px double #e3ec90;
}

</style>

</head>
<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>

    <div class="wrapper">

		<div class="wrap">
			<div class="content_area">

				<div class="content_subject"><span>일반 장바구니</span></div>
				<!-- 장바구니 리스트 -->
				<div class="content_middle_section"></div>
				<!-- 장바구니 가격 합계 -->
				<!-- cartInfo -->
				<div class="content_totalCount_section">

				<!-- 체크박스 전체 여부 - 일반 장바구니 -->
				<div class="all_check_input_div">
				<input type="checkbox" class="all_check_input input_size_20" id="all_check_normal" checked="checked">
				<span class="all_check_span">전체선택</span>
				</div>

					<table class="cart_table">

							<tr>
								<th class="td_width_1"></th>
								<th class="td_width_2">서점명</th>
								<th class="td_width_3">도서명</th>
								<th class="td_width_4">가격</th>
								<th class="td_width_5">수량</th>
								<th class="td_width_6">합계</th>
								<th class="td_width_7"></th>
							</tr>
						
							<c:forEach items="${cPList}" var="cPItem">
								<tr>
									<td><input type="checkbox" class="check_input" name="selectedItems" value="${cPItem.cart_id}"></td>
									<td>${cPItem.s_storename}</td>
									<td>${cPItem.b_title}</td>
									<td>${cPItem.b_price}</td>
									<td>
										<input type="number" class="quantity_input" name="quantity" value="${cPItem.cart_amount}" min="1" max="${cPItem.b_salestock}">
									</td> 
									<td>${cPItem.b_price * cPItem.cart_amount}</td>
									<!-- <td><a href="/cart/delete?cartId=${cPItem.cart_id}">삭제</a></td> -->
									<td>
										<button class="delete_button" data-cart-id="${cItem.cart_id}">삭제</button>
									</td>								
								</tr>
							</c:forEach>

					</table> 
				</div> 
				<!-- content_totalCount_section 끝 -->

			</div>
			<!-- content_area 끝 -->

		</div>
		<!-- wrap 끝 -->
		
		<div class="content_subject_second"><span>대여 장바구니</span></div>
		<!-- 대여 카트 리스트 -->
		<div class="content_middle_section_second">
			<!-- 대여 카트 테이블 시작 -->
			<table class="cart_table_second">
				<tr>
					<th class="td_width_1">

						<!-- 체크박스 전체 여부 - 대여 장바구니 -->
						<div class="all_check_input_div_second">
						<input type="checkbox" class="all_check_input_second input_size_20" id="all_check_rental_second" checked="checked">
						<span class="all_check_span_second">전체선택</span>
						</div>

				</th>
					<th class="td_width_2">서점명</th>
					<th class="td_width_3">도서명</th>
					<th class="td_width_4">대여료</th>
					<th class="td_width_5">수량</th>
					<th class="td_width_6">합계</th>
					<th class="td_width_7"></th>
				</tr>
		
				<c:forEach items="${cRList}" var="cRItem">
					<tr>
						<td>
							<!-- 대여 장바구니 개별 선택 체크박스 -->
							<input type="checkbox" class="check_input" name="selectedItems" value="${cRItem.cart_id}">
						</td>
						<td>${cRItem.s_storename}</td>
						<td>${cRItem.b_title}</td>
						<td>${cRItem.b_rent}</td>
						<td>
							<!-- 수량 입력 필드를 1로 고정 -->
							<input type="number" class="quantity_input" name="quantity" value="1" min="1" max="1" disabled>
						</td> 
						<td>
							<select name="rentalPeriod">
								<option value="7">7일</option>
								<option value="14">14일</option>
							</select>
						</td>
						<td>${cRItem.b_rent * 1}</td> <!-- 수량을 1로 고정한 값으로 계산 -->
						<!-- <td><a href="/rentalCart/delete?cartId=${cRItem.cart_id}">삭제</a></td> -->
						<td>
							<button class="delete_button" data-cart-id="${cRItem.cart_id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 대여 카트 테이블 종료 -->
		</div>

		<!-- 주문서 부분 -->
<div class="order_summary">
    <h2>주문서</h2>
    <div>
        <p>선택한 상품 금액: <span id="selected_items_total">0원</span></p>
    </div>
</div>
		
            <!-- 삭제 form -->
			<!-- <form action="/cart/delete" method="post" class="quantity_delete_form_second">
				<input type="hidden" name="cartId_second" class="delete_cartId_second">
				<input type="hidden" name="memberId_second" value="${member.memberId}	">
			</form>		-->
            	<!-- 주문 form -->
			<!-- <form action="/order/${member.memberId}" method="get" class="order_form_second">

			</form> -->

		<!-- </div>	 -->
		<!-- class="wrap" -->
<!-- 
 구매 버튼 영역 
		<div class="content_btn_section">
			<button type="button" class="order_btn" id="order_request_btn">주문하기</button>
		</div> 

	</div>	class="wrapper" -->

	<jsp:include page="../../tiles/footer.jsp"></jsp:include>

	<script>
	
        // 장바구니 수량 조절
        function adjustQuantity(itemId, maxStock, event) {
            var quantityInput = document.getElementById("quantity_" + itemId);
            var currentQuantity = parseInt(quantityInput.value);

            var action = event.target.dataset.action;
            if (action === "increase" && currentQuantity < maxStock) {
                currentQuantity++;
            } else if (action === "decrease" && currentQuantity > 1) {
                currentQuantity--;
            }

            quantityInput.value = currentQuantity;
        }

        // 장바구니에 상품을 추가할 때 재고량 체크
        function addToCart(itemId, maxStock) {
            var quantityInput = document.getElementById("quantity_" + itemId);
            var quantity = parseInt(quantityInput.value);

            if (quantity > maxStock) {
                alert("재고량을 초과할 수 없습니다.");
                return;
            }
        }

        // 수량 입력 필드의 값이 변경될 때 이벤트 핸들러
        $(".quantity_input").change(function () {
            var inputElement = $(this);
            var maxStock = parseInt(inputElement.data("max-stock"));
            var quantity = parseInt(inputElement.val());

            if (quantity < 1) {
                quantity = 1;
            }

            if (quantity > 9) {
                quantity = 9;
                alert("최대 수량은 9개까지만 가능합니다.");
            }

            if (quantity > maxStock) {
                alert("재고량을 초과할 수 없습니다.");
                quantity = maxStock;
            }

            inputElement.val(quantity);
        });

	// 일반 장바구니 체크박스 이벤트 핸들러
$("#all_check_normal").click(function() {
    var isChecked = $(this).prop("checked");
    var cartTable = $(this).closest(".content_totalCount_section").find(".cart_table");
    cartTable.find(".check_input").prop("checked", isChecked);

    // 다른 상품을 선택하면 전체 선택을 해제
    $("#all_check_rental_second").prop("checked", false);
});

// 대여 장바구니 체크박스 이벤트 핸들러
$("#all_check_rental_second").click(function() {
    var isChecked = $(this).prop("checked");
    var rentalCartTable = $(this).closest(".content_middle_section_second").find(".cart_table_second");
    rentalCartTable.find(".check_input_second").prop("checked", isChecked);

    // 다른 상품을 선택하면 전체 선택을 해제
    $("#all_check_normal").prop("checked", false);
});

// 선택한 상품의 총 금액을 계산하는 함수
function calculateSelectedItemsTotal() {
    var total = 0;
    $(".cart_table tbody tr").each(function() {
        if ($(this).find(".check_input").prop("checked")) {
            var price = parseFloat($(this).find(".price_cell").text());
            var quantity = parseInt($(this).find(".quantity_input").val());
            total += price * quantity;
        }
    });
    return total;
}

// 선택한 상품의 총 금액을 업데이트하고 주문서에 표시하는 함수
function updateOrderSummary() {
    var total = calculateSelectedItemsTotal();
    $("#selected_items_total").text(total + "원");
}

// 장바구니 테이블의 체크박스 변경 이벤트 핸들러
$(".cart_table tbody .check_input").change(function() {
    updateOrderSummary();
});

// 삭제 버튼 클릭 이벤트 핸들러
$(".cart_table tbody .delete_button").click(function() {
    // 선택한 상품 삭제 로직을 추가하세요 (서버와의 통신 등)
    
    $(this).closest("tr").remove();
    updateOrderSummary();
});

// 초기화: 페이지 로드 시 주문서 업데이트
updateOrderSummary();
      

// 삭제 버튼 클릭 이벤트 핸들러
$(".delete_button").click(function() {
    var cartId = $(this).data("cart-id"); // 삭제할 항목의 고유 ID
    var cartType = $(this).closest("table").hasClass("cart_table") ? "normal" : "rental"; // 일반 또는 대여 장바구니 여부

    // 서버로 삭제 요청을 보냅니다. 서버에서 해당 항목을 삭제
    $.ajax({
        url: "/deleteCartItem", // 삭제 요청을 처리하는 서버 엔드포인트
        method: "POST", 
        data: { cartId: cartId, cartType: cartType }, // 삭제할 항목 및 장바구니 유형 전송
        success: function(response) {
            if (response.success) {
                // 삭제 성공 시, 클라이언트에서 해당 항목을 제거
                $(this).closest("tr").remove();
                updateOrderSummary(); // 주문서 업데이트
            } else {
                alert("삭제 실패. 다시 시도해주세요.");
            }
        },
        error: function() {
            alert("오류 다시 시도해주세요.");
        }
    });
});
</script>

</body>
</html>