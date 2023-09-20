<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %>

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
        <link rel="stylesheet" href="/css/bookstore/bookstore.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="/js/main.js"></script>
        <script src="/js/search.js"></script>


<style>
    .hd {
        border-bottom: 1px solid #dfdad5;
    }

    .ft {
        border-top: 1px solid #dfdad5;

    }
.ft p {
    color:#dfdad5;
}
</style>

    </head>


<body>
    <%@include file="/WEB-INF/tiles/header.jsp" %>

 <main>
 
    <div class="bsContain">
        <div id="bsSlider">
         
            <c:forEach var="entry" items="${allImageList}" varStatus="status">
            
                <c:if test="${status.index < 3}">
                    <div class="bsSlide active">
                        <div class="bsInfo">
                            <div class="bsText01">이달의 독립 서점</div>

                              <div class="bsInfoName">${entry.s_storename}</div>
                            <div class="bsInfoDetail">${entry.s_storedesc}</div>
                            <span hidden id="storeId">${entry.s_id}</span>
                            <div id="storeLink" style="cursor: pointer;">서점 방문하기</div>
                        </div>
                        <img src="<c:url value='/uploads/${entry.sf_sysname}' />">
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div id="prev">
            <span class="material-symbols-outlined">
                chevron_left
            </span></div>
        <div id="next"><span class="material-symbols-outlined">
                chevron_right
            </span></div>

    </div>
 
    <div class="bstext01">
        <div>독립 서점 위치가 궁금하다면?<br><a href="/map?keyword=">서점 지도</a>에서 한 눈에 찾아보세요.</div>
    </div>



    <div class="bnb_list">
        <div class="list_tt">
            <div class="lt_01">요즘 인기 있는 독립 서점</div>
            <a href="/map?keyword=" class="listmore">더보기 +</a>
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
            <!-- 즐겨찾기된 서점 목록을 슬라이드로 표시 -->
            <c:forEach var="store" items="${favStores}" varStatus="status">
                <c:if test="${status.index < 8}">
                    <div class="slide">
                        <a href="/bookstore/detail/${store.favs_s_id}">
                            <c:if test="${store.sf_sysname != null}">
                                <img src="/uploads/${store.sf_sysname}">
                            </c:if>
                        </a>
                        <div class="bs_infott">
                            <a href="/bookstore/detail/${store.favs_s_id}">
                                <p>${store.s_storename}</p>
                            </a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
    
    







 
 </main>

    <%@include file="/WEB-INF/tiles/footer.jsp" %>

    <script src="/js/bookstore/bookstore.js"></script>

    <script type="text/javascript">
         $(document).ready(function() {
        var storeId = $("#storeId").text();
        $("#storeLink").click(function() {
            console.log(storeId);
            window.location.href = "/bookstore/detail/" + storeId;
        });
    });
    </script>

</body>
</html>