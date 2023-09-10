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
    width: 50px;
    height: 50px;
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
.all_check_input_div_second{
    width: 50px;
    height:50px;
    float: left;
    border: 4px double #ecbc90;
}
.subject_table_second{
    border: 4px double #ecbc90;
}
.content_subject{
    border: 4px double #73a573;
}
.content_btn_section{
    border: 4px double #0f0f18;
}
.order_btn {background-color: #ff9946;
font-size:15px; 
padding: 10px 32px;
}
.content_totalCount_section{
	border: 4px double #73a573;
}

</style>

</head>

<body>

    <jsp:include page="../../tiles/header.jsp"></jsp:include>

    <div class="wrapper">

		<div class="wrap">
			<div class="content_area">

				<div class="content_subject"><span>장바구니</span></div>
				<!-- 장바구니 리스트 -->
				<div class="content_middle_section"></div>
				<!-- 장바구니 가격 합계 -->
				<!-- cartInfo -->
				<div class="content_totalCount_section">

					<!-- 체크박스 전체 여부 -->
					<div class="all_check_input_div">
						<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
					</div>				

					<!--구매카트-->

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

			</div>
		</div>
		
		<div class="wrap">
        <!-- 여기는 대여 부분이야 -->
        	<div class="content_area_second"><span>대여 카트</span></div>
   <!-- 대여 카트 리스트 -->
   <div class="content_middle_section"></div>
   <!-- 대여 카트 가격 합계 -->
   <!-- rentalCartInfo -->
   <div class="content_totalCount_section">
	   <!-- 체크박스 전체 여부 -->
	   <div class="all_check_input_div">
		   <input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_check_span">전체선택</span>
	   </div>

	   <!-- 대여 카트 -->
	   <form action="/rentalCart/update" method="post"> <!-- 대여 카트 수정을 위한 폼 추가 -->
		   <table class="cart_table">
			   <tr>
				   <th class="td_width_1"></th>
				   <th class="td_width_2">서점명</th>
				   <th class="td_width_3">도서명</th>
				   <th class="td_width_4">대여료</th>
				   <th class="td_width_5">수량</th>
				   <th class="td_width_6">대여기간</th>
				   <th class="td_width_7">합계</th>
				   <th class="td_width_8">삭제</th>
			   </tr>

			   <c:forEach items="${cRList}" var="cRItem">
				   <tr>
					   <td><input type="checkbox" class="check_input" name="selectedItems" value="${cRItem.cart_id}"></td>
					   <td>${cRItem.s_storename}</td>
					   <td>${cRItem.b_title}</td>
					   <td>${cRItem.b_rent}</td>
					   <td>
						   <input type="number" class="quantity_input" name="quantity" value="${cRItem.cart_amount}" min="1" max="1">
					   </td>
					   <td>${cRItem.cart_rentalperiod}일</td>
					   <td>${cRItem.b_rent * cRItem.cart_amount}</td>
					   <td><a href="/rentalCart/delete?cartId=${cRItem.cart_id}">삭제</a></td>
				   </tr>
			   </c:forEach>
		   </table>
		   <button type="submit">수정</button> <!-- 대여 카트 수정 버튼 추가 -->
	   </form>

   </div>
</div>
</div>
</div>
        	    <!-- 체크박스 전체 여부
        	    <div class="all_check_input_div_second">
        	    	<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span_second">전체선택</span>
        	    </div>				

				< 장바구니 담긴 상품 품목을 이미지로도 확인할 수 있도록 
				<대여카트
        	    <table class="cart_table">

        	        <tr>
        	            <th class="td_second_1"></th>
						<th class="td_second_2">서점명</th>
        	            <th class="td_second_3">도서명</th>
        	            <th class="td_second_4">대여료</th>
        	            <th class="td_second_5">수량</th>
						<th class="td_second_6">대여기간</th>
        	            <th class="td_second_7">합계</th>
        	            <th class="td_second_8">삭제</th>
        	        </tr>

        	        <c:forEach items="${cRList}" var="cRItem">
        	            <tr>
							<td></td>
							<td>${cRItem.s_storename}</td>
							<td>${cRItem.b_title}</td>
							<td>${cRItem.b_rent}</td>
							<td>1</td>
							<td>${cRItem.cart_rentalperiod}</td>
							<td>${cRItem.b_rent}</td>
							<td></td>
						</tr>
				    </c:forEach>

	 			</table>
	 		</div> -->
                     
            <!-- 삭제 form -->
			<!-- <form action="/cart/delete" method="post" class="quantity_delete_form_second">
				<input type="hidden" name="cartId_second" class="delete_cartId_second">
				<input type="hidden" name="memberId_second" value="${member.memberId}	">
			</form>		-->
            	<!-- 주문 form -->
			<!-- <form action="/order/${member.memberId}" method="get" class="order_form_second">

			</form> -->

		</div>	<!-- class="wrap" -->
