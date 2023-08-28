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

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>
</head>

<body>

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
        </div>

        <div class="bnb_list">

            <div class="list_tt">독립서점 둘러보기</div>


            <div class="slider">
                <div class="slide-container">
                  
                    <div class="slide">
                        <img src="/images/1.jpg" alt="Product 1">
                        <p>서점 이름</p>
                    </div>
                    <div class="slide">
                        <img src="/images/2.jpg" alt="Product 2">
                        <p>서점 이름</p>
                    </div>
                    <div class="slide">
                        <img src="/images/3.jpg" alt="Product 3">
                        <p>서점 이름</p>
                    </div>
                    <div class="slide">
                        <img src="/images/4.jpg" alt="Product 4">
                        <p>서점 이름</p>
                    </div>

                    <!-- Add more slides as needed -->
                </div>
                <button class="prev-btn">Previous</button>
                <button class="next-btn">Next</button>
            </div>


        </div>

    </div> <!-- main end -->

    <%@include file="/WEB-INF/tiles/footer.jsp" %>

</body>

</html>