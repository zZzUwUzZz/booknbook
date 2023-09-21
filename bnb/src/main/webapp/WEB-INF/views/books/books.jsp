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
            <script src="/js/main.js"></script>
            <script src="/js/search.js"></script>
        </head>

        <body>

            <%@include file="/WEB-INF/tiles/header.jsp" %>
          
            <div class="bookListContainer">

              <div class="catetext">
                <h4>${category_m_id} ${category_s_id}</h4>
              </div>
              
             <div class="cateContain">    
                <c:forEach var="mediumCategory" items="${mediumCategories}" varStatus="loop">
                    <div class="medium-category 
                        <c:if test="${mediumCategory.category_m_id == category_m_id || mediumCategory.category_m_id == category_s_id}">selected</c:if>" 
                        id="medium-category-${loop.index}">
                        <a href="/books/category/medium/${mediumCategory.category_m_id}"
                            class="<c:if test="${mediumCategory.category_m_id == category_m_id}">selected-link</c:if>">
                            ${mediumCategory.category_m}
                        </a>
                        <div class="small-categories" id="small-categories-${loop.index}">
                            <c:forEach var="smallCategory" items="${smallCategories}">
                                <c:if test="${smallCategory.category_m_id == mediumCategory.category_m_id}">
                                    <div class="<c:if test="${smallCategory.category_s_id == category_s_id}">selected</c:if>">
                                        <a href="/books/category/small/${smallCategory.category_s_id}">
                                            ${smallCategory.category_s}
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>           
            </div>
            

            

                <div class="bk_tt">
                  <p class="totalct">전체 ${totalItems}개</p>
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

                <%@include file="/WEB-INF/tiles/footer.jsp" %>
                <script src="/js/books.js"></script>

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

        </html>