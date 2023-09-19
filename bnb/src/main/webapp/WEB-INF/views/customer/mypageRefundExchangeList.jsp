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
    <style>
        .container-mypage {height: auto!important;}
 
    </style>
</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/adminFile/customer.jsp"/>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li class="mypg"><a href="/mypage">마이페이지 홈</a></li>                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist" id="currpage">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

        
            <div class="retext_01">
                <span class="pagename">EXCHANGE/RETURN LIST</span>
            </div>


            <div class="datebox">
                <div>
                <form action="/mypage/refundexchangelist">
                    <input type="date" id="startDate" name="startDate" required>
                    <label for="startDate">부터</label>
                    <input type="date" id="endDate" name="endDate" required>
                    <label for="endDate">까지</label>
                    <button type="submit">조회</button>
                </form>
                </div>
            </div>
      
            <div class="PcListBox">


                <c:if test="${empty reList}">
                    <h4>교환/반품 내역이 없습니다.</h4>
                </c:if>
            
            
                
                <c:if test="${!empty reList}">
                    <c:forEach var="reItem" items="${reList}">
                        <div class="reListContain">
                            <article class="reItemBox">
                              
                                <div class="reNum">
                                    <div class="reText">
                                        주문번호</div>
                                    <div onclick="location.href='/mypage/purchaselist'" class="td-linked">
                                        #${reItem.re_o_id}
                                    </div>
                                </div>
            
                                <div class="reTitle">
                                    <div class="reText">신청일자</div>
                                    <fmt:formatDate value="${reItem.re_reqdate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
                                </div>
            
                                <div class="reTitle">
                                    ${reItem.re_sort}
                                </div>
            
                                <div class="reItem">
                                    <div class="reText">신청품목</div>
                                    ${reItem.b_title}
                                </div>
             
                                <div class="reStore">
                                    <div class="reText">서점명</div>
                                    ${reItem.s_storename}
                                </div>
            
                                <div class="reTitle">
                                    <div class="reText">금액/수량</div>
                                    ${reItem.re_amount}
                                </div>
             
                                <div class="reDeli">
                                    <div class="reText">처리상태</div>
                                    ${reItem.process_status}
                                </div>
            
 
                                <c:choose>
                                    <c:when test="${reItem.re_process_status_id eq 1}">
                                        <div class="re_clbtn" onclick="cancel('${reItem.re_id}')" class="cancel_btn">
                                            요청취소 
                                        </div>
                                    </c:when>
                                </c:choose>
                                
                                <c:if test="${!empty reItem.re_rejection_reason}">
                                      ${reItem.re_rejection_reason}
                                </c:if>
            
                            </article>
                        </div>
            
                    </c:forEach>
                </c:if>
            
            </div>

 
            <div class="pagenation">
                <div class="pagebox">${pageHtml}</div>
            </div>

        </div>
 
    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>

    function cancel(re_id) {

        let conf = confirm('교환/반품 신청을 취소할까요?');
        
        if (conf == true) {
            location.href="/mypage/refundexchangecancel/" + re_id;
        }
        
    }

    </script>

</body>

</html>