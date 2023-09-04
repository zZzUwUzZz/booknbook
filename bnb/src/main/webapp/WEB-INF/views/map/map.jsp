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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/main.js"></script>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABg7GBJJBgt8BMt0MG6VCZdwbwLU0KTJI&callback=initMap&libraries=&v=weekly"
        defer></script>


</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>

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
                    <span>${imageInfo.sf_s_id}</span>
                    <span>${imageInfo.sf_s_id}</span>
                    <span>${store.s_id}</span>
                </div>


                <c:forEach var="store" items="${results}">
                    <div class="bs_item">
                        <div class="bs_itempf">
                            <c:forEach items="${imageInfos}" var="imageInfo">
                                <c:if test="${imageInfo.sf_s_id == store.s_id}">
                                    <img src="<c:url value='/uploads/${imageInfo.sf_sysname}' />"
                                        alt="${store.s_storename}">
                                </c:if>
                            </c:forEach>
                        </div>
                        ${store.s_storename} <br>
                        ${store.s_storedesc}
                    </div>
                </c:forEach>
            </div>
        </div>




        <div class="mapbox" onload="initMap()">
            <div id="gmp-map"></div>
        </div>

    </div>


 <script src="/js/mapSearch.js"></script>

</body>

</html>