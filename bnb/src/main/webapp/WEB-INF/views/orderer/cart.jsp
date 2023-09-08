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
									<td></td>
									<td>${cPItem.s_storename}</td>
									<td>${cPItem.b_title}</td>
									<td>${cPItem.b_price}</td>
									<td></td>
									<td>${cPItem.b_price}</td>
									<td></td>
								</tr>
							</c:forEach>

					</table> 
				</div>

				<!-- 가격 종합 -->
				<!-- <div class="content_total_section">
					<div class="total_wrap">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>총 상품 가격</td>
											<td>
												<span class="totalPrice_span">70000</span> 원
											</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td>
												<span class="delivery_price">3000</span>원
											</td>
										</tr>									
										<tr>
											<td>총 주문 상품 수</td>
											<td><span class="totalKind_span"></span> 총 <span class="totalCount_span"></span>권</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<div class="boundary_div">구분선</div>
						<table>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td>
													<strong>총 결제 예상 금액</strong>
												</td>
												<td>
													<span class="finalTotalPrice_span">70000</span> 원
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div> -->

				<!-- 수량 조정 form
				<form action="/cart/update" method="post" class="quantity_update_form">
					<input type="hidden" name="cartId" class="update_cartId">
					<input type="hidden" name="bookCount" class="update_bookCount"> 
					<input type="hidden" name="memberId" value="${member.memberId}">
				</form>	 -->
				<!-- 대여는 1값으로 고정 -->
    	        <!-- 구매는 수량을 조절할 수 있도록 -->

				<!-- 삭제 form -->
				<!-- <form action="/cart/delete" method="post" class="quantity_delete_form">
					<input type="hidden" name="cartId" class="delete_cartId">
					<input type="hidden" name="memberId" value="${member.memberId}">
				</form>		 -->
				<!-- 주문 form -->
				<!-- <form action="/order/${member.memberId}" method="get" class="order_form">

				</form>				 -->
			</div>
		</div>
		
		<div class="wrap">
        <!-- 여기는 대여 부분이야 -->
        	<div class="content_area_second">

        	    <!-- 체크박스 전체 여부 -->
        	    <div class="all_check_input_div_second">
        	    	<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span_second">전체선택</span>
        	    </div>				

				<!-- 장바구니 담긴 상품 품목을 이미지로도 확인할 수 있도록 -->
				<!--대여카트-->
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
	 		</div>
                     
            <!-- 삭제 form -->
			<!-- <form action="/cart/delete" method="post" class="quantity_delete_form_second">
				<input type="hidden" name="cartId_second" class="delete_cartId_second">
				<input type="hidden" name="memberId_second" value="${member.memberId}	">
			</form>		-->
            	<!-- 주문 form -->
			<!-- <form action="/order/${member.memberId}" method="get" class="order_form_second">

			</form> -->

		</div>	<!-- class="wrap" -->

    	<!-- 구매 버튼 영역 -->
		<div class="content_btn_section">
			<button type="button" class="order_btn" id="order_request_btn">주문하기</button>
		</div>

	</div>	<!-- class="wrapper" -->

	<jsp:include page="../../tiles/footer.jsp"></jsp:include>


