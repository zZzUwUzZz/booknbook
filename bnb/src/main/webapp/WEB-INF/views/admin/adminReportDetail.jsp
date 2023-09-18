<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/board.css">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>REPORT DETAIL</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/admin">관리자페이지 홈</a></li>
                <hr>
                <li><a href="/admin/reportlist">독립서점 제보</a></li>
                <li><a href="/admin/sellerlist">서점회원 리스트</a></li>
                <li><a href="/admin/customerlist">일반회원 리스트</a></li>
            </ul>
        </div>

        <div class="board-area" id="board-area-flexible">
            
            <div>
                <h2 class="pagename">REPORT DETAIL</h2>
            </div>

            <div>
                <div class="tablebox">
                <table>
                    <tr>
                        <td class="th" width="100px">글번호</td>
                        <td class="info_td" width="180px">${rbDto.report_id}</td>
                        <td class="th" width="100px">작성일</td>
                        <td class="info_td"><fmt:formatDate value="${rbDto.report_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    </tr>
                    <tr>
                        <td class="th">글제목</td>
                        <td colspan="3" class="info_td">${rbDto.report_title}</td>
                    </tr>
                    <tr>
                        <td colspan="4" class="content_td">${rbDto.report_content}</td>
                    </tr>
                </table>
                </div>
            </div>

            <div class="buttonbox">
                <button onclick="location.href='/admin/reportlist'">목록으로</button>
                <button onclick="delete_post('${rbDto.report_id}')">삭제하기</button>
            </div>

        </div>

        <div class="button-area">

            <!-- <div class="buttons"></div>
            <div class="buttons"></div> -->

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    function delete_post(report_id) {

        let conf = confirm('글을 삭제할까요?');

        if (conf == true) {
            location.href = '/admin/reportdelete/' + report_id;
        }

    }

    </script>

</body>

</html>