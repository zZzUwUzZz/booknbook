<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer MyPage</title>
    <!-- 스타일 및 스크립트 추가 (필요에 따라) -->
</head>
<body>
    <c:choose>
        <c:when test="${sessionScope.M_ROLE == 'USER'}">
            <!-- USER 권한을 가진 사용자일 경우의 내용 -->
            <!-- MyPage에 대한 추가적인 내용 및 기능 -->
        </c:when>
        <c:otherwise>
            <!-- USER 권한을 가지지 않은 사용자일 경우의 내용 -->
            <script>
                alert('풉 °˖✧◝(⁰▿⁰)◜✧˖°키 ');
                
                window.location.href = "/";
            </script>
        </c:otherwise>
    </c:choose>
</body>
</html>