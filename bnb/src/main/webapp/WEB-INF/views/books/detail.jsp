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
                        <p class="status"></p>
                        <div class="bkName">${bdInfo.s_storename}</div>
                        <p class="bkTitle">${bdInfo.b_title}</p>
                  
                        <div class="TextBox01">
                            <div class="TextBox02">
                                <p class="bkAuthor">${bdInfo.b_author}</p>
                                <div class="smallPrice">
                                    <span class="val">
                                        <fmt:formatNumber value="${bdInfo.b_price}" type="number" pattern="#,###" />
                                    </span>
                                    <span>원</span>
                                </div>
                            </div>

                            <!-- 찜하기 버튼 -->
                            <div class="TextBox03">
                                <div class="btnBox">
                                    <div class="likeNoti">
                                        <div id="favButton" class="${favb_state == 1 ? 'faved' : 'unfaved'}">
                                            <span class="material-symbols-outlined">
                                                favorite
                                            </span> 
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <!-- <h1>재고 ${salestock} 대여 가능 ${rentalstock}</h1> -->
                      
                            <div id="addToCartBtn" class="bkCartBtn">장바구니</div>
                            <div id="RestockBtn">
                                <span class="material-symbols-outlined">notifications</span> 
                                재입고 알림 신청
                        </div>

                         <div id="addToRentalCartBtn" class="bkRentBtn">대여하기</div>
                         <input type="hidden" id="salestock" value="${bkStock.salestock}">
                         <input type="hidden" id="rentalstock" value="${bkStock.rentalstock}">
                        
                        </div>
                       
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
    <script src="/js/book/bookDetail.js"></script>

    <script>


$(document).ready(function() {
 
    // 찜하기 버튼 
    var bookData = {
        "userId": '${userId}',
        "s_id": "${bdInfo.b_s_id}",
        "isbn": "${bdInfo.b_isbn}",
        "state": "${fav_state}"
    };
  
    var favBookDTO = {
        "favb_c_id": bookData.userId,
        "favb_s_id": bookData.s_id,
        "favb_b_isbn": bookData.isbn,
        "favb_state": bookData.state
    };
    

    $.ajax({
        url: "/getFavState",
    method: "GET",
    data: {
        "favb_c_id": bookData.userId,
        "favb_s_id": bookData.s_id,
        "favb_b_isbn": bookData.isbn,
        "favb_state": bookData.state
    },
    success: function(response) {
        console.log("불러온 정보:", response);
        console.log("GetFavState Response:", response);
        if(response === 1) {
                console.log("Success:", response);
                $("#favButton").addClass("faved");
                $("#favButton").css("color", "#ff6f36").css("font-variation-settings", "'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 48");
            } else {
                $("#favButton").removeClass("faved");
                $("#favButton").css("color", "#203b23").css("font-variation-settings", "'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 48");
            }
        }
    });


    $(".likeNoti").click(function () {
     
    $.ajax({
        
        url: "/checkFavBook",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(favBookDTO),
        success: function(response) {
            console.log("CheckFavBook Response:", response);
            if(response == 1) {
                    $("#favButton").addClass("faved");
                    $("#favButton").css("color", "#ff6f36").css("font-variation-settings", "'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 48").css("transition", "all .3s");

                } else {
                    console.log("Response is 0");
                    $("#favButton").removeClass("faved");
                    $("#favButton").css("color", "#203b23").css("font-variation-settings", "'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 48").css("transition", "all .3s");
                }
            },
                error: function (error) {
                    console.log("Error:", error);  // 에러 핸들링 추가
        }
    });
    });

});

        $(document).ready(function () {
            const saleStock = parseInt("${salestock}");
            const rentalStock = parseInt("${rentalstock}");
            if (saleStock <= 0) {
                $('#addToCartBtn').text('품절되었습니다.').css("background", "#909090");
                $('.status').text('품절').css("display", "block");
                $('#RestockBtn').css("display", "flex");
                $('.bkInfo_02, .bkPrice').css("display", "none");
                $('#addToCartBtn').prop('id', 'soldOutBtn');
                $('#soldOutBtn').off("click"); // 기존에 있던 click 이벤트 제거
                $('.notiBtn, #soldOutBtn, .bkCartBtn').prop('disabled', false);
                $('.bkCartBtn').css('pointer-events', 'none');

            }

            if (rentalStock <= 0) {
                $('.bkRentBtn').text('대여 예약하기').css("background", "#203b23");
                $('.bkRentBtn').prop('class', 'RentsoldOutBtn');
                $('#addToRentalCartBtn').prop('id', 'RentsoldOutBtn');
                $('.notiBtn').prop('disabled', false);
            }
        });

        // 대여 예약
        $(document).ready(function () {
            $('#RentsoldOutBtn').click(function () {
                const rentalData = {
                    rr_c_id: 'customer001',
                    rr_s_id: '${bdInfo.b_s_id}',
                    rr_b_isbn: '${bdInfo.b_isbn}',
                    rr_res_status_id: 1
                };

                console.log("Sending data to server: ", rentalData); // 데이터를 보내기 전에 로그를 찍습니다.

                $.ajax({
                    url: '/rental/request',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(rentalData),
                    success: function (response) {

                        if (response === 'already') {
                            alert('이미 예약신청이 되었습니다.');
                        } else if (response === 'success') {
                            alert('대여 예약 신청이 완료되었습니다.');
                        }
                    },
                    error: function (err) {
                        alert('대여 예약 신청에 실패했습니다.');
                    }
                });
            });
        });


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




        
            $("#RestockBtn").click(function () {
                const sellerId = "${sellerId}";  // Controller에서 설정한 변수
                const isbn = "${bdInfo.b_isbn}";  // Controller에서 설정한 변수
                const cId = "customer001";  // 실제로는 로그인 사용자의 ID를 가져와야 함

                $.ajax({
                    url: '/api/stockNotif',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ b_s_id: sellerId, b_isbn: isbn, c_id: cId }),

                    success: function (response) {
                        console.log("Success response: ", response);
                        alert(response);
                    },
                    error: function (error) {
                        console.log("에러: ", error);
                        alert(error.responseText);
                    }
                });
            });
        




    </script>
</body>

</html>