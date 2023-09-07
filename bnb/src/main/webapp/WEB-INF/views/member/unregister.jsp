<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/unregister.css">
    <title>Find ID</title>
</head>
<body>
    <div class="header"></div>
    <div class="titleArea">
        <h2>Find ID</h2>
        <ul>
            <li>아이디 찾기 페이지요.</li>
            <li>I want to go home, damn it</li>
        </ul>
    </div>
     
    <form id="findIdForm" name="findIdForm" action="/member/unregister" method="post" target="_self" enctype="multipart/form-data">
        <input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden">
        <div class="findId">
            <fieldset>   
                <legend>아이디 찾기</legend>
                <p>
                    <strong>회원유형</strong>
                    <select id="searchType" name="searchType">
                        <option value="indi" selected="selected">개인회원</option>
                        <option value="indibuis">개인 사업자회원</option>
                    </select>
                </p>
                <p class="input-group" id="input_name">
                    <strong class="input_label">이름 </strong>
                    <input id="input_field_name" name="input_field_name" class="lostInput" placeholder="이름을 입력하세요" type="text">
                </p>
                <p class="input-group" id="input_email">
                    <strong class="input_label">이메일 입력</strong>
                    <input id="input_field_email" name="input_field_email" class="lostInput" placeholder="이메일을 입력하세요" type="text">
                </p>
                <div class="ec-base-button gColumn" id="button_group">
                    <button type="button" id="submit_button" class="btnSubmit sizeM" onclick="findIdAction();">확인</button>
                </div>
            </fieldset>
        </div>
    </form>
    <p id="idDisplay" style="display:none; color:green;">당신의 아이디는: <span id="userIdDisplay"></span></p>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
    function findIdAction() {
        var inputData = {
            name: $("#input_field_name").val(),
            email: $("#input_field_email").val()
        };
    
        $.ajax({
            type: "POST",
            url: "/member/unregister",
            data: inputData,
            success: function(response) {
                if (response.userId) {
                    $("#idDisplay").show();
                    $("#userIdDisplay").text(response.userId);
                } else {
                    alert('해당하는 아이디를 찾을 수 없습니다.');
                }
            },
            error: function(error) {
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
    }

     
        
    </script>
</head>
<body>
   
</body>
</html>