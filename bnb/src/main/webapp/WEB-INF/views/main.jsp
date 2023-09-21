<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <input type="hidden" id="randomStoreName" value="${randomSeller.s_storename}">

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="/js/mapSearch.js"></script>

        <style>
            header {
                position: absolute;
                width: 100%;
             z-index: 1;
            }

            .hd {
             border-bottom: 0px;
             }
             .ft {
                border-top: 1px solid #dfdad5;
             }
             .ft p {
                color: #dfdad5;
             }

             #small-menu{top: 57px;}
        </style>
    </head>

    <body>
        <!-- main -->
        <%@include file="/WEB-INF/tiles/header.jsp" %>
<div class="main">
    <div class="scbox">
        <div class="maintt">
        </div>
        <div class="scbox_01">
            <div>
                <span id="scboxicon" class="material-symbols-sharp">search</span>
            </div>
            <form id="mapSearchForm">
                <div class="scbox_02">
                    <input class="scstore" id="mapscInput" type="text" name="keyword" placeholder="당신의 서점을 찾아보세요.">
                </div>
            </form>
        </div>
       
        <!-- <div class="rpBtn">독립서점 제보하기</div> -->
        <a href="/report" class="rpBtn">독립서점 제보하기</a>

        <div class="scbox_bg" style="background-image: url(/uploads/${randomFile.sf_sysname})">
        </div>

    </div>

    <div class="bstext01">
        <div>전국의 다양한 독립 서점을 <br> 지금 만나보세요.</div>
    </div>

    <div class="bnb_list">
        <div class="list_tt">
            <div class="lt_01">독립서점 둘러보기</div>
            <a href="/bookstore" class="listmore">더보기 +</a>
        </div>
        <div class="prntbtn">
            <span id="prev-btn" class="material-symbols-sharp">
                chevron_left
            </span>

            <span id="next-btn" class="material-symbols-sharp">
                navigate_next
            </span>
        </div>
    </div>

    <div class="slider01">
        <div class="slide-container">
            <c:forEach var="info" items="${mainInfos}" varStatus="status">
                <c:if test="${status.index < 8}">
                    <div class="slide">
                        <a href="/bookstore/detail/${info.s_id}"> <img src="/uploads/${info.sf_sysname}"></a>
                        <div class="bs_infott">
                            <a href="/bookstore/detail/${info.s_id}">
                                <p>${info.s_storename}</p>
                            </a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
    

    <div class="bstext01">
        <div>독립 서점의 책을 북앤북에서<br> 한 눈에 찾아보세요</div>
    </div>

    <div class="bnb_list">
        <div class="list_tt01">
            <div class="lt_02">새로 나온 책</div>
            <div class="listmore">더보기 > </div>
        </div>
        <div class="prntbtn">
            <span id="prev-btn_02" class="material-symbols-sharp">
                chevron_left
            </span>
            <span id="next-btn_02" class="material-symbols-sharp">
                navigate_next
            </span>
        </div>
    </div>


    <div class="slider">
        <div class="slide-container_02">
            <c:forEach items="${books}" var="book" varStatus="status">
                <c:if test="${status.index < 8}">
                    <div class="b_slide">
                        <a href="/books/detail/${book.b_isbn}/${book.b_s_id}">
                        <div class="b_box">
                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/500x0/pdt/${book.b_isbn}.jpg">
                        </div>
                    </a>
                        <div class="bkinfotext01">
                            <a style="font-size: 13px;" href="/bookstore/detail/${book.b_s_id}"><span>${book.s_storename}</span></a>
                            <a href="/books/detail/${book.b_isbn}/${book.b_s_id}">
                                <p>${book.b_title}</p>
                            </a>
                            <p>
                                <fmt:formatNumber value="${book.b_price}" type="number" />원
                            </p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>



    <div class="bnb_list">
        <div class="list_tt">
            <div class="lt_02">이런 책은 어때요?</div>
            <div class="listmore"><a href="/books">더보기 > </a></div>
        </div>

        <div class="itemlist">
            <div class="itemlist-container03">
                <c:forEach var="book_r" items="${bookrandom}" varStatus="status">
                    <c:if test="${status.index < 12}">
                        <div class="b_item01">
                            <a href="/books/detail/${book_r.b_isbn}/${book_r.b_s_id}">
                            <div class="b_box02">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/500x0/pdt/${book_r.b_isbn}.jpg">
                            </div>
                        </a>
                            <div class="bkinfotext02">
                                <a style="font-size: 13px;" href="/bookstore/detail/${book_r.b_s_id}"> <span>${book_r.s_storename}</span> </a>
                                <a href="/books/detail/${book_r.b_isbn}/${book_r.b_s_id}">
                                    <p>${book_r.b_title}</p>
                                </a>
                                <p>
                                    <fmt:formatNumber value="${book_r.b_price}" type="number" />원
                                </p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

    </div>
</div> <!-- main end -->

      
 <script src="/js/main.js"></script>
 
<script>
 $(document).ready(function() {
    var maxDivs = 8;
    $(".slide").each(function(index) {
        if (index >= maxDivs) {
            $(this).hide();
        }
    });
});
</script>


<%@include file="/WEB-INF/tiles/footer.jsp" %>

    </body>

    </html>