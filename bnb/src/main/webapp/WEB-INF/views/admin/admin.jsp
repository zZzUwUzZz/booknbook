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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400&family=Noto+Sans+KR:wght@400&family=Space+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/adminmain.css">
     

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>ADMIN PAGE</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/adminFile/Admin.jsp"/>

    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/admin" id="currpage">관리자페이지 홈</a></li>
                <hr>
                <li><a href="/admin/reportlist">독립서점 제보</a></li>
                <li><a href="/admin/sellerlist">서점회원 리스트</a></li>
                <li><a href="/admin/customerlist">일반회원 리스트</a></li>
            </ul>
        </div>

        <div class="board-area" id="board-area-flexible">
            
            <div>
                <h2 class="pagename">ADMIN PAGE</h2>
            </div>

            <div class="container-1">

                <div class="container-2">
    
                    <div class="container-3 card-main cards">

                        <h3>카테고리 관리 🏷️</h3>

                        <div class="category_add_box">
                            <h4>· 중분류 추가하기&nbsp;</h4>
                            <form action="/admin/categoryadd">
                                <input type="text" name="category_m_id" placeholder="중분류코드" style="width: 67px">
                                <input type="text" name="category_m" placeholder="중분류명" style="width: 100px">
                                <button type="submit">추가</button>
                            </form>
                            <br>
                            <h4>· 소분류 추가하기&nbsp;</h4>
                            <form action="/admin/categoryadd">
                                <select name="category_m" style="width: 75px">
                                    <c:forEach var="nameM" items="${categoryNamesM}">
                                        <option value="${nameM.category_m}">${nameM.category_m}</option>
                                    </c:forEach> 
                                </select>
                                <input type="text" name="category_s_id" placeholder="소분류코드" style="width: 67px">
                                <input type="text" name="category_s" placeholder="소분류명" style="width: 100px">
                                <button type="submit">추가</button>
                            </form>
                        </div>

                        <div class="category_delete_box">
                            <h4>· 아래에서 카테고리를 선택하여 삭제할 수 있습니다.</h4>
                            <div clas="category_box">
                                <c:if test="${empty categoryNames}">
                                    <p>카테고리가 없습니다.</p>
                                </c:if>
                            
                                <c:if test="${!empty categoryNames}">
                                    <c:forEach var="nameM" items="${categoryNamesM}">
                                        <div>
                                            <p onclick="delete_category_m('${nameM.category_m}')" class="categories">&nbsp;${nameM.category_m}</p>
                                        </div>
                                        <div>
                                            <c:forEach var="nameS" items="${categoryNames.get(nameM.category_m)}">
                                                <span onclick="delete_category_s('${nameS.category_s_id}')" class="categories_s categories">${nameS.category_s} (${nameS.category_s_id}) </span>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- <div class="container-3 card-button cards" onclick="location.href='/mypage/info'">
                        나의 회원정보
                    </div> -->

                </div>
    
                <div class="container-2">
    
                    <div class="container-3 card-top cards">

                        <h3>BOOK N BOOK 통계 📜</h3>
                        <h4 class="stats">· 총 입점서점 수 :<a href="/admin/sellerlist">&nbsp;&nbsp;${num_of_seller}</a></h4>
                        <h4 class="stats">· 총 일반회원 수 : <a href="/admin/customerlist">&nbsp;&nbsp;${num_of_customer}</a></h4>
                        <h4 class="stats">· 총 주문 건수 : &nbsp;${num_of_order}</h4>
                        <br>
                        <h4 class="stats">· 총 대여항목 수 : &nbsp;${num_of_rentalItem}</h4>
                        <h4 class="stats">· 총 구매항목 수 : &nbsp;${num_of_purchaseItem}</h4>
                    </div>
                    
                    <div class="container-3 card-bottom cards">

                        <h3>대여도서 반납 상습 연체자 (최근 3개월 내 3회 이상) 🔥</h3>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th width="110px">총 연체횟수</th>
                                <th width="110px">총 연체료</th>
                            </tr>

                            <c:if test="${empty blackList}">
                                <tr>
                                    <td colspan="4">상습 연체 회원이 없습니다.</td>
                                </tr>
                            </c:if>
                
                            <c:if test="${!empty blackList}">
                                <c:forEach var="blackMem" items="${blackList}">
                                    <tr>
                                        <td>${blackMem.id}</td>
                                        <td>${blackMem.name}</td>
                                        <td>${blackMem.overdues}</td>
                                        <td>${blackMem.latefee}</td>
                                    </tr>
                                    </c:forEach>
                            </c:if>
                        </table>

                    </div>

                </div>
    
            </div>

        </div>

        <div class="button-area">

            <!-- <div class="buttons"></div>
            <div class="buttons"></div> -->

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

    
    <script>

        function delete_category_m(category_m) {

            let conf = confirm('\n이 카테고리를 삭제할까요?\n⚠️\n해당 카테고리 및 하위 카테고리까지\n비어있는 경우에만 삭제 가능합니다.');
                
            if (conf == true) {
                location.href="/admin/categorymdelete/" + category_m;
            }
        }

        function delete_category_s(category_s_id) {

            let conf = confirm('\n이 카테고리를 삭제할까요?\n⚠️\n빈 카테고리만 삭제 가능합니다.');
                
            if (conf == true) {
                location.href="/admin/categorysdelete/" + category_s_id;
            }
        }

    </script>

</body>

</html>