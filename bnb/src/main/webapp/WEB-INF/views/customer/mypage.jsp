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
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Noto+Sans+KR:wght@600&family=Space+Mono&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <title>MY PAGE - HOME</title>

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
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div class="container-1">

                <div class="container-2">

                    <div class="container-3 card-main cards">

                        <div class="idtext">
                            <span>안녕하세요, <b class="infotext01" onclick="location.href='/mypage/info'">${c_id}</b>님!</span>
                        </div>
                        <div>
                            <h3>최근 나의 관심 서점과 책</h3>
                        </div>
                        <h1></h1>
                        <div class="container-4">
                            <c:if test="${!empty latestFav}">
    
                                <div class="store_img">
                                    <c:choose>
                                        <c:when test="${!empty latestFav.favs_s_id}">
                                            <div class="imgBox">
                                                <a href="/bookstore/detail/${latestFav.favs_s_id}">
                                                    <img src="/uploads/${latestFavStoreImg}">
                                                </a>
                                            </div> 
                                            <a style="color: #dfdad5;" href="/bookstore/detail/${latestFav.favs_s_id}"><div>${latestFav.favs_s_storename}</div></a> 
                                        </c:when>
                                        <c:otherwise>
                                            <div>즐겨찾기한 서점이 없습니다.</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
    
                                <div class="book_img">
                                    <c:choose>
                                        <c:when test="${!empty latestFav.favb_b_isbn}">
                                            <div class="bkBox">
                                                <a href="/books/detail/${latestFav.favb_b_isbn}/${latestFav.favb_s_id}">
                                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/1500x0/pdt/${latestFav.favb_b_isbn}.jpg"
                                                        alt="책표지사진">
                                                </a>
                                            </div>
                                            <a style="color: #dfdad5;" href="/books/detail/${latestFav.favb_b_isbn}/${latestFav.favb_s_id}"><div>${latestFav.favb_b_title}</div></a> 
                                        </c:when>
                                        <c:otherwise>
                                            <div>찜한 도서가 없습니다.</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
    
                            </c:if>
                            </div>
    
                        </div>
               
               
               
               
                </div>


                <div class="orderBox01">
                    <div class="container-3 card-top cards">

                        <h3><a href="/mypage/refundexchangelist">진행 중인 교환/반품 : ${num_of_currRE}건</a></h3>
                        <table>
                            <tr>
                                <th width="45px">구분</th>
                                <th width="90px">신청일자</th>
                                <th>도서명</th>
                                <th width="70px">서점명</th>
                                <th width="70px">처리상태</th>
                            </tr>

                            <c:if test="${empty curr_reList}">
                                <tr>
                                    <td colspan="5">진행 중인 교환/반품이 없습니다.</td>
                                </tr>
                            </c:if>

                            <c:if test="${!empty curr_reList}">
                                <c:forEach var="reItem" items="${curr_reList}">
                                    <tr>
                                        <td>${reItem.re_sort}</td>
                                        <td>
                                            <fmt:formatDate value="${reItem.re_reqdate}" pattern="yyyy-MM-dd" />
                                         
                                        </td>
                                        <td><span>${reItem.b_title}</span></td>
                                        <td>${reItem.s_storename}</td>
                                        <td>${reItem.process_status}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                        </table>

                    </div>


                    <div class="container-3 card-top cards">

                        <h3><a href="/mypage/rentallist">현재 대여/연체 중 : ${num_of_currR}건</a></h3>
                        <table>
                            <tr>
                                <th width="80px">대여상태</th>
                                <th>도서명</th>
                                <th>서점명</th>
                                <th width="110px">반납기한</th>
                                <th width="70px">총 연체료</th>
                            </tr>

                            <c:if test="${empty curr_rList}">
                                <tr>
                                    <td colspan="5">대여 중인 도서가 없습니다.</td>
                                </tr>
                            </c:if>

                            <c:if test="${!empty curr_rList}">
                                <c:forEach var="rItem" items="${curr_rList}">
                                    <tr>
                                        <td>${rItem.rental_status}</td>
                                        <td><span>${rItem.b_title}</span></td>
                                        <td><span>${rItem.s_storename}</span></td>
                                        <td>
                                            <fmt:formatDate value="${rItem.r_duedate}" pattern="yyyy-MM-dd" />
                                          
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${rItem.r_latefee_total}" type="number"
                                                pattern="#,##0" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </table>
                    </div>
                </div>

                <!-- <div class="orderInfo">
    
                     <div class="container-3 card-top cards">

                        <h3><a href="/mypage/refundexchangelist">진행 중인 교환/반품 : ${num_of_currRE}건</a></h3>
                        <table>
                            <tr>
                                <th width="45px">구분</th>
                                <th width="90px">신청일자</th>
                                <th>도서명</th>
                                <th width="70px">서점명</th>
                                <th width="70px">처리상태</th>
                            </tr>

                            <c:if test="${empty curr_reList}">
                                <tr>
                                    <td colspan="5">진행 중인 교환/반품이 없습니다.</td>
                                </tr>
                            </c:if>
                
                            <c:if test="${!empty curr_reList}">
                                <c:forEach var="reItem" items="${curr_reList}">
                                    <tr>
                                        <td>${reItem.re_sort}</td>
                                        <td><fmt:formatDate value="${reItem.re_reqdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                        <td><span>${reItem.b_title}</span></td>
                                        <td>${reItem.s_storename}</td>
                                        <td>${reItem.process_status}</td>
                                    </tr>
                                    </c:forEach>
                            </c:if>
                        </table>
                    </div> 
                    
                     <div class="container-3 card-top cards">

                        <h3><a href="/mypage/rentallist">현재 대여/연체 중 : ${num_of_currR}건</a></h3>
                        <table>
                            <tr>
                                <th width="80px">대여상태</th>
                                <th>도서명</th>
                                <th>서점명</th>
                                <th width="110px">반납기한</th>
                                <th width="70px">총 연체료</th>
                            </tr>

                            <c:if test="${empty curr_rList}">
                                <tr>
                                    <td colspan="5">대여 중인 도서가 없습니다.</td>
                                </tr>
                            </c:if>
                
                            <c:if test="${!empty curr_rList}">
                                <c:forEach var="rItem" items="${curr_rList}">
                                    <tr>
                                        <td>${rItem.rental_status}</td>
                                        <td><span>${rItem.b_title}</span></td>
                                         <td><span>${rItem.s_storename}</span></td>
                                        <td><fmt:formatDate value="${rItem.r_duedate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                        <td><fmt:formatNumber value="${rItem.r_latefee_total}" type="number" pattern="#,##0"/></td>
                                    </tr>
                                    </c:forEach>
                            </c:if>
                        </table>
 -->

            </div>


            <div class="orderInfoBox">
 
                <div class="container-3 card-bottom cards">
                    <div class="labelbox">
                        <h3>최근 구매내역</h3>
                        <div onclick="location.href='/mypage/purchaselist'" class="more-btn">더보기 +</div>
                    </div>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>도서명</th>
                            <th>배송현황</th>
                            <th>주문일자</th>
                        </tr>
        
                        <c:if test="${empty pList}">
                            <tr>
                                <td colspan="4">구매내역이 없습니다.</td>
                            </tr>
                        </c:if>
        
                        <c:if test="${!empty pList}">
                            <c:forEach var="pItem" items="${pList}">
                                <tr>
                                    <td>${pItem.o_id}</td>
                                    <td>${pItem.b_title}</td>
                                    <td><a href="/mypage/orderdetail/${pItem.o_id}">${pItem.delivery_status}</a></td>
                                    <td>
                                        <fmt:formatDate value="${pItem.o_date}" pattern="yyyy-MM-dd hh:mm"></fmt:formatDate>
                                    </td>
        
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
        
                <div class="container-3 card-bottom cards">
                    <div class="labelbox">
                        <h3>최근 대여내역</h3>
                        <div onclick="location.href='/mypage/rentallist'" class="more-btn">더보기 +</div>
                    </div>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>도서명</th>
                            <th>배송현황</th>
                            <th>주문일자</th>
                        </tr>
        
                        <c:if test="${empty rList}">
                            <tr>
                                <td colspan="4">대여내역이 없습니다.</td>
                            </tr>
                        </c:if>
        
                        <c:if test="${!empty rList}">
                            <c:forEach var="rItem" items="${rList}">
                                <tr>
                                    <td>${rItem.o_id}</td>
                                    <td>${rItem.b_title}</td>
                                    <td><a href="/mypage/orderdetail/${rItem.o_id}">${rItem.delivery_status}</a></td>
                                    <td>
                                        <fmt:formatDate value="${rItem.o_date}" pattern="yyyy-MM-dd hh:mm" />
                                    </td>
        
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
        
            </div>
        

        </div>

    </div>


 
    </div>



    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>
