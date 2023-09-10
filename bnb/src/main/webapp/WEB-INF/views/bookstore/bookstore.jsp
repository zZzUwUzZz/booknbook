<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h2>${entry.s_storename}</h2>
                        <img src="<c:url value='/uploads/${entry.sf_sysname}' />">
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <button id="prev">Previous</button>
        <button id="next">Next</button>
    </div>


 </main>

    <%@include file="/WEB-INF/tiles/footer.jsp" %>

    <script src="/js/bookstore/bookstore.js"></script>

</body>
</html>