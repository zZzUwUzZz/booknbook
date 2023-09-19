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
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist" id="currpage">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div class="retext_01">
                <span class="pagename">RENTAL RESERVATION LIST</span>
            </div>

            <div class="datebox">
                <div>
                    <form action="/mypage/rentalreservationlist">
                        <input type="date" id="startDate" name="startDate" required>
                        <label for="startDate">부터</label>
                        <input type="date" id="endDate" name="endDate" required>
                        <label for="endDate">까지</label>
                        <button type="submit">조회</button>
                    </form>
                </div>
            </div>


            <div class="rrListContain">
                <div class="rrListBox">

                    <c:if test="${empty rrList}">
                        <div>예약내역이 없습니다.</div>
                    </c:if>

                    <c:if test="${!empty rrList}">
                        <c:forEach var="rrItem" items="${rrList}">
                            <article class="rrItemBox">

                                <div class="reNum">
                                    <div class="reText">
                                        예약번호</div>
                                    <div id="rr-${rrItem.rr_id}">#${rrItem.rr_id}
                                    </div>
                                </div>


  <div class="reTitle03">
    <div class="reText">요청일자</div>

   <fmt:formatDate value="${rrItem.rr_reqdate}" pattern="yyyy년 MM월 dd일" />

                                </div>

                                <div class="rrItem" title="${rrItem.b_title}">
                                    ${rrItem.b_title}
                                </div>


                                <div class="reStore_01">
                                    <div class="reText">서점명</div>
                                    ${rrItem.s_storename}
                                </div>
 

                                <div class="reDeli">
                                    <div class="reText">예약상태</div>
                                    <c:choose>
                                        <c:when test="${rrItem.rr_res_status_id eq 2}">
                                            <span title="${rrItem.rr_rejection_reason}">${rrItem.res_status}</span>
                                        </c:when>
                                        <c:when test="${rrItem.rr_res_status_id eq 5}">
                                            <div class="available" onclick="location.href='/restopay/${rrItem.rr_id}'"
                                                title="결제기한까지 대여신청하지 않을 경우&#013;대여예약이 취소됩니다.">
                                                대여하기
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="status-${rrItem.rr_id}">${rrItem.res_status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                    </div>
                                   
                                     
                                     <div class="reTitle02">
                                        <div class="reText"></div>
                                    <c:choose>
                                        <c:when test="${rrItem.rr_res_status_id eq 1 || rrItem.rr_res_status_id eq 3}">
                                            <div class="cancel_btn02" data-rr-id="rr-${rrItem.rr_id}"
                                                data-status-id="status-${rrItem.rr_id}">
                                                예약취소
                                            </div>
                                        </c:when>
                                        <c:when test="${rrItem.rr_res_status_id eq 5}">
                                            <span class="available-td">결제기한 : <br>
                                                <fmt:formatDate value="${rrItem.rr_duedate}" pattern="yyyy년 MM월 dd일" />
                                            </span>
                                        </c:when>
                                        <c:when test="${rrItem.rr_res_status_id eq 2}">
                                            <span class="available-td">${rrItem.rr_cancel_reason}</span>
                                        </c:when>
                                        <c:otherwise>   
                                            <div style="width:120px;"></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                            </article>
                        </c:forEach>
                    </c:if>
                </div>
             
              
                <div>
                    <div class="pagebox">${pageHtml}</div>
                </div>

            </div>
        </div>
    </div>


   

    </div>




    <jsp:include page="../../tiles/footer.jsp"></jsp:include>



    <script>
        $(document).ready(function () {

            $(".cancel_btn02").click(function () {

                let conf = confirm('대여예약을 취소할까요?');

                if (conf == true) {

                    let status_id = $(this).data('status-id')
                    $('#' + status_id).text('예약취소')
                    $(this).hide()

                    let data = {};
                    let id = $(this).data('rr-id')
                    let rr_id = $('#' + id).html()
                    data.rr_id = rr_id;

                    $.ajax({

                        method: 'post',
                        url: '/mypage/reservationcancel',
                        data: data,
                        dataType: 'json'

                    }).done(function () {

                    }).fail(function (err) {

                        location.href = '/mypage/rentalreservationlist'

                    })
                }
            })
        })
    </script>

</body>

</html>