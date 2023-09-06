<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/map.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/main.js"></script>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABg7GBJJBgt8BMt0MG6VCZdwbwLU0KTJI&callback=initMap&libraries=&v=weekly"
        defer></script>


</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>

 
    <% 
    String storeId = (String)request.getAttribute("storeId");
    String isFavorite = (String)request.getAttribute("isFavorite");
%>
    
 
    <div class="mapContainer">

        <div class="mapSearchBox">

            <form id="mapSearchForm">
                <div class="ms_sc">
                    <input class="mapscstore" id="mapscInput" onkeydown="if (event.key === 'Enter') window.location.href='/map?keyword=' + document.getElementById('mapscInput').value" 
                        type="text" name="keyword" placeholder="장소, 서점명 검색">
                </div>
            </form>


            <div class="maplist">
    <div class="map_rs">
        <span>${keyword}</span> <span>검색결과</span> <span>총 ${totalItems}건</span>
    </div>
    <c:forEach var="store" items="${results}">
        <div class="bs_item" data-store-id="${store.s_id}">
            <!-- 이미지 출력 -->
            <div class="bs_itempf" data-lat="${store.s_latitude}" data-lng="${store.s_longitude}">
                <c:forEach var="imageInfo" items="${imageInfos}">
                    <c:if test="${imageInfo.sf_s_id == store.s_id}">
                        <img src="<c:url value='/uploads/${imageInfo.sf_sysname}' />" alt="${store.s_storename}">
                    </c:if>
                </c:forEach>
            </div>
            <!-- 서점 이름과 소개 -->
            <div class="bs_iteminfo">
                ${store.s_storename} <br>
            </div>
            <!-- 주소와 연락처 -->
            <div class="bs_itemcontact">
                <c:forEach var="memberInfo" items="${memberInfos}">
                    <c:if test="${memberInfo.m_id == store.s_id}">
                        Address: ${memberInfo.m_addr} <br>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
            </div>           
         </div>



        <!-- 페이지네이션 -->
        <div id="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${i == pageNum}">
                        <span><strong>${i}</strong></span>
                    </c:when>
                    <c:otherwise>
                        <a href="/map?keyword=${keyword}&pageNum=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>




<!--서점 상세 정보 모달 -->
<div id="storeDetailModal" class="modal" style="display: block;background: #FFF;">
  
    <!-- <button class="favoriteButton" data-user-id="<%= session.getAttribute("userId") %>" data-store-id="<%= request.getAttribute("storeId") %>">
        <%= request.getAttribute("isFavorite") != null && (Boolean) request.getAttribute("isFavorite") ? "즐겨찾기 해제" : "즐겨찾기 추가" %>
    </button> -->
    
    <!-- 로그인 안 되기 때문에 id 임의로 넣었음 -->
    <button class="favoriteButton" id="" data-user-id="customer001" data-store-id="<%=storeId%>">
        <%= ("true".equals(isFavorite)) ? "즐겨찾기 해제" : "즐겨찾기 추가" %>
    </button>
      

    <div class="cls_btn">
        <span class="material-symbols-outlined close-button">close</span>
    </div>
    <div class="modal-content">
    
    
        <div class="storeImgBox">
            <img id="storeImg" src="" alt="">
        </div>

     

        <h1 id="storeName"></h1>
        <h2 id="storeAddr"></h2>
        <p id="storeDescription"></p>
        <p id="storePhone"></p>
    </div>
</div>

        <div class="mapbox" onload="initMap()">
            <div id="gmp-map"></div>
        </div>

       

    </div>  

 

 <script src="/js/mapSearch.js"></script>

<script> 
// 전역 변수 선언 (이거 실행되는거라 지우시면 안됨요..)
var map;
var infoWindow;
var markers = [];
var dbMarkers = [
        <c:forEach var="result" items="${results}" varStatus="loop">
        {
            lat: <c:out value="${result.s_latitude}" default="0"/>,
            lng: <c:out value="${result.s_longitude}" default="0"/>,
            title: '<c:out value="${result.s_storename}"/>',
            description: '<c:out value="${result.s_storedesc}"/>',
            address: '<c:out value="${memberInfos[loop.index].m_addr}"/>'
        }
        <c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];


    let isFavorite = "<%= isFavorite %>";
if (isFavorite === "true") {
    // 즐겨찾기 상태 처리
} else {
    // 즐겨찾기가 아닌 상태 처리
}
</script>
 
    
  </body>

</html>