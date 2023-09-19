<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
                <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

                <link rel="stylesheet" href="/css/main.css">
                <link rel="stylesheet" href="/css/slide.css">
                <link rel="stylesheet" href="/css/customer/main.css">
                <link rel="stylesheet" href="/css/customer/detail.css">
                <link rel="stylesheet" href="/css/customer/list.css">


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

                <title>Document</title>

            </head>

            <body>

                <jsp:include page="../../tiles/header.jsp"></jsp:include>


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

                        <div class="odt_text_01">
                            <span class="pagename"> MY ORDER DETAILS </span>
                            <!-- 주문번호 #${oInfo.o_id} 주문일자 ${oInfo.o_date} -->
                        </div>



                        <div class="pcContain_01">
                            <div class="tablename">구매</div>

                            <div class="opContain_01">

                                <c:if test="${empty oPList}">
                                    <div class="empitem">구매항목이 없습니다.</div>
                                </c:if>

                                <c:if test="${!empty oPList}">
                                    <c:forEach var="oPItem" items="${oPList}" varStatus="status">
                                        <c:set var="currentISBN" value="${isbnList[status.index].p_b_isbn}" />
                                        <div class="items">
                                            <article class="opItemBox">
                                                <div class="opItem">
                                                    <div class="opimg">
                                                        <img
                                                            src="https://contents.kyobobook.co.kr/sih/fit-in/150x0/pdt/${currentISBN}.jpg">
                                                    </div>
                                                    <div class="opItemInfoText">
                                                        <div class="opstn">${oPItem.s_storename}</div>
                                                        <div class="optt_text">${oPItem.b_title}</div>
                                                        <div class="opamt">${oPItem.p_amount}권</div>
                                                    </div>
                                                </div>
                                                <div class="itemPr">
                                                    ${oPItem.b_price}원
                                                </div>
                                                <div class="opTitle_status">
                                                    <div class="opText">
                                                        ${oPItem.delivery_status}
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

            </div>


                        <div class="pcContain_01">
                            <div class="tablename">대여</div>

                            <div class="opContain_01">

                                <c:if test="${empty oRList}">
                                    <div class="empitem">대여항목이 없습니다.</div>
                                </c:if>

                                <c:if test="${!empty oRList}">
                                    <c:forEach var="oRItem" items="${oRList}" varStatus="status">
                                        <c:set var="currentISBN" value="${isbnList[status.index].p_b_isbn}" />
                                        <div class="items">
                                            <article class="opItemBox">
                                                <div class="opItem">
                                                    <div class="opimg">
                                                        <img  src="https://contents.kyobobook.co.kr/sih/fit-in/150x0/pdt/${currentISBN}.jpg">
                                                    </div>
                                                    <div class="opItemInfoText">
                                                        <div class="opstn">${oRItem.s_storename}</div>
                                                        <div class="optt_text">${oRItem.b_title}</div>
                                                        <div class="rt_text">
                                                            대여기간 ${oRItem.r_rentalperiod}일
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="itemPr">
                                                    ${oRItem.b_rent}원
                                                </div>
                                                <div class="opTitle_status">
                                                    <div class="opText">
                                                        ${oRItem.order_status}
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>



                        <div class="totalInfoBox">


                            <div class="infobox">

                                <div class="infotext">
                                    <span>총 상품금액</span>
                                    <span>
                                        <fmt:formatNumber value="${oInfo.o_total_pricerent}" type="number"
                                            pattern="#,##0" />원
                                    </span>
                                </div>

                                <div class="infotext">
                                    <span>총 배송비</span>
                                    <span>
                                        <fmt:formatNumber value="${oInfo.o_total_deliveryfee}" type="number"
                                            pattern="#,##0" />원
                                    </span>
                                </div>

                                <div class="infotext">
                                    <span>총 결제금액</span>
                                    <span>
                                        <fmt:formatNumber value="${oInfo.o_total_payment}" type="number"
                                            pattern="#,##0" />
                                        원
                                    </span>
                                </div>
                            </div>

                            <div class="infobox_02">
                                <div class="infotext_03">배송정보</div>

                                <c:choose>
                                    <c:when test="${oInfo.o_delivery_sort eq '택배'}">
                                        <div class="delitext">
                                            <div>
                                                <div class="text01">주소</div>
                                                <div class="text02">${oInfo.o_recip_addr}</div>
                                            </div> <br>

                                            <div>
                                                <div class="text01">받는분</div>
                                                <div class="text02">${oInfo.o_recip_name}</div>
                                            </div> <br>

                                            <div>
                                                <div class="text01">연락처</div>
                                                <div class="text02">${oInfo.o_recip_phone}</div>
                                            </div> <br>
                                        </div>
                                    </c:when>
                                    <c:otherwise>

                                        <div class="delitext">
                                            <div>방문수령을 선택하셨습니다.
                                                <br>
                                                상품준비완료 상태가 되면 주문하신 서점에 직접 방문해주세요.
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>


                            </div>


                        </div>

                        <div class="btnbox_01">
                            <div class="listbtn01" onclick="location.href='/mypage/orderlist'">목록보기</div>
                            <div class="clsbtn01" onclick="cancel_order('${oInfo.o_id}')" id="cancel-btn">주문전체취소</div>
                        </div>

                    </div>


                </div>



                <jsp:include page="../../tiles/footer.jsp"></jsp:include>



                <script>

                    $(document).ready(() => {

        let o_status_1 = '${oPList[0].order_status_id}'
        let o_status_2 = '${oRList[0].order_status_id}'
        let delivered = '${delivered}'

        if (delivered == 'true') {
            $('#cancel-btn').attr('disabled', true);
        } else if (o_status_1 == 1 || o_status_2 == 1) {
            $('#cancel-btn').attr('disabled', false);
        } else {
            $('#cancel-btn').attr('disabled', true);
        }

                    })

                    function cancel_order(o_id) {

                        let conf = confirm('주문을 취소하시겠습니까?');

                        if (conf == true) {
                            location.href = '/mypage/ordercancel?o_id=' + o_id;
                        }

                    }

                </script>


            </body>

            </html>