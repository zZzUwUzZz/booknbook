<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
// 현재 날짜와 시간을 가져옵니다.
Date currentDate = new Date();

// 날짜와 시간을 원하는 형식으로 변환합니다.
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
String formattedDate = dateFormat.format(currentDate);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
</head>
<body>
    <div>
        
    </div>
</body>
</html>