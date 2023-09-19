<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
</head>
<body>
    <c:choose>
        <c:when test="${sessionScope.M_ROLE == 'ADMIN'}">
            <!-- ADMIN 권한을 가진 사용자일 경우의 내용 -->
        </c:when>
        <c:otherwise>
            <!-- ADMIN 권한을 가지지 않은 사용자일 경우의 내용 -->
            <script>
                     alert('님 접근 못함ㅋ_ㅋ');
                window.location.href = "/";
            </script>
        </c:otherwise>
    </c:choose>
</body>
</html>