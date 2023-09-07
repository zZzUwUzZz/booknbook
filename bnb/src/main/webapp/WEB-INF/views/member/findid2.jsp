<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/findid2.css">
    <title>Verify ID</title>
</head>
<body>
    <div class="header"></div>
    <div class="titleArea">
        <h2>Verify ID</h2>
        <ul>
            <li>인증번호를 통한 아이디 확인 페이지입니다.</li>
            <li>I still want to go home!</li>
        </ul>
    </div>

    <form id="verifyIdForm" name="verifyIdForm" action="/exec/front/Member/verifyId/" method="post" target="_self" enctype="multipart/form-data">
        <div class="verifyId">
            <fieldset>   
                <legend>인증번호 입력</legend>

                <p class="input-group" id="input_verification_code">
                    <strong class="input_label">인증 코드 입력</strong>
                    <input id="verification_code" name="verification_code" class="lostInput" placeholder="인증 코드를 입력하세요" type="text">
                </p>

                <div class="ec-base-button gColumn" id="verify_button_group">
                    <button type="submit" id="verify_button" class="btnSubmit sizeM" onclick="verifyCodeAction(); return false;">인증 확인</button>
                </div>
            </fieldset>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script>
        function verifyCodeAction() {
            var verificationData = {
                code: $("#verification_code").val()
            };

            // AJAX 요청: 인증 코드를 통해 아이디 확인
            $.ajax({
                type: "POST",
                url: "/verify-endpoint", // 해당 URL을 적절하게 수정해야 합니다.
                data: verificationData,
                success: function(response) {
                    if (response.success) {
                        alert('아이디는 ' + response.id + ' 입니다.');
                    } else {
                        alert('잘못된 인증번호입니다. 다시 확인해주세요.');
                    }
                },
                error: function(error) {
                    alert('오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }
    </script>
</body>
</html>