<!-- <script>	

	// 주문하기 버튼 클릭 시 이벤트 핸들러
	document.getElementById("order_request_btn").addEventListener("click", function () {
		// payment.jsp로 페이지 이동
		window.location.href = "payment.jsp";
	});

	//대여장바구니
	/* 체크여부에따른 종합 정보 변화 */
	$(".individual_cart_checkbox_second").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td_second")); 
		// setTotalInfo 함수 정하기
	});

	/* 체크박스 전체 선택 */
	$(".all_check_input_second").on("click", function(){

		/* 체크박스 체크/해제 */
		if($(".all_check_input").prop("checked")){
			$(".individual_cart_checkbox_second").attr("checked", true);
		} else{
			$(".individual_cart_checkbox_second").attr("checked", false);
		}
	    setTotalInfo($(".cart_info_td_second"));	
	});

	/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
	// function setTotalInfo(){

	// 	let totalPrice_second = 0;				// 총 가격
	// 	let totalCount_second = 0;				// 총 갯수
	// 	let totalKind_second = 0;				// 총 종류
	// 	let deliveryPrice_second = 0;			// 배송비
	// 	let finalTotalPrice_second = 0; 		// 최종 가격(총 가격 + 배송비)


	// 	$(".cart_info_td_second").each(function(index, element){

	// 		if($(element).find(".individual_cart_checkbox_second").is(":checked") === true){	//체크여부
	// 			// 총 가격
	// 			totalPrice_second += parseInt($(element).find(".individual_totalPrice_input_second").val());
	// 			// 총 갯수
	// 			totalCount_second += parseInt($(element).find(".individual_bookCount_input_second").val());
	// 			// 총 종류
	// 			totalKind_second += 1;
	// 		}

	// 	});

	//     /* 배송비 결정 */
	// 	if(totalPrice_second >= 30000){
	// 		deliveryPrice_second = 0;
	// 	} else if(totalPrice_second == 0){
	// 		deliveryPrice_second = 0;
	// 	} else {
	// 		deliveryPrice_second = 3000;	
	// 	}

	// 		finalTotalPrice_second = totalPrice_second + deliveryPrice_second;

	// 	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

	// 	// 총 가격
	// 	$(".totalPrice_span_second").text(totalPrice_second.toLocaleString());
	// 	// 총 갯수
	// 	$(".totalCount_span_second").text(totalCount_second);
	// 	// 총 종류
	// 	$(".totalKind_span_second").text(totalKind_second);
	// 	// 배송비
	// 	$(".delivery_price_second").text(deliveryPrice_second);	
	// 	// 최종 가격(총 가격 + 배송비)
	// 	$(".finalTotalPrice_span_second").text(finalTotalPrice_second.toLocaleString());		
	// }

	/* 장바구니 삭제 버튼 */
	$(".delete_btn_second").on("click", function(e){
		e.preventDefault();
		const cartId = $(this).data("cartid");
		$(".delete_cartId_second").val(cartId);
		$(".quantity_delete_form_second").submit();
	});


	/* 주문 페이지 이동 */	
	// $(".order_btn_second").on("click", function(){

	// 	let form_contents_second =''; //페이지 정하지 않음
	// 	let orderNumber_second = 0;

	// 	$(".cart_info_td_second").each(function(index, element){

	// 		if($(element).find(".individual_cart_checkbox_second").is(":checked") === true){	//체크여부

	// 			let bookId = $(element).find(".individual_bookId_input_second").val();
	// 			let bookCount = $(element).find(".individual_bookCount_input_second").val();

	// 			let bookId_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + bookId + "'>";
	// 			form_contents += bookId_input;

	// 			let bookCount_input = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
	// 			form_contents += bookCount_input;

	// 			orderNumber += 1;

	// 		}
	// 	});	

	// 	$(".order_form_second").html(form_contents_second);
	// 	$(".order_form_second").submit();

	// });

	// 일반 장바구니
	/* 체크여부에따른 종합 정보 변화 */
	$(".individual_cart_checkbox").on("change", function(){
		/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));
	});

	/* 체크박스 전체 선택 */
	$(".all_check_input").on("click", function(){

		/* 체크박스 체크/해제 */
		if($(".all_check_input").prop("checked")){
			$(".individual_cart_checkbox").attr("checked", true);
		} else{
			$(".individual_cart_checkbox").attr("checked", false);
		}

		/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));	

	});

	/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
	// function setTotalInfo(){

	// 	let totalPrice = 0;				// 총 가격
	// 	let totalCount = 0;				// 총 갯수
	// 	let totalKind = 0;				// 총 종류
	// 	let deliveryPrice = 0;			// 배송비
	// 	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)


	// 	$(".cart_info_td").each(function(index, element){

	// 		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
	// 			// 총 가격
	// 			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
	// 			// 총 갯수
	// 			totalCount += parseInt($(element).find(".individual_bookCount_input").val());
	// 			// 총 종류
	// 			totalKind += 1;
	// 		}

	// 	});

	// 	/* 배송비 결정 */
	// 	if(totalPrice >= 30000){
	// 		deliveryPrice = 0;
	// 	} else if(totalPrice == 0){
	// 		deliveryPrice = 0;
	// 	} else {
	// 		deliveryPrice = 3000;	
	// 	}

	// 		finalTotalPrice = totalPrice + deliveryPrice;

	// 	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

	// 	// 총 가격
	// 	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 	// 총 갯수
	// 	$(".totalCount_span").text(totalCount);
	// 	// 총 종류
	// 	$(".totalKind_span").text(totalKind);
	// 	// 배송비
	// 	$(".delivery_price").text(deliveryPrice);	
	// 	// 최종 가격(총 가격 + 배송비)
	// 	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	// }

	/* 수량버튼 */
	$(".plus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
	});                                                         

	$(".minus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		if(quantity > 1){
			$(this).parent("div").find("input").val(--quantity);		
		}
	});


	/* 수량 수정 버튼 */
	$(".quantity_modify_btn").on("click", function(){
		let cartId = $(this).data("cartid");
		let bookCount = $(this).parent("td").find("input").val();
		$(".update_cartId").val(cartId);
		$(".update_bookCount").val(bookCount);
		$(".quantity_update_form").submit();

	});

	/* 장바구니 삭제 버튼 */
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		const cartId = $(this).data("cartid");
		$(".delete_cartId").val(cartId);
		$(".quantity_delete_form").submit();
	});

	/* 주문 페이지 이동 */	
	// $(".order_btn").on("click", function(){

	// 	let form_contents =''; //페이지 정하지 않음
	// 	let orderNumber = 0;

	// 	$(".cart_info_td").each(function(index, element){

	// 		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부

	// 			let bookId = $(element).find(".individual_bookId_input").val();
	// 			let bookCount = $(element).find(".individual_bookCount_input").val();

	// 			let bookId_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + bookId + "'>";
	// 			form_contents += bookId_input;

	// 			let bookCount_input = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
	// 			form_contents += bookCount_input;

	// 			orderNumber += 1;

	// 		}
	// 	});	

	// 	$(".order_form").html(form_contents);
	// 	$(".order_form").submit();

	// });


</script> -->

</body>
</html>