<!-- 
 구매 버튼 영역 
		<div class="content_btn_section">
			<button type="button" class="order_btn" id="order_request_btn">주문하기</button>
		</div> 

	</div>	class="wrapper" -->

	<jsp:include page="../../tiles/footer.jsp"></jsp:include>
<!-- <script>
// 장바구니 수량 조절
function adjustQuantity(itemId, maxStock) {
    // 해당 상품의 수량 입력 필드와 현재 수량 가져오기
    var quantityInput = document.getElementById("quantity_" + itemId);
    var currentQuantity = parseInt(quantityInput.value);

    // 증가 또는 감소 버튼을 클릭한 경우
    var action = event.target.dataset.action;
    if (action === "increase" && currentQuantity < maxStock) {
        currentQuantity++;
    } else if (action === "decrease" && currentQuantity > 1) {
        currentQuantity--;
    }

    // 수량 업데이트
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

    // 서버에 장바구니 업데이트 요청 전송
    // 여기에서 서버로 업데이트 요청을 보내야 합니다.
}
</script> -->

<script>
	// 장바구니 수량 조절
function adjustQuantity(itemId, maxStock) {
    // 해당 상품의 수량 입력 필드와 현재 수량 가져오기
    var quantityInput = document.getElementById("quantity_" + itemId);
    var currentQuantity = parseInt(quantityInput.value);

    // 증가 또는 감소 버튼을 클릭한 경우
    var action = event.target.dataset.action;
    if (action === "increase" && currentQuantity < maxStock) {
        currentQuantity++;
    } else if (action === "decrease" && currentQuantity > 1) {
        currentQuantity--;
    }

    // 수량 업데이트
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

    // 여기에서 서버로 장바구니 업데이트 요청을 보내야 합니다.
    // 요청을 보내고 서버에서 장바구니 업데이트를 처리하는 부분을 구현해야 합니다.
    
}

	function updateCartItem(cartId) {
        const quantityInput = document.querySelector(`input[name="quantity"][value="${cartId}"]`);
        const newQuantity = quantityInput.value;

        // 서버로 업데이트 요청을 보내는 Ajax 요청
        $.ajax({
            url: "/cart/update",
            method: "POST",
            data: {
                cartId: cartId,
                newQuantity: newQuantity
            },
            success: function(response) {
                // 서버에서 업데이트된 장바구니 정보를 처리하는 로직을 추가할 수 있습니다.
                // 예: 화면에서 업데이트된 내용을 반영하거나 메시지를 표시합니다.
            },
            error: function(error) {
                // 오류 처리 로직을 추가할 수 있습니다.
            }
        });
    }
    $(document).ready(function() {
        // 수량 입력 필드의 값이 변경될 때 이벤트 핸들러
        $(".quantity_input").change(function() {
            // 현재 수량 입력 필드
            var inputElement = $(this);

            // 현재 상품의 재고량
            var maxStock = parseInt(inputElement.data("max-stock"));

            // 현재 입력된 수량
            var quantity = parseInt(inputElement.val());

            // 최소값을 1로 설정
            if (quantity < 1) {
                quantity = 1;
            }

            // 최대값을 재고량으로 설정
            if (quantity > maxStock) {
                quantity = maxStock;

                // 재고량을 초과하는 경우 경고 메시지 표시
                alert("재고량을 초과할 수 없습니다.");
            }

            // 입력 필드에 변경된 수량 설정
            inputElement.val(quantity);
        });
    });
</script>

</body>
</html>