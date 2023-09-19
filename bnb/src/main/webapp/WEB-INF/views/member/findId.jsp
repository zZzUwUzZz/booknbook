<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/findId.css">
    <title>Find ID</title>
</head>
<body>
    <div class="header"></div>
    <div class="titleArea">
        <h2>Find ID</h2>
        <ul>
            <li>아이디 찾기 페이지요.</li>
            <li>본인이 가입하신 이름과 이메일을 입력해 주세요.</li>
        </ul>
    </div>
    <div class="tabs">
    <button class="tab-button active" onclick="showTab('findId')">아이디 찾기</button>
    <button class="tab-button" onclick="window.location='/member/resetPw'">비밀번호 초기화</button>
</div>

    <form id="findIdForm" name="findIdForm" action="/exec/front/Member/findId/" method="post" target="_self" enctype="multipart/form-data">
        <input id="returnUrl" name="returnUrl" value="/member/id/find_id_result.html" type="hidden">
        <div class="findId">
            <fieldset>
                <legend>아이디 찾기</legend>
                <p>
                    <strong>회원유형</strong>
                    <select id="searchType" name="searchType" fw-label="회원유형">
                        <option value="indi" selected="selected">개인회원</option>
                        <option value="indibuis">개인 사업자회원</option>
                    </select>
                </p>
                <p class="check">
                    <input id="check_method1" name="check_method" value="2" type="radio" checked="checked">
                    <label for="check_method1">이메일</label>
                </p>
                <p class="input-group" id="input_name">
                    <strong class="input_label">이름 </strong>
                    <input id="input_field_name" name="name" class="lostInput" placeholder="이름을 입력하세요" value="" type="text">
                </p>
                <!-- 서점명 입력 필드 추가 -->
                <p class="input-group" id="input_storename" style="display:none;">
                    <strong class="input_label">서점명 </strong>
                    <input id="input_field_storename" name="storename" class="lostInput" placeholder="서점명을 입력하세요" type="text">
                </p>
                <p class="input-group" id="input_email">
                    <strong class="input_label">이메일 입력</strong>
                    <input id="input_field_email" name="email" class="lostInput" placeholder="이메일을 입력하세요" value="" type="text">
                </p>

                <!-- 결과를 표시할 부분을 추가 -->
                <span id="idResult" style="display:none;">
                    회원님의 아이디: <span id="userId"></span>
                </span>

                <div class="ec-base-button gColumn" id="button_group">
                    <button type="submit" id="submit_button" class="btnSubmit sizeM" onclick="findIdAction(); return false;">확인</button>
                    <!-- 로그인 버튼을 추가 (기본 상태는 숨김) -->
                    <a href="/member/login" id="login_button" style="display:none;" class="btnSubmit sizeM">로그인페이지로</a>
                </div>
            </fieldset>
        </div>
    </form>

    <!-- 결과를 보여줄 부분 -->
    <div id="idResult" style="display:none;">
        <strong>회원님의 아이디:</strong> <span id="userId"></span>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            // 회원 유형 선택 상자 값 변경 감지
            $("#searchType").change(function() {
                var selectedType = $(this).val();

                if (selectedType === "indibuis") { // 개인 사업자 회원 선택 시
                    $("#input_name").hide();
                    $("#input_storename").show();
                    $("#input_email").show();
                } else { // 개인회원 선택 시
                    $("#input_name").show();
                    $("#input_storename").hide();
                    $("#input_email").show();
                }
            });
        });

        function findIdAction() {
    var selectedType = $("#searchType").val();
    var name = $("#input_field_name").val();
    var storename = $("#input_field_storename").val();
    var email = $("#input_field_email").val();

    var url = "/member/findId"; // 기본값을 개인회원으로 설정
    var inputData = {};

    if (selectedType === "indibuis") { // 개인 사업자 회원 선택 시
        if (!storename || !email) {
            alert('서점명과 이메일을 모두 입력하세요.');
            return;
        }
        url = "/member/findSellerId"; // 개인 사업자회원용 URL로 변경
        inputData = { storeName: storename, email: email };
    } else { // 개인회원 선택 시
        if (!name || !email) {
            alert('이름과 이메일을 모두 입력하세요.');
            return;
        }
        inputData = { name: name, email: email };
    }

    $.ajax({
        type: "POST",
        url: url,
        data: inputData,
        success: function(response) {
            if (response && response !== 'not found') {
                $("#userId").text(response);
                $("#idResult").show();
                $("#submit_button").hide();
                $("#login_button").show();
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
</body>
</html>