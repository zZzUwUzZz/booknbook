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
    <link rel="stylesheet" href="/css/customer/list.css">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>SELLER LIST</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/admin">관리자페이지 홈</a></li>
                <hr>
                <li><a href="/admin/reportlist">독립서점 제보</a></li>
                <li><a href="/admin/sellerlist" id="currpage">서점회원 리스트</a></li>
                <li><a href="/admin/customerlist">일반회원 리스트</a></li>
            </ul>
        </div>

        <div class="board-area">
            
            <div>
                <h2 class="pagename">SELLER LIST</h2>
            </div>

            <div>
                <div class="searchbox">
                    <select id="sel">
                        <option value="m_id" selected>ID</option>
                        <option value="s_storename">서점명</option>
                    </select>
                    <input type="text" id="keyword">
                    <button id="search">검색</button>
                </div>
            </div>

            <div>
                <div class="tablebox">
                    <table>
                        <tr class="headrow">
                            <th>ID</th>
                            <th>서점명</th>
                            <th width="100px">사업자번호</th>
                            <th>주소</th>
                            <th width="120px">전화번호</th>
                            <th width="230px">이메일</th>
                            <th width="110px">입점일자</th>
                        </tr>

                        <c:if test="${empty sellerList}">
                            <tr>
                                <td colspan="7">입점한 서점이 없습니다.</td>
                            </tr>
                        </c:if>
                    
                        <c:if test="${!empty sellerList}">
                            <c:forEach var="seller" items="${sellerList}">
                                <tr>
                                    <td><span>${seller.m_id}</span></td>
                                    <td onclick="location.href='/bookstore/${seller.m_id}'" class="td-linked"><span>${seller.s_storename}</span></td>
                                    <td>${seller.s_crn}</td>
                                    <td><span>${seller.m_addr}</span></td>
                                    <td>${seller.m_phone}</td>
                                    <td>${seller.m_email}</td>
                                    <td><fmt:formatDate value="${seller.m_joindate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                </tr>
                                </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>

            <div>
                <div class="pagebox">${pageHtml}</div>
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

			let select = $('#sel').val(); //m_id or s_storename
			console.log(keyword, select);
			location.href='/admin/sellerlist?colname='+select+'&keyword='+keyword
					      +"&pageNum=1";
			
		}); //click end

	</script>

</body>

</html>