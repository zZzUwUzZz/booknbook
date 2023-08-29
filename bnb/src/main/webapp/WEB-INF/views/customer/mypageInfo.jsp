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

        .container-0 {
            border: 1px solid red;
            width: 800px;
            height: 700px;
            margin: auto;
        }
        .container-1 {
            border: 1px solid orange;
            width: 700px;
            margin: auto;
        }

    </style>

    <title>Document</title>

</head>

<body>
    
    <jsp:include page="../../tiles/header.jsp"></jsp:include>

    <div class="container-0">

        <div class="container-1">

            <h2>나의 회원정보</h2>

            <table>
                <tr>
                    <td>ID</td> <td>abc123</td>
                </tr>
                <tr>
                    <td>이름</td> <td>김댕댕</td>
                </tr>
                <tr>
                    <td>주소</td> <td>인천광역시 계양구 계산새로 100</td>
                </tr>
                <tr>
                    <td>휴대전화번호</td> <td>010-1111-2222</td>
                </tr>
                <tr>
                    <td>이메일</td> <td>abc123@naver.com</td>
                </tr>
                <tr>
                    <td>가입일자</td> <td>2022-12-31</td>
                </tr>
            </table>

        </div>

        <div class="container-1">
            <button onclick="location.href='/mypage'">돌아가기</button>
            <button onclick="location.href='/mypage/updateinfo'">회원정보수정</button>
            <button onclick="location.href='/member/leave'">회원탈퇴</button>
        </div>
    
    </div>


    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>

</html>