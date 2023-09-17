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
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist" id="currpage">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <form action="/payment" method="post">

                <div class="odtext_01">
                <span class="pagename">RENTAL LIST</span>
            </div>

            <div class="rentListContain">

                <c:if test="${empty rList}">
                    <h4>대여내역이 없습니다.</h4>
                </c:if>
            
                <c:if test="${!empty rList}">
                    <c:forEach var="rItem" items="${rList}">
                        <div class="rListBox">
                            <article class="rItemBox">
                                <div class="pTitle">
                                    <div class="pText">
                                        주문번호</div>
                                    <div onclick="location.href='/mypage/orderdetail/${rItem.o_id}'" class="td-linked">
                                        #${rItem.o_id}
                                    </div>
                                </div>
            
                                <div class="pTitle">
                                    <div class="pText">주문날짜</div>
                                    <fmt:formatDate value="${rItem.o_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
                                </div>
            
                                <div class="rItem">
                                     ${rItem.b_title}
                                </div>
            
                                <div class="pStore">
                                    <div class="pText">서점명</div>
                                    ${rItem.s_storename}
                                </div>
            
                                <div class="pDeli">
                                    <div class="pText">대여상태</div>
                                    ${rItem.rental_status}
                                </div>
            
                                <div class="pRe">
                                    <div class="pText">총 연체료</div>
                                    <fmt:formatNumber value="${rItem.r_latefee_total}" type="number" pattern="#,##0" />
                                </div>
            
                                <div class="pTitle">
                                    <div class="pText">납부일자</div>
                                    <fmt:formatDate value="${rItem.r_latefee_paydate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
                                </div>
            
            
                                <c:choose>
                                    <c:when
                                        test="${rItem.r_rental_status_id eq 3 && not empty rItem.r_latefee_total && rItem.r_latefee_paid ne 'Y'}">
                                        <td>
                                            <div class="ckContain">
                                                <input type="checkbox" class="ckbox" name="p_idList" value="${rItem.p_id}">
                                                <label for="ckbox"></label>
                                            </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="ckContain">
                                            <input type="checkbox" class="ckbox" name="p_idList" value="${rItem.p_id}" disabled>
                                            <label for="ckbox"></label>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
            
                            </article>
                        </div>
            
                    </c:forEach>
                </c:if>
            
            </div>




            <div class="btnbox">
                <button type="submit" id="submit" disabled>연체료납부</button>
            </div>

            </form>
          
          
            <div class="button-area">
                <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', -1)">
                    <span class="material-symbols-sharp">
                        chevron_left
                    </span>
                </div>
                <div class="buttons" onclick="shiftPage('${currentPage}', '${numOfPages}', 1)">
                    <span class="material-symbols-sharp">
                        chevron_right
                    </span>
                </div>

            </div>
    
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