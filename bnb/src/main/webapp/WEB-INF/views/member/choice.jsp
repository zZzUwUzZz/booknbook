<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/member/choice.css">
 
  <title>Static Folded Book with Choices</title>
</head>
<body>
  
  <div class="header"></div>
  
  <div class="books-container">
    <div class="book">
      <div class="cover">
        <div class="page1">
          <div class="content">
            <h2>Left Choice</h2>
            <p><a href="/member/join">개인회원</a></p>
          </div>
        </div>
      </div>
    </div>
    <div class="book">
      <div class="cover">
        <div class="page2">
          <div class="content">
            <h2>Right Choice</h2>
            <p><a href="/member/join2">사업자 회원</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</body>
<%@include file="/WEB-INF/tiles/footer.jsp" %>
</html>