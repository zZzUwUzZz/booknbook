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
                <li><a href="/mypage/rentalreservationlist">대여예약내역</a></li>
                <hr>
                <li><a href="/mypage/favoritestores">즐겨찾기</a></li>
                <li><a href="/mypage/favoritebooks">찜한도서</a></li>
            </ul>
        </div>

        <div class="board-area">

            <div>
                <h2 class="pagename">회원정보 수정</h2>
            </div>

            <div class="container-0">

                <form id="updateForm" action="/mypage/updateinfo" method="POST">    

                    <div class="container-1">
                            
                        아이디<input type="text" value="${mDto.m_id}" name="m_id" required><br>
                        기존비밀번호<input type="password" id="pw_ori"><br>    <!-- 기존비번입력제대로했는지확인해야함 -->
                        <span id="pw_check" style="display: none">기존 비밀번호 제대로 입력하세요</span>
                        <!--
                        새비밀번호<input type="password" id="pw_new1" name="m_pw"><br>
                        <span id="pw_format_check" style="display: none">비번형식에 안 맞아요ㄱ-</span>
                        새비밀번호 확인<input type="password" id="pw_new2"><br>
                        <span id="pw_not_same" style="display: none">일치하지 않습니다. 입력한 내용을 확인해주세요.</span>
                        -->
                        이름<input type="text" value="${mDto.c_name}" name="c_name" required><br>
                        주소<input type="text" value="${mDto.m_addr}" name="m_addr" required><br>
                        휴대전화번호<input type="text" value="${mDto.m_phone}" name="m_phone" required><br>
                        이메일<input type="text" value="${mDto.m_email}" name="m_email" required>

                    </div>

                    <div class="container-1">
                        <button onclick="location.href='/mypage/info'">돌아가기</button>
                        <button type="reset">입력취소</button>
                        <button id="submit">저장하기</button>
                    </div>
        
                </form>

            </div>

        </div>

    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>


    <script>



        $('#pw_new1').focusout(()=>{

            // (예시: 최소 8자, 대문자/소문자/숫자/특수문자 포함)
            let pw_format = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            let pw_new1 = $('#pw_new1').val()
            if (!pw_new1.match(pw_format) && pw_new1 !== '') {
                $('#pw_format_check').css({'color': 'red', 'display': 'block'})
            } else {
                $('#pw_format_check').css({'display': 'none'})
            }

            let pw_new2 = $('#pw_new2').val()
            if (pw_new1 !== pw_new2 && pw_new2 !== '') {
                $('#pw_not_same').css({'color': 'red', 'display': 'block'})
            } else {
                $('#pw_not_same').css({'display': 'none'})
            }

        })

        $('#pw_new2').focusout(()=>{

            let pw_new1 = $('#pw_new1').val()
            let pw_new2 = $('#pw_new2').val()
            if (pw_new1 !== pw_new2 && pw_new1 !== '') {
                $('#pw_not_same').css({'color': 'red', 'display': 'block'})
            } else {
                $('#pw_not_same').css({'display': 'none'})
            }

        })

        $(document).ready(function() {

            $('#submit').on('click', function() {

                let pw_ori = $('#pw_ori').val();

                if (pw_ori !== '1234') {
                    $('#pw_check').css({'color': 'red', 'display': 'block'})
                    return false
                }

                // let is_valid_1 = $('#pw_format_check').css('display')
                // let is_valid_2 = $('#pw_not_same').css('display')
                
                // if (is_valid_1!=='none' || is_valid_2!=='none') {
                //     return false
                // }

                $('form').updateForm.submit();
            })

        })
 

    </script>


</body>

</html>