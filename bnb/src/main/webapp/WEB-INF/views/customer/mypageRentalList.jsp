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
     
                              <c:choose>
                                 <div class="pDeli">
                                    <div class="pText">대여상태</div>
                                    <c:when test="${rItem.rental_status eq '연체'}">
                                    </c:when>
                                    <c:otherwise>
                                        ${rItem.rental_status}
                                    </c:otherwise>
                                   </div>
                                </c:choose>
                              
                              
                              
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

                                          
     <!--
            <div>
                <h2 class="pagename">RENTAL LIST</h2>
            </div>

           

            <div>
                <div class="tablebox">
                <table>
                    <tr class="headrow">
                        <th width="90px">주문번호</th>
                        <th width="140px">주문일자</th>
                        <th>도서명</th>
                        <th>서점명</th>
                        <th width="100px">대여상태</th>
                        <th width="100px">반납기한</th>
                        <th width="70px">연체료</th>
                        <th width="100px">납부일자</th>
                        <th width="40px"></th>
                    </tr>

                    <c:if test="${empty rList}">
                        <tr>
                            <td colspan="9">대여내역이 없습니다.</td>
                        </tr>
                    </c:if>
        
                    <c:if test="${!empty rList}">
                        <c:forEach var="rItem" items="${rList}">
                            <tr>
                                <td onclick="location.href='/mypage/orderdetail/${rItem.o_id}'" class="td-linked">${rItem.o_id}</td>
                                <td><fmt:formatDate value="${rItem.o_date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                <td title="${rItem.b_title}"><span>${rItem.b_title}</span></td>
                                <td>${rItem.s_storename}</td>
                                <c:choose>
                                    <c:when test="${rItem.rental_status eq '연체'}">
                                        <td title="먼저 책을 반납하셔야&#013;연체료를 납부하실 수 있어요." style="color: rgb(255, 60, 0);">${rItem.rental_status}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${rItem.rental_status}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td><fmt:formatDate value="${rItem.r_duedate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                <c:choose>
                                    <c:when test="${rItem.rental_status eq '반납완료' && rItem.r_latefee_paid eq 'N'}">
                                        <td title="연체료를 납부해주세요." style="color: rgb(255, 60, 0);"><fmt:formatNumber value="${rItem.r_latefee_total}" type="number" pattern="#,##0"/></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><fmt:formatNumber value="${rItem.r_latefee_total}" type="number" pattern="#,##0"/></td>
                                    </c:otherwise>
                                </c:choose>
                                <td><fmt:formatDate value="${rItem.r_latefee_paydate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                <c:choose>
                                    <c:when test="${rItem.rental_status eq '반납완료' && rItem.r_latefee_paid eq 'N'}">
                                        <td><input type="checkbox" name="r_idList" value="${rItem.r_id}"></td>

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
            
            </div> -->

 
            <div>
                <div class="pagebox">${pageHtml}</div>
            </div>

            <c:if test="${!empty rList}">
                <div class="btnbox">
                    <button type="submit" id="submit" disabled>연체료납부</button>
                </div>
            </c:if>

            </form>
          
          
          
        </div>

 
    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>
        
        let m = '${msg}'
        if (m != '') { alert(m) }

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