<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
Integer storeIdObj = (Integer) request.getAttribute("storeId");
int storeId = (storeIdObj != null) ? storeIdObj.intValue() : 0; // 0은 기본값

Integer isFavoriteObj = (Integer) request.getAttribute("isFavorite");
int isFavorite = (isFavoriteObj != null) ? isFavoriteObj.intValue() : 0; // 0은 기본값
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABg7GBJJBgt8BMt0MG6VCZdwbwLU0KTJI&callback=initMap&libraries=&v=weekly" defer></script>


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
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/map.css">
 
<script type="text/javascript">
    const userId = "${sessionScope.loggedInUser}";
    const isLoggedIn = "${sessionScope.isLoggedIn}" === "true";
  </script>
</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>


        <div class="mapContainer">

            <div class="mapSearchBox">

                <form id="mapSearchForm">
                    <div class="ms_sc">
                        <input class="mapscstore" id="mapscInput"
                            onkeydown="if (event.key === 'Enter') window.location.href='/map?keyword=' + document.getElementById('mapscInput').value"
                            type="text" name="keyword" placeholder="장소, 서점명 검색">
                    </div>
                </form>


                <div class="maplist">
                    <div class="map_rs">
                        <span>${keyword}</span> <span>검색결과</span> <span>총 ${totalItems}건</span>
                    </div>
                    <c:forEach var="store" items="${results}">
                       
                    <div class="bs_item" data-store-id="${store.s_id}" data-lat="${store.s_latitude}" data-lng="${store.s_longitude}">            
                            <!-- 이미지 출력 -->
                            <div class="bs_itempf" data-lat="${store.s_latitude}" data-lng="${store.s_longitude}">
                                <c:forEach var="imageInfo" items="${imageInfos}">
                                    <c:if test="${imageInfo.sf_s_id == store.s_id}">
                                        <img src="<c:url value='/uploads/${imageInfo.sf_sysname}' />" 
                                        alt="${store.s_storename}">
                                    </c:if>
                                </c:forEach>
                            </div>


                            <!-- 서점 이름과 소개 -->
                            <div class="bs_infottbox">
                                <div class="bs_iteminfo">
                                    ${store.s_storename}
                                </div>
                                <!-- 주소와 연락처 -->
                                <div class="bs_itemcontact">
                                    <c:forEach var="memberInfo" items="${memberInfos}">
                                        <c:if test="${memberInfo.m_id == store.s_id}">
                                            ${memberInfo.m_addr}
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                </div>


                <!-- 페이지네이션 -->
                <div id="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == pageNum}">
                                <span class="num"><strong>${i}</strong></span>
                            </c:when>
                            <c:otherwise>
                                <a href="/map?keyword=${keyword}&pageNum=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

            </div> <!-- mapSearchBox 끝 -->
 
            <!--서점 상세 정보 모달 -->
            <div id="storeDetailModal" class="modal" style="display: block;background: #FFF;">

                 <div class="favoriteButton" id="favoriteButton_<%=storeId%>" data-store-id="${storeId}" data-user-id="${userId}">
                </div>

                <div class="cls_btn">
                    <span class="material-symbols-outlined close-button">close</span>
                </div>
                <div class="modal-content">

                    <div class="imgef"></div>
                    <div class="storeImgBox">
                        <img id="storeImg" src="" alt="">
                    </div>
                    <div class="bsinfotext">
                        <h1 id="storeName"></h1>
                    
                        <div class="storebtn01">
                       
                        <span class="material-symbols-outlined">home</span>
                        <a href="/bookstore/detail/${sellerId}">서점 방문하기 </a>

                        </div>
                        </a>
                        <h2 id="storeAddr"></h2>
                        <p id="storeDescription"></p>
                        <p id="storePhone"></p>
                        
                    </div>
                </div>
            </div>

            <div class="mapbox" onload="initMap()">
                <div id="gmp-map"></div>
            </div>

        </div>


    
<script>
 
    // 전역 변수 선언 (이거 실행되는거라 지우시면 안됨요..)
    var map;
    var infoWindow;
    var markers = [];
    var dbMarkers = [
        <c:forEach var="result" items="${results}" varStatus="loop">
            {
                lat: <c:out value="${result.s_latitude}" default="0" />,
            lng: <c:out value="${result.s_longitude}" default="0" />,
            title: '<c:out value="${result.s_storename}" />',
            description: '<c:out value="${result.s_storedesc}" />',
            address: '<c:out value="${memberInfos[loop.index].m_addr}" />'
        }
            <c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];
 
</script>

<script src="/js/mapSearch.js"></script>
 <script src="/js/fav.js"></script>


  </body>
 
</html>