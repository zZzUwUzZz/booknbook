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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/main.js"></script>
<script src="/js/search.js"></script>


    <style>
        .box {
            border: solid 1px black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 470px;
            height: 270px;
            margin: 70px auto;
            padding: 25px;
            font-weight: bold;
            background-color:#fffbed;
        }

        .book-image img {
            max-width: 100%;
            height: auto;
            width: 180px;
            float: left;
            margin-right: 13px;
        }

        .book-details {
            text-align: left; 
        }

        .btn {
            background: #ffff;
            border: solid 1px black;
            margin: 3px;
            padding: 5px 12px;
            font-size: 10px;
        }
           /*도서소개 상자*/
        .book-introduction {
            border: solid 1px black;
            width: 470px;
            margin: 10px auto;
            padding: 20px;
            font-weight: bold;
            background-color:#fffbed;
        }
        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }
           /*찜하기,알림,대여 등  버튼*/
        #btn-outline-dark{
            position: relative;
            width:70px;
            height: 30px;
            border-radius: 20px;
            right:10px;
            background-color: #fffbed;
            border:1px soild black;

        }
           /*장바구니 버튼*/
        #addToCartButton {
            position: relative;
            width:70px;
            height: 30px;
            left:220px;
            top:-30px;
            border-radius: 20px;
            background-color: #fffbed;
            border: 1px solid #ff9946;
        }
        /*마이너스 버튼*/
        #decreaseButton{
            position: relative;
            width:20px;
            height: 20px;
            border-radius: 20px;
            background-color: #fffbed;
          
        }
           /*플러스 버튼*/
        #increaseButton{
            position: relative;
            width:20px;
            height: 20px;
            border-radius: 20px;
            background-color: #fffbed;
        }


    </style>
</head>
    <script src="/js/main.js"></script>
    <script src="/js/search.js"></script>
    <script src="/js/book/bookDetail.js"></script>


</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>

    <main class="bkDetailPage">

        <section class="bkIntoContain">


          
            <div class="bkImgBox">
                <img src="https://contents.kyobobook.co.kr/sih/fit-in/500x0/pdt/${bdInfo.b_isbn}.jpg">
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

                  
                    <div class="bkInfo_02">
                        <div class="bkCountBox">
                            <span>수량</span>
                        </div>

                        <!-- 수량 증가/감소 버튼과 입력 필드 -->
                        <div class="calBtn">
                            <button id="minusBtn" class="CountMinus"> <span class="material-symbols-outlined">
                                    remove
                                </span></button>

                            <input type="number" name="cart_amount" id="quantityInput" class="countNum" value="1" readonly/>
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

                          
                        <div class="btnBox">
                            <div id="addToCartBtn" class="bkCartBtn">장바구니</div>
                        </div>
         
                         <div id="addToRentalCartBtn" class="bkRentBtn">대여하기</div>
                    </div>
        

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
                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/400x0/pdt/${bdInfo.b_isbn}.jpg"
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
                 $('#addToRentalCartBtn').click(function (e) {
                    e.preventDefault(); // form의 기본 제출 동작을 막습니다.
                    const cart_amount = parseInt($('#quantityInput').val());
                    $('#cart_amount').val(1);
                });
            });



            $(document).ready(function () {
                $('#addToCartBtn').click(function () {
                    const cart_c_id = 'customer001';
                    const cart_s_id = "${bdInfo.b_s_id}";
                    const cart_b_isbn = "${bdInfo.b_isbn}";
                    const cart_sort = '구매';
                    const cart_amount = parseInt($('#quantityInput').val());
                    const cart_rentalperiod = 0;

                    // 서버에 보낼 데이터를 객체로 만듭니다.
                    const cartData = {
                        cart_c_id,
                        cart_s_id,
                        cart_b_isbn,
                        cart_sort,
                        cart_amount,
                        cart_rentalperiod
                    };

                    $.ajax({
                        url: "/addtocart",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(cartData),
                        success: function (response) {
                            if (response === "over") {
                                alert("장바구니의 최대 수량을 초과했습니다.");
                            } else if (response === "updated") {
                                alert("이미 장바구니에 담긴 책입니다. 이미 담은 상품의 수량을 추가했습니다.");
                            } else {
                                alert("장바구니에 추가되었습니다.");
                            }
                        },
                        error: function (err) {
                            alert("장바구니에 추가하는 데 실패했습니다.");
                        }
                    });

                });
            });



            $(document).ready(function () {
                $('#addToRentalCartBtn').click(function () {
                    const cart_c_id = 'customer001';
                    const cart_s_id = "${bdInfo.b_s_id}";
                    const cart_b_isbn = "${bdInfo.b_isbn}";
                    const cart_sort = '대여';
                    const cart_amount = 1;
                    const cart_rentalperiod = 7;

                    // 서버에 보낼 데이터를 객체로 만듭니다.
                    const cartDataRent = {
                        cart_c_id,
                        cart_s_id,
                        cart_b_isbn,
                        cart_sort,
                        cart_amount,
                        cart_rentalperiod
                    };

                    $.ajax({
                        url: "/addtocartrent",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(cartDataRent),
                        success: function (response) {
                            if (response === "added") {
                                alert("장바구니에 추가되었습니다.");
                            } else {
                                alert("이미 대여 장바구니에 담긴 책입니다.");
                            }
                        },
                        error: function (err) {
                            alert("대여 장바구니에 추가하는 데 실패했습니다.");
                        }
                    });

                });
            });
        

            
    </script>
</body>

</html>