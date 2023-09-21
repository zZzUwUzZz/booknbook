<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cjcs.bnb.dto.BookDto" %>

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
        <link rel="stylesheet" href="/css/books.css">
        <link rel="stylesheet" href="/css/bookstore/bookstore.css">
        <link rel="stylesheet" href="/css/bookstore/bookstoreDetail.css">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="/js/main.js"></script>
        <script src="/js/search.js"></script>

 

    </head>

    <%@include file="/WEB-INF/tiles/header.jsp" %>
 

<body>
   
    <main>

        <section class="stContain01" style="background-image:url(/uploads/${sellerFile.sf_sysname})">

            <div class="stinfoBox">
                <div class="stinfoBox02">
                    <strong class="stText02">
                        ${seller.s_storename}
                     </strong>
                    <div class="stText03">
                        <div class="stText04">
                            <div class="stText05">
                                ${seller.s_storedesc}
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


        <div class="bookListContainer">

    
            <div class="bk_tt">
              <p class="totalct">총 ${totalItems}개의 도서</p>
            </div>  
            <ul class="bk_list">
              <c:forEach var="book" items="${books}">
                <li class="bk_item">
                  <div class="bk_area">
                    <a href="<c:url value='/books/detail/${book.b_isbn}/${book.b_s_id}'/>">
                      <div class="bkimgbox">
                      
                        <div class="statusText" data-salestock="${book.b_salestock}" data-rentalstock="${book.b_rentalstock}">
                            <label class="statusText_2"></label>
                            <label class="statusText_3"></label>
                        </div>
                   
                        <img src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/${book.b_isbn}.jpg" alt="${book.b_title}">
                      </div>
                    </a>
                    <div class="bk_item_text"><b>${book.b_title}</b><br>
                   <b>  <fmt:formatNumber value="${book.b_price}" type="number" pattern="#,###" /></b><span>원</span></div>
                  </div>
                </li>
              </c:forEach>
            </ul>


            <div class="pagination">
              <c:choose>
                  <c:when test="${not empty category_m_id}">
                      <c:forEach var="i" begin="1" end="${totalPages}">
                          <a href="<c:url value='/books/category/medium/${category_m_id}?page=${i}' />" 
                             class="${i == currentPage ? 'active' : ''}">${i}</a>
                      </c:forEach>
                  </c:when>
                  <c:otherwise>
                      <c:forEach var="i" begin="1" end="${totalPages}">
                          <a href="<c:url value='/books?page=${i}' />" 
                             class="${i == currentPage ? 'active' : ''}">${i}</a>
                      </c:forEach>
                  </c:otherwise>
              </c:choose>
          </div>
        
          </div> 


    </main>

   
    <script src="/js/bookstore/bookstore.js"></script>

<script>


$(document).ready(function() {
  $(".statusText").each(function() {
    const saleStock = parseInt($(this).data('salestock'));
    const rentalStock = parseInt($(this).data('rentalstock'));

    const statusText2 = $(this).find('.statusText_2');
    const statusText3 = $(this).find('.statusText_3');

    // 초기 상태: 모든 텍스트와 스타일을 숨김
    statusText2.hide();
    statusText3.hide();
    statusText3.css('background-color', '');

    // 판매 수량 0개 + 대여 수량 1개 이상
    if (saleStock <= 0 && rentalStock >= 1) {
      statusText2.text('품절').show();
      statusText3.hide();
    }

    // 판매 수량 1개 이상 + 대여 수량 0개
    else if (saleStock >= 1 && rentalStock <= 0) {
      statusText2.hide();
      statusText3.text('대여중').show();
      statusText3.css('top', '-138px');
    }

    // 판매 수량 0개 + 대여 수량 0개
    else if (saleStock <= 0 && rentalStock <= 0) {
      statusText2.text('품절').show();
      statusText3.text('대여중').css('background-color', 'rgb(231, 86, 2)').show();
      statusText3.css('top', '-113px');
    }
  });
});


</script>


</body>

<%@include file="/WEB-INF/tiles/footer.jsp" %>

</html>