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
        
        .container-mypage {
            border: 1px solid red;
            display: flex;
            flex-direction: row;
            width: 1400px;
            height: 650px;
            margin: auto;
            padding: 15px;
        }
        .board-area {
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
                <li><a href="/mypage">마이페이지 홈</a></li>
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

        <div class="board-area">

            <div class="container-0">

                <div class="container-1">
        
                    <h2>회원정보수정</h2>
        
                    <form action="/mypage/updateinfo" method="POST">
        
                        아이디<input type="text" placeholder="abc123" name="m_id"><br>
                        기존비밀번호<input type="password"><br>    <!-- 기존비번입력제대로했는지확인해야함 -->
                        새비밀번호<input type="password" name="m_pw"><br>
                        새비밀번호 확인<input type="password"><br>    <!-- 두번같게입력했는지확인해야함 -->
                        이름<input type="text" placeholder="김댕댕" name="c_name"><br>
                        주소<input type="text" placeholder="인천광역시 계양구 계산새로 100" name="m_addr"><br>
                        휴대전화번호<input type="text" placeholder="010-1111-2222" name="m_phone"><br>
                        이메일<input type="text" placeholder="abc123@naver.com" name="m_email">
        
                    </form>
        
                </div>
        
                <div class="container-1">
                    <button onclick="location.href='/mypage/info'">돌아가기</button>
                    <button onclick="location.href='/mypage/updateinfo'">입력취소</button>
                    <button onclick="">저장하기</button>
                </div>
            
            </div>

        </div>

    </div>



    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>