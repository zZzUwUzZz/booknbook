<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
       
        <!-- <script src="/js/book/bookDetail.js"></script> -->
      
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
            <img src="/images/books_pic/book09.jpg" alt="">
        </div>

        <div class="bkInfoBox">
            <div class="bkInfo">

                <div class="bkInfoText">
                    <div class="bkName">서점명</div>
                    <p class="bkTitle">책 제목</p>
                    <p class="bkAuthor">지은이</p>
                    <div class="smallPrice"><span>10,000</span><span>원</span></div>
                    <p class="bkInfoText02">글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용
                        글내용
                        글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 글내용 </p>
                </div>

                <div class="bkPrice">
                    <span>총 상품 금액</span>
                    <div class="bkCalPrice">
                        <span class="val">99,999</span>
                        <span class="unit">원</span>
                    </div>
                </div>

                <div class="bkInfo_02">
                    <div class="bkCountBox">
                        <span>수량</span>
                    </div>
                    <div class="calBtn">
                        <button class="CountMinus"> <span class="material-symbols-outlined">
                                remove
                            </span></button>
                        <input type="number" value="1" class="countNum">
                        <button class="CountPlus"><span class="material-symbols-outlined">
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
                    <div class="bkCartBtn">장바구니</div>
                    <div class="bkRentBtn">대여하기</div>
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
                    
                    <div class="item-wrapper">
                        <div class="item">
                            <img src="/images/books_pic/book09.jpg" alt="">
                        </div>
                        <div class="item-info">
                            <div class="store-name">서점명</div>
                            <div class="bktitle02">나는 누구인가?</div>
                            <div class="price">10,000원</div>
                        </div>
                    </div> <!-- item end -->
                    <div class="item-wrapper">
                        <div class="item">
                            <img src="/images/books_pic/book09.jpg" alt="">
                        </div>
                        <div class="item-info">
                            <div class="store-name">서점명</div>
                            <div class="bktitle02">나는 누구인가?</div>
                            <div class="price">10,000원</div>
                        </div>
                    </div> <!-- item end -->
                    <div class="item-wrapper">
                        <div class="item">
                            <img src="/images/books_pic/book09.jpg" alt="">
                        </div>
                        <div class="item-info">
                            <div class="store-name">서점명</div>
                            <div class="bktitle02">나는 누구인가?</div>
                            <div class="price">10,000원</div>
                        </div>
                    </div> <!-- item end -->
                    <div class="item-wrapper">
                        <div class="item">
                            <img src="/images/books_pic/book09.jpg" alt="">
                        </div>
                        <div class="item-info">
                            <div class="store-name">서점명</div>
                            <div class="bktitle02">나는 누구인가?</div>
                            <div class="price">10,000원</div>
                        </div>
                    </div> <!-- item end -->
                    <div class="item-wrapper">
                        <div class="item">
                            <img src="/images/books_pic/book09.jpg" alt="">
                        </div>
                        <div class="item-info">
                            <div class="store-name">서점명</div>
                            <div class="bktitle02">나는 누구인가?</div>
                            <div class="price">10,000원</div>
                        </div>
                    </div> <!-- item end -->

                   
                  </div>
                </div>
                <button id="nextBtn"><span class="material-symbols-outlined">
                    chevron_right
                    </span></button>
            </div>

        </div>

    </section>

</main>

        <%@include file="/WEB-INF/tiles/footer.jsp" %>



    </body>
   
    </html>