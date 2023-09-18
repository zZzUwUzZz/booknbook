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
    <link rel="stylesheet" href="/css/customer/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist" id="currpage">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>


    <form action="/mypage/refundexchange" method="GET">

        <div class="board-area">

            <div class="pctext_01">
                <span class="pagename">PURCHASE LIST</span>
            </div>


          
            <div class="PcListBox">

                    <div class="datebox">
                <div>
                <form action="/mypage/purchaselist">
                    <input type="date" id="startDate" name="startDate" required>
                    <label for="startDate">부터</label>
                    <input type="date" id="endDate" name="endDate" required>
                    <label for="endDate">까지</label>
                    <button type="submit">조회</button>
                </form>
                </div>
            </div>

          
            <c:if test="${empty pList}">
                <h4>주문내역이 없습니다.</h4>
            </c:if>
            
            <c:if test="${!empty pList}">
                <c:forEach var="pItem" items="${pList}">
                    <div class="pListContain">
                        <article class="pItemBox">
                            <div class="pTitle">
                                <div class="pText">
                                    주문번호</div>
                                <div onclick="location.href='/mypage/orderdetail/${pItem.o_id}'" class="td-linked">#${pItem.o_id}
                                </div>
                            </div>
            
                            <div class="pTitle">
                                <div class="pText">주문날짜</div>
                                <fmt:formatDate value="${pItem.o_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
                            </div>
            
                            <div class="pItem">
                                <!--  <div class="pText">주문품목</div> -->
                                ${pItem.b_title}
                            </div>
            
                            <div class="pCount">
                                <div class="pText">수량</div>
                                ${pItem.p_amount}권
                            </div>
            
                            <div class="pStore">
                                <div class="pText">서점명</div>
                                ${pItem.s_storename}
                            </div>
            
                            <div class="pDeli">
                                <div class="pText">배송상태</div>
                                ${pItem.delivery_status}
                            </div>
            
                            <div class="pRe">
                                <div class="pText">교환/반품 이력</div>
                                ${pItem.re_sort}
                                ${pItem.re_amount}
                            </div>

                            <c:choose>
                                <c:when
                                    test="${(pItem.p_delivery_status_id eq 4 || pItem.p_delivery_status_id eq 6 || pItem.p_delivery_status_id eq 7)&& (empty pItem.re_amount)}">
                            
                                        <div class="ckContain">
                                    <input type="checkbox" class="ckbox" name="p_idList" value="${pItem.p_id}">
                                    <label for="ckbox"></label>
                                </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="ckContain">
                                    <input type="checkbox" class="ckbox" name="p_idList" value="${pItem.p_id}" disabled>
                                    <label for="ckbox"></label>
                                </div>
                                </c:otherwise>
                            </c:choose>
                   
                    </article>
                    </div>
            
                </c:forEach>
            </c:if>

  
 
            </div>
      


            <div>
                <div class="pagebox">${pageHtml}</div>
            </div>


            <c:if test="${!empty pList}">
                <div class="btnbox">
                    <button type="submit" id="submit" disabled>교환/반품신청</button>
                </div>
            </c:if>

            </form>
            
        </div>

     

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    $(document).ready(()=>{

        $('input[type="checkbox"]').change(function() {

            if ($('input[type="checkbox"]:checked').length > 0) {
                $('#submit').prop('disabled', false);
            } else {
                $('#submit').prop('disabled', true);
            }

        });

    })        

    </script>


</body>

</html>