<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>

    <style>
        
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
                <li><a href="/mypage/purchaselist">구매내역</a></li>
                <li><a href="/mypage/refundexchangelist">교환/반품내역</a></li>
                <li><a href="/mypage/rentallist">대여내역</a></li>
                <li><a href="/mypage/rentalreservationlist">대여예약조회</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area" id="transparent">

            <div class="container-1">

                <div class="container-2">
    
                    <div class="container-3 card-main">
                        <p>책과 작은서점을 사랑하는 <span>수히</span>님..</p>
                        <p>오늘도 행복한 하루되시고... ㅁㄴㅇㄻ</p>
                        <h3><a href="/mypage/favoritestores">즐겨찾는 서점</a></h3>
                        <a href="/mypage/favoritebooks"><h3>찜한 책</h3></a>
                        <a href="/mypage/rentalreservationlist"><h3>대여예약 조회</h3></a>
                    </div>

                    <div class="container-3 card-button">
                        <button onclick="location.href='/mypage/info'">회원정보</button>
                    </div>

                </div>
    
                <div class="container-2">
    
                    <div class="container-3 card-top">

                        <h2>진행 중인 교환/반품 : <a href="/mypage/refundexchangelist">2</a>건</h2>
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>신청일자</th>
                                <th>신청품목</th>
                                <th>서점</th>
                                <th>처리상태</th>
                            </tr>
                            <tr>
                                <td>반품</td>
                                <td>2023-08-28</td>
                                <td>누가 내 머리에 똥 쌌어</td>
                                <td>동네서점</td>
                                <td>승인대기</td>
                            </tr>
                            <tr>
                                <td>교환</td>
                                <td>2023-08-25</td>
                                <td>누가 내 머리에 똥 쌌어2</td>
                                <td>동네서점2</td>
                                <td>승인</td>
                            </tr>
                        </table>

                    </div>
                    
                    <div class="container-3 card-top">

                        <h2>현재 대여 중 : <a href="/mypage/rentallist">3</a>건</h2>
                        <table>
                            <tr>
                                <th>제목</th>
                                <th>저자</th>
                                <th>서점</th>
                                <th>반납기한</th>
                                <th>대여상태</th>
                            </tr>
                            <tr>
                                <td>누가 내 머리에 똥 쌌어</td>
                                <td>이효진</td>
                                <td>달빛책방</td>
                                <td>2023-09-02</td>
                                <td>대여중</td>
                            </tr>
                            <tr>
                                <td>누가 내 머리에 똥 쌌어</td>
                                <td>이효진</td>
                                <td>달빛책방</td>
                                <td>2023-08-30</td>
                                <td>대여중</td>
                            </tr>
                            <tr>
                                <td>누가 내 머리에 똥 쌌어</td>
                                <td>이효진</td>
                                <td>달빛책방</td>
                                <td>2023-08-27</td>
                                <td>연체</td>
                            </tr>
                        </table>

                    </div>

                </div>
    
            </div>
    
    
            <div class="container-1">
    
                <div class="container-3 card-bottom">
                    <h2>최근 구매내역</h2><button onclick="location.href='/mypage/purchaselist'">▶더보기</button>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>품목</th>
                            <th>배송현황</th>
                        </tr>
                        <tr>
                            <td>20331</td>
                            <td>2023-08-17</td>
                            <td>누가 내 머리에 똥 쌌어</td>
                            <td>배송중</td>
                        </tr>
                        <tr>
                            <td>10201</td>
                            <td>2023-08-13</td>
                            <td>엉덩이탐정2 외 1건</td>
                            <td>수령완료</td>
                        </tr>
                        <tr>
                            <td>20111</td>
                            <td>2023-08-11</td>
                            <td>오펜하이머</td>
                            <td>배송완료</td>
                        </tr>
                    </table>
                </div>
    
                <div class="container-3 card-bottom">
                    <h2>최근 대여내역</h2><button onclick="location.href='/mypage/rentallist'">▶더보기</button>
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <th>대여일자</th>
                            <th>품목</th>
                            <th>배송현황</th>
                        </tr>
                        <tr>
                            <td>20331</td>
                            <td>2023-08-17</td>
                            <td>누가 내 머리에 똥 쌌어</td>
                            <td>배송중</td>
                        </tr>
                        <tr>
                            <td>10201</td>
                            <td>2023-08-13</td>
                            <td>엉덩이탐정2 외 1건</td>
                            <td>수령완료</td>
                        </tr>
                        <tr>
                            <td>20111</td>
                            <td>2023-08-11</td>
                            <td>오펜하이머</td>
                            <td>배송완료</td>
                        </tr>
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

