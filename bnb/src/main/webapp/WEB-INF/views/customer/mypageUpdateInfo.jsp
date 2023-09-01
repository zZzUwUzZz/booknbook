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
    <link rel="stylesheet" href="/css/customer/mypage.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/slide.js"></script>

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

                <form action="/mypage/updateinfo" method="POST">    

                    <div class="container-1">
        
                        <h2>회원정보수정</h2>
                            
                        아이디<input type="text" placeholder="${mDto.m_id}" name="m_id"><br>
                        기존비밀번호<input type="password"><br>    <!-- 기존비번입력제대로했는지확인해야함 -->
                        새비밀번호<input type="password" name="m_pw"><br>
                        새비밀번호 확인<input type="password"><br>    <!-- 두번같게입력했는지확인해야함 -->
                        이름<input type="text" placeholder="${mDto.c_name}" name="c_name"><br>
                        주소<input type="text" placeholder="${mDto.m_addr}" name="m_addr"><br>
                        휴대전화번호<input type="text" placeholder="${mDto.m_phone}" name="m_phone"><br>
                        이메일<input type="text" placeholder="${mDto.m_email}" name="m_email">

                    </div>

                    <div class="container-1">
                        <button onclick="location.href='/mypage/info'">돌아가기</button>
                        <button type="reset">입력취소</button>
                        <button type="submit">저장하기</button>
                    </div>
        
                </form>

            </div>

        </div>

    </div>



    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>