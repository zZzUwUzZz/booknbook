<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/books.css">
    <link rel="stylesheet" href="/css/book/bookDetail.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <script src="/js/main.js"></script>
    <script src="/js/search.js"></script>
    <script src="/js/book/bookDetail.js"></script>


</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>

    <main class="bkDetailPage">

        <section class="bkIntoContain">


          
            <div class="bkImgBox">
                <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/${bdInfo.b_isbn}.jpg">
            </div>

            <div class="bkInfoBox">
                <div class="bkInfo">

                    <div class="bkInfoText">
                        <div class="bkName">${bdInfo.s_storename}</div>
                        <p class="bkTitle">${bdInfo.b_title}</p>
                        <p class="bkAuthor">${bdInfo.b_author}</p>
                        <div class="smallPrice">
                            <span class="val">
                                <fmt:formatNumber value="${bdInfo.b_price}" type="number" pattern="#,###" /></span>
                            <span>원</span>
                        </div>
                        <p class="bkInfoText02">${bdInfo.b_bookdesc}</p>
                    </div>

                    <div class="bkPrice">
                        <span>총 상품 금액</span>
                        <div class="bkCalPrice">
                            <span class="totalVal" id="totalPrice">
                                <fmt:formatNumber value="${bdInfo.b_price}" type="number" pattern="#,###" /></span>
                            <span class="unit">원</span>
                        </div>
                    </div>
                    <form id="cartForm" action="/addtocart" method="post">

                    <div class="bkInfo_02">
                        <div class="bkCountBox">
                            <span>수량</span>
                        </div>

                        <!-- 수량 증가/감소 버튼과 입력 필드 -->
                        <div class="calBtn">
                            <button id="minusBtn" class="CountMinus"> <span class="material-symbols-outlined">
                                    remove
                                </span></button>

                            <input type="number" name="cart_amount" id="quantityInput" value="1" class="countNum">
                            <button id="plusBtn" class="CountPlus"><span class="material-symbols-outlined">
                                    add
                                </span> </button>
                        </div>
                    </div>

                    <div class="btnBox">
                        <div class="likeNoti">
                            <div class="likeBtn"> <span class="material-symbols-outlined">
                                    favorite
                                </span> </div>

                            <div class="notiBtn"><span class="material-symbols-outlined">
                                    notifications
                                </span> </div>
                        </div>

                            <input type="hidden" name="cart_c_id" value="customer001">
                            <input type="hidden" name="cart_s_id" id="cart_s_id" value="${bdInfo.b_s_id}">
                            <input type="hidden" name="cart_b_isbn" id="cart_b_isbn" value="${bdInfo.b_isbn}">
                            <input type="hidden" name="cart_sort" id="cart_sort" value="구매">
                            <input type="hidden" name="cart_rentalperiod" id="cart_rentalperiod" value="7">
                           
                        <div class="btnBox">
                            <div type="submit" id="addToCartBtn" class="bkCartBtn">장바구니</div>
                        </div>
                    </form>


                    <form id="cartRentalForm" action="/addtocart" method="post">
                    <input type="hidden" name="cart_c_id" value="customer001">
                    <input type="hidden" name="cart_s_id" id="cart_s_id" value="${bdInfo.b_s_id}">
                    <input type="hidden" name="cart_b_isbn" id="cart_b_isbn" value="${bdInfo.b_isbn}">
                    <input type="hidden" name="cart_sort" id="cart_sort" value="대여">
                    <input type="hidden" name="cart_rentalperiod" id="cart_rentalperiod" value="7">
                         <div type="submit" id="addToRentalCartBtn" class="bkRentBtn">대여하기</div>
                    </div>
                </form>

                </div>

            </div>
        </section>

        <!-- 같은 책 모두 보기 -->
        <section class="bkIntoContain02">

            <div class="simliarBookContain">

                <div class="scBktt"> <span>같은 책 모두 보기</span> </div>


                <div class="bkSliderContain">

                    <button id="prevBtn" disabled><span class="material-symbols-outlined">
                            chevron_left
                        </span></button>

                    <div class="slider001">
                        <div class="items001">

                            <c:forEach items="${bkISBN}" var="findBook">
                                <c:if test="${findBook.b_s_id != sellerId && findBook.b_isbn == isbn}">
                                    <div class="item-wrapper">
                                        <a href="/books/detail/${findBook.b_isbn}/${findBook.b_s_id}">
                                            <div class="item">
                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/210x0/pdt/${bdInfo.b_isbn}.jpg"
                                                    alt="">
                                            </div>
                                            <div class="item-info">
                                                <div class="store-name">${findBook.s_storename}</div>
                                                <div class="bktitle02">${findBook.b_title}</div>
                                                <div class="price">
                                                    <fmt:formatNumber value="${findBook.b_price}" type="number"
                                                        pattern="#,###" /><span>원</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div> <!-- item end -->
                                </c:if>
                            </c:forEach>




                        </div>
                    </div>
                    <button id="nextBtn"><span class="material-symbols-outlined">
                            chevron_right
                        </span></button>
                </div>

            </div>

        </section>

    </main>
    <input type="hidden" id="singlePrice" value="${bdInfo.b_price}">



    <%@include file="/WEB-INF/tiles/footer.jsp" %>

    <script>
        $(document).ready(function () {
            // 먼저 .item-wrapper 요소를 배열로 가져옵니다.
            var items = $('.items001 .item-wrapper').get();

            // 가격을 기준으로 정렬합니다.
            items.sort(function (a, b) {
                var priceA = parseInt($(a).find('.price').text().replace(/,/g, '').replace('원', ''),
                    10);
                var priceB = parseInt($(b).find('.price').text().replace(/,/g, '').replace('원', ''),
                    10);
                return priceA - priceB;
            });

            // 정렬된 요소를 다시 .items001에 추가합니다.
            $('.items001').empty().append(items);
        });



        $(document).ready(function () {
        $('#addToCartBtn').click(function (e) {
        e.preventDefault(); // form의 기본 제출 동작을 막습니다.

        const cart_amount = parseInt($('#quantityInput').val());
        $('#cart_amount').val(cart_amount);

        $('#cartForm').submit(); // form을 프로그래밍적으로 제출합니다.
        });
        });


        $(document).ready(function () {
        $('#addToRentalCartBtn').click(function (e) {
        e.preventDefault(); // form의 기본 제출 동작을 막습니다.

        const cart_amount = parseInt($('#quantityInput').val());
        $('#cart_amount').val(1);

        $('#cartRentalForm').submit(); // form을 프로그래밍적으로 제출합니다.
        });
        }); 

 
    </script>
</body>

</html>