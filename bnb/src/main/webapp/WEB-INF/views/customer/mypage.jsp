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
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Noto+Sans+KR:wght@600&family=Space+Mono&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/slide.css">
    <link rel="stylesheet" href="/css/customer/mypage.css">
    <link rel="stylesheet" href="/css/customer/main.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="/js/slide.js"></script>

    <style>
        
        .container-mypage a {
            color: #4c4240;
        }

        #transparent {
            background-color: transparent;
        }
        .container-1 {
            box-sizing: border-box;
            /* border: 1px solid red; */
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 1132px;
            margin: auto;
        }
        .container-2 {
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            /* border: 1px solid orange; */
            width: 557px;
        }
        .container-3 {
            box-sizing: border-box;
            /* border: 1px solid yellow; */
            background-color: #fffbed;
            width: 557px;
            padding: 0 20px;
        }
        table {
            width: 100%;
            text-align: center;
        }
        .card-main {
            height: 350px;
            margin-bottom: 15px;
        }
        .card-top {
            height: 200px;
            margin-bottom: 15px;
        }
        .card-bottom {
            height: 220px;
        }
        .card-button {
            height: 50px;
        }

        /* 위는 마이페이지홈만 해당 */


        .container-mypage {
            border: 1px solid red;
            display: flex;
            flex-direction: row;
            width: 1400px;
            height: 650px;
            margin: auto;
            margin-bottom: -30px;
            padding: 15px;
        }
        .board-area {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background-color: #fffbed;
            width: 1135px;
            margin: 0 15px;
        }
        .button-area {
            display: flex;
            flex-direction: column-reverse;
            border: 1px solid orange;
            width: 50px;
        }
        .buttons {
            border: 1px solid yellow;
            border-radius: 10px;
            background-color: #fffbed;
            width: 50px;
            height: 50px;
            margin-top: 10px;
        }
        .menu_simple ul {
            margin: 0; 
            padding: 0;
            width:185px;
            list-style-type: none;
        }
        
        .menu_simple ul li a {
            text-decoration: none;
            color: #fffbed; 
            padding: 10.5px 11px;
            background-color: #4c4240;
            display:block;
        }
        
        /* .menu_simple ul li a:visited {
            color: #fffbed;
        } */      
        
        #currpage {
            background-color: #fffbed;
            color: #4c4240;
            font-weight: 700;
        }
        .menu_simple ul li a:hover, .menu_simple ul li .current {
            color: #fffbed;
            background-color: #ff9946;
        }

    </style>


    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>


    <div class="container-mypage">

        <div class="menu_simple">
            <ul>
                <li><a href="/mypage" id="currpage">마이페이지 홈</a></li>
                <hr>
                <li><a href="/mypage/orderlist">나의 주문내역</a></li>
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div class="container-1">

                <div class="container-2">
    
                    <div class="container-3 card-main cards">
                        <p>책과 작은서점을 사랑하는 <span>수히</span>님..</p>
                        <p>오늘도 행복한 하루되시고... ㅁㄴㅇㄻ</p>
                        <p>여기 이미지든 뭐든 넣어야겠음</p>
                    </div>

                    <div class="container-3 card-button cards" onclick="location.href='/mypage/info'">
                        나의 회원정보
                    </div>

                </div>
    
                <div class="container-2">
    
                    <div class="container-3 card-top cards">

                        <h3>진행 중인 교환/반품 : <a href="/mypage/refundexchangelist">${num_of_currRE}건</a></h3>
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>신청일자</th>
                                <th>신청품목</th>
                                <th>서점</th>
                                <th>처리상태</th>
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
                                        <td>${reItem.re_reqdate}</td>
                                        <td>${reItem.b_title}</td>
                                        <td>${reItem.s_storename}</td>
                                        <td>${reItem.process_status}</td>
                                    </tr>
                                    </c:forEach>
                            </c:if>

                        </table>

                    </div>
                    
                    <div class="container-3 card-top cards">

                        <h3>현재 대여 중 : <a href="/mypage/rentallist">${num_of_currR}건</a></h3>
                        <table>
                            <tr>
                                <th>제목</th>
                                <th>서점</th>
                                <th>반납기한</th>
                                <th>대여상태</th>
                            </tr>

                            <c:if test="${empty curr_rList}">
                                <tr>
                                    <td colspan="4">대여 중인 도서가 없습니다.</td>
                                </tr>
                            </c:if>
                
                            <c:if test="${!empty curr_rList}">
                                <c:forEach var="rItem" items="${curr_rList}">
                                    <tr>
                                        <td>${rItem.b_title}</td>
                                        <td>${rItem.s_storename}</td>
                                        <td>${rItem.r_duedate}</td>
                                        <td>${rItem.rental_status}</td>
                                    </tr>
                                    </c:forEach>
                            </c:if>
                        </table>

                    </div>

                </div>
    
            </div>
    
    
            <div class="container-1">
    
                <div class="container-3 card-bottom cards">
                    <div class="labelbox">
                        <h3>최근 구매내역</h3><button onclick="location.href='/mypage/purchaselist'" class="more-btn">▶더보기</button>
                    </div>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>품목</th>
                            <th>배송현황</th>
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
                                    <td>${pItem.o_date}</td>
                                    <td>${pItem.b_title}</td>
                                    <td>${pItem.delivery_status}</td>
                                </tr>
                                </c:forEach>
                        </c:if>
                    </table>
                </div>
    
                <div class="container-3 card-bottom cards">
                    <div class="labelbox">
                    <h3>최근 대여내역</h3><button onclick="location.href='/mypage/rentallist'" class="more-btn">▶더보기</button>
                    </div>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>품목</th>
                            <th>배송현황</th>
                        </tr>

                        <c:if test="${empty rList}">
                            <tr>
                                <td colspan="4">구매내역이 없습니다.</td>
                            </tr>
                        </c:if>
            
                        <c:if test="${!empty rList}">
                            <c:forEach var="rItem" items="${rList}">
                                <tr>
                                    <td>${rItem.o_id}</td>
                                    <td>${rItem.o_date}</td>
                                    <td>${rItem.b_title}</td>
                                    <td>${rItem.delivery_status}</td>
                                </tr>
                                </c:forEach>
                        </c:if>
                    </table>
                </div>

            </div>

        </div>

        <div class="button-area">

            <!-- <div class="buttons"></div>
            <div class="buttons"></div> -->

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>

