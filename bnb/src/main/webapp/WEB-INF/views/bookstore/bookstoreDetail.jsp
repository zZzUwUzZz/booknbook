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
        <link rel="stylesheet" href="/css/bookstore/bookstoreDetail.css">

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

    <%@include file="/WEB-INF/tiles/header.jsp" %>
 

<body>
   
    <main>

        <section class="stContain01" style="background-image:url()">

            <div class="stinfoBox">
                <div class="stinfoBox02">
                    <strong class="stText02">
                        서점명
                     </strong>
                    <div class="stText03">
                        <div class="stText04">
                            <div class="stText05">
                                서점 소개
                            </div>
                        </div>
                    </div>
                    <div class="favstBtn01">
                        <svg class="css-0 elsslkw0" xmlns="http://www.w3.org/2000/svg" width="36" height="30"
                            viewBox="0 0 20 20">
                            <path
                                d="M2.24 3.425a4.758 4.758 0 0 1 6.79 0c.416.421.74.901.971 1.413.23-.512.553-.992.97-1.413a4.758 4.758 0 0 1 6.79 0 4.91 4.91 0 0 1 0 6.88L10 18.166l-7.76-7.863-.166-.176a4.911 4.911 0 0 1 .166-6.703z"
                                fill="none" fill-rule="evenodd" stroke="#ffffff" stroke-width="0.7"></path>
                        </svg>
                        <span class="css-1otmg9t ekoaxff1">999</span>
                    </div>
                </div>
            </div>
        </section>


        
    </main>

   
    <script src="/js/bookstore/bookstore.js"></script>

</body>

<%@include file="/WEB-INF/tiles/footer.jsp" %>

</html>