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

					<!-- 체크박스 전체 여부 -->
					<div class="all_check_input_div">
						<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
					</div>				

					<form action="/cart/update" method="post"><!-- 장바구니 수정을 위한 폼 추가 --> 
					<table class="cart_table">

							<tr>
								<th class="td_width_1"></th>
								<th class="td_width_2">서점명</th>
								<th class="td_width_3">도서명</th>
								<th class="td_width_4">가격</th>
								<th class="td_width_5">수량</th>
								<th class="td_width_6">합계</th>
								<th class="td_width_7">삭제</th>
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
									<td><a href="/cart/delete?cartId=${cPItem.cart_id}">삭제</a></td>
								</tr>
							</c:forEach>

					</table> 
					<button type="submit">수정</button> <!-- 장바구니 수정 버튼 추가 -->
                </form>
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
						<!-- 대여 장바구니 전체 선택 체크박스 -->
						<div class="all_check_input_div_second">
							<input type="checkbox" class="all_check_input_second input_size_20" checked="checked">
							<span class="all_check_span_second">전체선택</span>
						</div>
					</th>
					<th class="td_width_2">서점명</th>
					<th class="td_width_3">도서명</th>
					<th class="td_width_4">대여료</th>
					<th class="td_width_5">수량</th>
					<th class="td_width_6">합계</th>
					<th class="td_width_7">삭제</th>
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
						<td>${cRItem.b_rent * 1}</td> <!-- 수량을 1로 고정한 값으로 계산 -->
						<td><a href="/rentalCart/delete?cartId=${cRItem.cart_id}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 대여 카트 테이블 종료 -->
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
	
		  // 일반 장바구니 전체 선택/해제 체크박스 이벤트 핸들러
		  $(".all_check_input").click(function() {
        var isChecked = $(this).prop("checked");
        var cartTable = $(this).closest(".content_totalCount_section").find(".cart_table");
        cartTable.find(".check_input").prop("checked", isChecked);
    });

    // 대여 장바구니 전체 선택/해제 체크박스 이벤트 핸들러
    $(".all_check_input_div_second .all_check_input").click(function() {
        var isChecked = $(this).prop("checked");
        var rentalCartTable = $(this).closest(".content_middle_section").find(".cart_table");
        rentalCartTable.find(".check_input").prop("checked", isChecked);
    });

    // 대여 장바구니 개별 선택 체크박스 이벤트 핸들러
    $(".content_area_second .cart_table .check_input").click(function() {
        var totalCheckboxes = $(".content_area_second .cart_table .check_input").length;
        var checkedCheckboxes = $(".content_area_second .cart_table .check_input:checked").length;
        var allCheckbox = $(".all_check_input_div_second .all_check_input");

        allCheckbox.prop("checked", totalCheckboxes === checkedCheckboxes);
    });
	</script>

</body>
</html>