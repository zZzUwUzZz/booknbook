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
    <jsp:include page="/WEB-INF/views/adminFile/customer.jsp"/>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>
                <hr>
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

            <div class="odtext_01">
                <span class="pagename">RENTAL LIST</span>
            </div>


            <div class="datebox">
                <div>
                    <form action="/mypage/rentallist">
                        <input type="date" id="startDate" name="startDate" required>
                        <label for="startDate">부터</label>
                        <input type="date" id="endDate" name="endDate" required>
                        <label for="endDate">까지</label>
                        <button type="submit">조회</button>
                    </form>
                </div>
            </div>

            <form action="/latefeetopay" method="post">


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
                                        <div onclick="location.href='/mypage/orderdetail/${rItem.o_id}'"
                                            class="td-linked">
                                            #${rItem.o_id}
                                        </div>
                                    </div>

                                    <div class="pTitle">
                                        <div class="pText">주문날짜</div>
                                        <fmt:formatDate value="${rItem.o_date}" pattern="yyyy년 MM월 dd일" ></fmt:formatDate>
                                    </div>

                                    <div class="rItem">
                                        ${rItem.b_title}
                                    </div>

                                    <div class="pStore">
                                        <div class="pText">서점명</div>
                                        ${rItem.s_storename}
                                    </div>
                                    
                                    <div class="pStore">
                                        <div class="pText">배송상태</div>
                                        ${rItem.delivery_status}
                                    </div>

                                    <div class="pDeli">
                                        <div class="pText">대여상태</div>
                                        <c:choose>
                                            <c:when test="${rItem.rental_status eq '연체'}">
                                                <span style="color: rgb(255, 60, 0);">${rItem.rental_status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${rItem.rental_status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="pDeli">
                                        <div class="pText">반납기한일</div>
                                        <c:choose>
                                            <c:when test="${!empty rItem.r_duedate}">
                                                <fmt:formatDate value="${rItem.rental_status}" pattern="yyyy년 MM월 dd일" />
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="pRe">
                                        <div class="pText">총 연체료</div>
                                        <c:choose>
                                            <c:when test="${rItem.rental_status eq '반납완료' && rItem.r_latefee_paid eq 'N'}">
                                                <span title="연체료를 납부해주세요." style="color: rgb(255, 60, 0);">
                                                    <fmt:formatNumber value="${rItem.r_latefee_total}" type="number"
                                                        pattern="#,##0" />원</span>
                                            </c:when>
                                            <c:when test="${!empty rItem.r_latefee_total}">
                                                    <fmt:formatNumber value="${rItem.r_latefee_total}" type="number"
                                                        pattern="#,##0" />원</span>
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </div>


                                    <div class="rtTitle01">
                                        <div class="pText">납부일자</div>
                                        <c:choose>
                                            <c:when test="${!empty rItem.r_latefee_paydate}">
                                                <fmt:formatDate value="${rItem.r_latefee_paydate}" pattern="yyyy년 MM월 dd일" />
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </div>


                                    <div class="ckContain">

                                        <c:choose>
                                            <c:when
                                                test="${rItem.rental_status eq '반납완료' && rItem.r_latefee_paid eq 'N'}">
                                                <input type="checkbox" class="ckbox" name="r_idList"
                                                    value="${rItem.r_id}">
                                                <label for="ckbox"></label>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="ckbox" disabled>
                                                <label for="ckbox"></label>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </article>
                            </div>

                        </c:forEach>
                    </c:if>
                </div> <!-- rentListContain div 태그 종료 -->

                <div class="btnbox01">
                                    <div>
                                        <div class="pagebox">${pageHtml}</div>
                                    </div>

                                    <c:if test="${!empty rList}">
                                        <div class="btnbox">
                                            <button type="submit" id="submit" class="exbtn" disabled>연체료납부</button>
                                        </div>
                                    </c:if>
                                </div>
            </form> <!-- form 태그 종료 -->



        </div>
    
    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>
        
        let m = '${msg}'
        if (m != '') { alert(m) }

        $(document).ready(()=>{
            $('input[type="checkbox"]').change(function() {
                if ($('input[type="checkbox"]:checked').length > 0) {
                    $('.exbtn').prop('disabled', false);
                } else {
                    $('.exbtn').prop('disabled', true);
                }
            });
        })        
    
        </script>

</body>

</html>