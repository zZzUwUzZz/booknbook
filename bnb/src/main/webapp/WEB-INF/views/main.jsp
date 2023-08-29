<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
        <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/main.js"></script>

</head>

<body>


    <!-- modal -->
    
    <div class="noti_md">
    <div class="noti_tt">
        <p>알림</p>
    </div>
    <div class="notilistbox">
    </div>
</div>

    <div class="sc_md">
        <div class="sc_cls">
            <span class="material-symbols-outlined">
                close
                </span>
           </div>
<div class="scmd_input_box">
   
    <div class="scip_box">
    <span class="material-symbols-outlined">
        search
        </span>
    <input class="scbook" type="search" placeholder="Search...">
</div>

</div>

    </div>

    <div>

    </div>


    <!-- main -->
    <%@include file="/WEB-INF/tiles/header.jsp" %>
    <div class="main">

        <div class="scbox">
            <div class="scbox_01">
                <div>
                    <span id="scboxicon" class="material-symbols-sharp">search</span>
                </div>
                <div class="scbox_02">
                    <input class="scstore" type="search" placeholder="당신의 서점을 찾아보세요.">
                </div>
            </div>
            <div class="scbox_bg"></div>
        </div>




        <div class="bnb_list">
            <div class="list_tt">
                <div class="lt_01">독립서점 둘러보기</div>
                <div class="listmore">더보기</div>
            </div>
            <div class="slider">
                <div class="slide-container">

                    <div class="slide">
                        <img src="/images/bookstore_pic/1.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/2.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/3.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/4.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/5.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/6.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/7.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>
                    <div class="slide">
                        <img src="/images/bookstore_pic/8.jpg">
                        <p>서점 이름</p>
                        <p>지역명</p>
                    </div>



                </div>

                <span id="prev-btn" class="material-symbols-sharp">
                    chevron_left
                </span>

                <span id="next-btn" class="material-symbols-sharp">
                    navigate_next
                </span>

            </div>
        </div>

        <div class="bnb_list">
            <div class="list_tt">
                <div class="lt_02">새로 나온 책</div>
                <div class="listmore">더보기</div>
            </div>
            <div class="slider">
                <div class="slide-container_02">
                    <div class="b_slide">
                        <img src="/images/books_pic/book_01.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_02.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_03.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_04.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_05.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_06.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_07.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_slide">
                        <img src="/images/books_pic/book_08.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                </div>
                <span id="prev-btn_02" class="material-symbols-sharp">
                    chevron_left
                </span>
                <span id="next-btn_02" class="material-symbols-sharp">
                    navigate_next
                </span>
            </div>
        </div>

        <div class="bnb_list">
            <div class="list_tt">
                <div class="lt_02">이런 책은 어때요?</div>
                <div class="listmore">더보기</div>
            </div>

            <div class="itemlist">
                <div class="itemlist-container">
                    <div class="b_item">
                        <img src="/images/books_pic/book_01.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_02.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_03.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_04.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                </div>
            </div>

            <div class="itemlist">
                <div class="itemlist-container">
                    <div class="b_item">
                        <img src="/images/books_pic/book_05.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_06.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_07.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_08.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                </div>
            </div>

            <div class="itemlist">
                <div class="itemlist-container">
                    <div class="b_item">
                        <img src="/images/books_pic/book_05.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_06.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_07.png">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                    <div class="b_item">
                        <img src="/images/books_pic/book_08.jpg">
                        <p>도서명</p>
                        <p>9,999원</p>
                    </div>
                </div>
            </div>
        </div>



    </div> <!-- main end -->

    <%@include file="/WEB-INF/tiles/footer.jsp" %>

</body>

</html>