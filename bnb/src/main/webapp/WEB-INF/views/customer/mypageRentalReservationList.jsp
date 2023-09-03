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
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/mypage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist" id="currpage">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div>
                <h2 class="pagename">RENTAL RESERVATION LIST</h2>
            </div>

            <div>
                <div class="table_lists">
                <table id="async_table">
                    <tr>
                        <th>예약번호</th>
                        <th>요청일자</th>
                        <th>도서명</th>
                        <th>서점명</th>
                        <th>예약상태</th>
                        <th> </th>
                    </tr>

                    <c:if test="${empty rrList}">
                            <tr>
                                <td colspan="6">예약내역이 없습니다.</td>
                            </tr>
                    </c:if>
        
                    <c:if test="${!empty rrList}">
                        <c:forEach var="rrItem" items="${rrList}">
                            <tr>
                                <td>${rrItem.rr_id}</td>
                                <td>${rrItem.rr_reqdate}</td>
                                <td>${rrItem.b_title}</td>
                                <td>${rrItem.s_storename}</td>
                                <td class="status_code">${rrItem.res_status}</td>
                            
                                <c:choose>
                                    <c:when test="${rrItem.rr_res_status_id eq 1 || rrItem.rr_res_status_id eq 3}">
                                        <td><button onclick="cancel('${rrItem.rr_id}')" class="cancel_btn">예약취소</button></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td width="80px"></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                         </c:forEach>
                    </c:if>
                </table>
                </div>
            </div>

        </div>

        <div class="button-area">

            <div class="buttons"></div>
            <div class="buttons"></div>

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>



    <script>

    function cancel(rr_id) {   // 비동기통신

        let conf = confirm('대여예약을 취소할까요?');
                
        if (conf == true) {
                
            let data = {};
            data.rr_id = rr_id;

            console.log(data); 
            
            $.ajax({
                
                method: 'post',
                url: '/mypage/reservationcancel',
                data: data,
                dataType: 'json' 
                
            }).done(function(rrList) {    // update후의 대여예약 리스트가 파라미터자리로 넘어옴
                
                let rrListHtml = '';

                rrListHtml += '<tr>'
                            + '<th>예약번호</th>'
                            + '<th>요청일자</th>'
                            + '<th>도서명</th>'
                            + '<th>서점명</th>'
                            + '<th>예약상태</th>'
                            + '<th> </th>'
                           + '</tr>'
                
                if (rrList == null) {
                    
                    rrListHtml += '<tr>'
                                + '<td colspan="6">대여내역이 없습니다.</td>'
                               + '</tr>'
                    
                } else {
                    
                    for (let rrItem of rrList) {
                        
                        rrListHtml += '<tr>'
                                    + '<td>'+rrItem.rr_id+'</td>'
                                    + '<td>'+rrItem.rr_reqdate+'</td>'
                                    + '<td>'+rrItem.b_title+'</td>'
                                    + '<td>'+rrItem.s_storename+'</td>'
                                    + '<td>'+rrItem.res_status+'</td>'
                        if (rrItem.rr_res_status_id == 1 || rrItem.rr_res_status_id == 3) {
                            rrListHtml += '<td><button onclick="cancel('+rrItem.rr_id+')" class="cancel_btn">예약취소</button></td>'
                        } else {
                            rrListHtml += '<td width="80px"></td>'
                        }
                        rrListHtml += '</tr>'
        
                    }
                }

                $('#async_table').html(rrListHtml);
                
                
            }).fail(function(err) {
                
                console.log(err)
                
            })
            
        }

    }

    </script>

</body>

</html>