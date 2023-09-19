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

    <title>REPORT BOARD</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/adminFile/Admin.jsp"/>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/admin">관리자페이지 홈</a></li>
                <hr>
                <li><a href="/admin/reportlist" id="currpage">독립서점 제보</a></li>
                <li><a href="/admin/sellerlist">서점회원 리스트</a></li>
                <li><a href="/admin/customerlist">일반회원 리스트</a></li>
            </ul>
        </div>

        <div class="board-area">
            
            <div>
                <h2 class="pagename">REPORT BOARD</h2>
            </div>

            <div>
                <div class="searchbox narrow_box">
                    <select id="sel">
                        <option value="report_title" selected>제목</option>
                        <option value="report_content">내용</option>
                    </select>
                    <input type="text" id="keyword">
                    <button id="search">검색</button>
                </div>
            </div>

            <div>
                <div class="tablebox narrow_box">
                <table class="narrow_table">
                    <tr class="headrow">
                        <th width="80px">No.</th>
                        <th>글제목</th>
                        <th>작성일</th>
                    </tr>

                    <c:if test="${empty reportList}">
                        <tr>
                            <td colspan="3">제보가 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty reportList}">
                        <c:forEach var="report" items="${reportList}">
                            <tr>
                                <td>${report.report_id}</td>
                                <td onclick="location.href='/admin/reportdetail/${report.report_id}'" class="td-linked">${report.report_title}</td>
                                <td><fmt:formatDate value="${report.report_date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

            <div>
                <div class="pagebox narrow_box">${pageHtml}</div>
            </div>

        </div>

        <div class="button-area">

            <!-- <div class="buttons"></div>
            <div class="buttons"></div> -->

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


	<script>

		//검색기능
		$('#search').click(function () {

			let keyword = $('#keyword').val();
			if (keyword == ''){
				alert('검색어를 입력하세요');
				return;
			}

			let select = $('#sel').val(); //report_title or report_content
			console.log(keyword, select);
			location.href='/admin/reportlist?colname='+select+'&keyword='+keyword
					      +"&pageNum=1";
			//localhost/board/list?colname=b_title&keyword=33&pageNum=1
			
		}); //click end

	</script>


</body>

</html>