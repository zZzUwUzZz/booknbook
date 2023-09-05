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

 
<!-- 모달 구조 예시 -->
<div id="storeDetailModal" class="modal" style="display: block;background: #FFF;">
    <div class="modal-content">
      <span class="close-button">&times;</span>
      <h2 id="storeName"></h2>
      <p id="storeDescription"></p>
    </div>
  </div>
  


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
            <div class="bs_itempf">
                <c:forEach var="imageInfo" items="${imageInfos}">
                    <c:if test="${imageInfo.sf_s_id == store.s_id}">
                        <img src="<c:url value='/uploads/${imageInfo.sf_sysname}' />" alt="${store.s_storename}">
                    </c:if>
                </c:forEach>
            </div>
            <!-- 서점 이름과 소개 -->
            <div class="bs_iteminfo">
                ${store.s_storename} <br>
                ${store.s_storedesc} <br>
            </div>
            <!-- 주소와 연락처 -->
            <div class="bs_itemcontact">
                <c:forEach var="memberInfo" items="${memberInfos}">
                    <c:if test="${memberInfo.m_id == store.s_id}">
                        Address: ${memberInfo.m_addr} <br>
                        Phone: ${memberInfo.m_phone} <br>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
            </div>
 
         </div>

 
        <div class="mapbox" onload="initMap()">
            <div id="gmp-map"></div>
        </div>

    </div>  

 

 <script src="/js/mapSearch.js"></script>

 <script type="text/javascript"> 
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
</script>
 
    
  </body>

</html>