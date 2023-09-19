<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/books.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
   
</head>

<body>

    <%@include file="/WEB-INF/tiles/header.jsp" %>
 
    
    <div class="bookListContainer">
        <div class="bk_tt">
            <p class="result_tt"><b>'${keyword}'에 대한 ${totalItems}개의 검색 결과</b></p>
        </div>
        <div class="no-results" style="display:none;">
          <p class="randomemoji"></p><br>
       <div><p>저런, 검색 결과가 없네요..</p></div> 
        </div>

        <ul class="bk_list">
          <c:forEach var="book" items="${books}">
            <li class="bk_item">
              <div class="bk_area">
                <a href="<c:url value='/books/detail/${book.b_isbn}/${book.b_s_id}'/>">
                  <div class="bkimgbox">
                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/150x0/pdt/${book.b_isbn}.jpg" alt="${book.b_title}">
                  </div>
                </a>
                <div class="bk_item_text"><b>${book.b_title}</b><br>
               <b>${book.b_price}원</b></div>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>

      <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="<c:url value='/search?keyword=${keyword}&page=${i}' />" 
               class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
  </div>


<%@include file="/WEB-INF/tiles/footer.jsp" %>

<script>
  var totalItems = ${totalItems}; // JSP 변수를 JavaScript 변수에 할당
</script>
<script src="/js/main.js"></script>
<script src="/js/search.js"></script>
</body>
</html>