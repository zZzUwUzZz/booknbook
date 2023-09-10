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


</body>
</html>