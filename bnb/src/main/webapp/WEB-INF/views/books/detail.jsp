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
                        <div>총 상품 금액</div>
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

    const forsale = "${forsale}";
    const forrental = "${forrental}";
   
    const userId = "${sessionScope.loggedInUser}";
    const isLoggedIn = "${sessionScope.isLoggedIn}" === "true";
    


      // 공통으로 사용되는 데이터
      const bookData = {
        userId,
        s_id: "${bdInfo.b_s_id}",
        isbn: "${bdInfo.b_isbn}",
        state: "${fav_state}"
      };
    
      const favBookDTO = {
        favb_c_id: userId,
        favb_s_id: bookData.s_id,
        favb_b_isbn: bookData.isbn,
        favb_state: bookData.state
      };
    
      // 로그인 체크 함수
      function checkLogin() {
        if (!isLoggedIn) {
          alert("로그인이 필요한 서비스 입니다.");
          return false;
        }
        return true;
      }
    
      
      function ajaxRequest(url, data, successCallback, errorCallback) {
            $.ajax({
                url: url,
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: successCallback,
                error: errorCallback
            });
        }
    
        function updateProductStatus(saleStock, rentalStock) {
            if (saleStock <= 0) {
                updateSoldOutState();
            }
            if (rentalStock <= 0) {
                updateRentalSoldOutState();
            }
        }


    
      // 찜하기 상태를 불러옵니다.
      $.ajax({
    url: "/getFavState",
    method: "GET",
    data: favBookDTO,
    success: function (response) {
        console.log("찜하기 상태 가져오기 :", response);
        const favButton = $("#favButton span");
        const isFaved = response === 1;
        if (isFaved) {
            favButton.css("font-variation-settings", "'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 48");
            favButton.css("color", "#ff6f36");
        } else {
            favButton.css("font-variation-settings", "'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 48");
            favButton.css("color", "#203b23");
        }
    }
});

$(".likeNoti").click(function () {
    if (!checkLogin()) return;

    $.ajax({
        url: "/checkFavBook",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(favBookDTO),
        success: function (response) {
            const favButton = $("#favButton span");
            const isFaved = response === 1;
            if (isFaved) {
                favButton.css("font-variation-settings", "'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 48");
                favButton.css("color", "#ff6f36");
            } else {
                favButton.css("font-variation-settings", "'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 48");
                favButton.css("color", "#203b23");
            }
            favButton.css("transition", "all .3s");
        },
        error: function (error) {
            console.log("Error:", error);
        }
    });
});
    
  


        // 판매 품절 상태 업데이트
        function updateSoldOutState() {
    $('#addToCartBtn').addClass('sold-out').text('품절되었습니다.').css("background", "#909090");
            $('.status').text('품절').css("display", "block");
            $('#RestockBtn').css("display", "flex");
            $('.bkInfo_02, .bkPrice').css("display", "none");
            $('#addToCartBtn').prop('id', 'soldOutBtn');
            $('#soldOutBtn').off("click");
            $('.notiBtn, #soldOutBtn, .bkCartBtn').prop('disabled', false);
            $('.bkCartBtn').css('pointer-events', 'none');
        }
    
        // 대여 품절 상태 업데이트
        function updateRentalSoldOutState() {
            $('#addToRentalCartBtn').addClass('sold-out').text('대여 예약하기').css("background", "#203b23");
            $('.bkRentBtn').prop('class', 'RentsoldOutBtn');
            $('#addToRentalCartBtn').prop('id', 'RentsoldOutBtn');
            $('.notiBtn').prop('disabled', false);
        }
    
        // 대여 예약 AJAX 요청
        function requestRental() {
            const rentalData = {
                rr_c_id: userId,
                rr_s_id: '${bdInfo.b_s_id}',
                rr_b_isbn: '${bdInfo.b_isbn}',
                rr_res_status_id: 1
            };
    
            $.ajax({
                url: '/rental/request',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(rentalData),
                success: function (response) {
                    alert(response === 'already' ? '이미 예약신청이 되었습니다.' : '대여 예약 신청이 완료되었습니다.');
                },
                error: function () {
                    alert('대여 예약 신청에 실패했습니다.');
                }
            });
        }
    
        // 상품 재고 상태를 업데이트
        updateProductStatus(parseInt("${salestock}"), parseInt("${rentalstock}"));
    
        // 대여 예약 버튼 클릭 이벤트
        $('#RentsoldOutBtn').click(requestRental);
       
         // 가격 기준으로 .item-wrapper 요소 정렬
         function sortItemsByPrice() {
            var items = $('.items001 .item-wrapper').get();
            items.sort(function (a, b) {
                var priceA = parseInt($(a).find('.price').text().replace(/,/g, '').replace('원', ''), 10);
                var priceB = parseInt($(b).find('.price').text().replace(/,/g, '').replace('원', ''), 10);
                return priceA - priceB;
            });
            $('.items001').empty().append(items);
        }
    
        // 장바구니에 추가 (일반/대여)
        function addToCart(url, cartData) {
            $.ajax({
                url: url,
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(cartData),
                success: function (response) {
                    var messages = {
                        'over': '장바구니의 최대 수량을 초과했습니다.',
                        'updated': '이미 장바구니에 담긴 책입니다. 수량을 추가했습니다.',
                        'default': '장바구니에 추가되었습니다.'
                    };
                    alert(messages[response] || messages['default']);
                },
                error: function () {
                    alert("장바구니에 추가하는 데 실패했습니다.");
                }
            });
        }
    
        // 가격 기준으로 아이템 정렬
        sortItemsByPrice();
    
        // 대여 카트에 추가 버튼 이벤트
        $('#addToRentalCartBtn').click(function (e) {
            e.preventDefault();
            $('#cart_amount').val(1);
        });
    
        // 일반 카트에 추가 버튼 이벤트
        $('#addToCartBtn').click(function () {
            if (!checkLogin()) return;
            const cartData = {
                cart_c_id: userId,
                cart_s_id: "${bdInfo.b_s_id}",
                cart_b_isbn: "${bdInfo.b_isbn}",
                cart_sort: '구매',
                cart_amount: parseInt($('#quantityInput').val()),
                cart_rentalperiod: 0
            };
            addToCart("/addtocart", cartData);
        });
    
    
    
        $('#addToRentalCartBtn').click(function () {
            if (!checkLogin()) return;
            const cartDataRent = {
                cart_c_id: userId,
                cart_s_id: "${bdInfo.b_s_id}",
                cart_b_isbn: "${bdInfo.b_isbn}",
                cart_sort: '대여',
                cart_amount: 1,
                cart_rentalperiod: 7
            };
    
            ajaxRequest(
                "/addtocartrent",
                cartDataRent,
                function (response) {
                    alert(response === "added" ? "장바구니에 추가되었습니다." : "이미 대여 장바구니에 담긴 책입니다.");
                },
                function () {
                    alert("대여 장바구니에 추가하는 데 실패했습니다.");
                }
            );
        });
    
        $("#RestockBtn").click(function () {
              if (!checkLogin()) return;
            const stockData = {
                b_s_id: "${sellerId}",
                b_isbn: "${bdInfo.b_isbn}",
                c_id: userId
            };
    
            ajaxRequest(
                '/api/stockNotif',
                stockData,
                function (response) {
                    alert(response);
                },
                function (error) {
                    alert(error.responseText);
                }
            );
        });
    });
</script>
</body>

</html>