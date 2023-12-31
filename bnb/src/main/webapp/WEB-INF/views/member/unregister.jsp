<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/member/unregister.css">
    <title>회원 탈퇴</title>
</head>
<body>
    <div class="header"></div>
    
    <div class="titleArea">
        <h2>회원 탈퇴</h2>
        <ul>
            <li>탈퇴 전 모든 정보를 확인해주세요.</li>
            <li>탈퇴 후 복구는 불가능합니다.</li>
        </ul>
    </div>

    <form id="deactivateAccountForm" name="deactivateAccountForm" action="/member/unregister" method="post" target="_self">
        <div class="deactivateArea">
            <fieldset>   
                <legend>탈퇴 확인</legend>
                
                <p class="input-group">
                    <label for="input_field_id" class="input_label">아이디</label>
                    <input id="input_field_id" name="m_id" class="inputField" type="text" placeholder="아이디를 입력하세요" autocomplete="off">
                </p>
                <p class="input-group">
                    <label for="input_field_password" class="input_label">비밀번호</label>
                    <input id="input_field_password" name="m_pw" class="inputField" type="password" placeholder="비밀번호를 입력하세요" autocomplete="off">
                </p>
                
                <div class="reasonArea">
                    <label for="deactivateReason"><strong>탈퇴 사유 선택 (선택 사항)</strong></label>
                    <select id="deactivateReason" name="deactivateReason">
                        <option value="">-- 선택하세요 --</option>
                        <!-- 
                        <option value="privacy">개인 정보 걱정</option>
                        <option value="useless">더 이상 필요 없음</option> 
                        -->
                        <option value="hard">반수희 때문에</option>
                        <option value="hard">이효진 떄문에</option>
                        <option value="hard">배유다 때문에</option>
                        <option value="hard">김예림 떄문에</option>
                        <option value="hard">이수연 때문에</option>
                        <option value="other">기타</option>
                    </select>
                </div>

                <div class="confirmCheck">
                    <input type="checkbox" id="confirmCheck" name="confirmCheck">
                    <label for="confirmCheck">정보를 모두 확인하였으며, 이에 동의합니다.</label>
                </div>

                <div class="buttonGroup">
                    <button type="button" class="btnSubmit" onclick="confirmDeactivation();">탈퇴하기</button>
                </div>        
            </fieldset>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        function confirmDeactivation() {
            var userId = $("#input_field_id").val();
            var password = $("#input_field_password").val();
            var reason = $("#deactivateReason option:selected").text();
            
            if (!userId || !password) {
                alert('아이디와 비밀번호를 확인하세요.');
                return;
            }
            
            if (!$('#confirmCheck').prop('checked')) {
                alert('탈퇴 전 모든 정보 확인에 동의해야 합니다.');
                return;
            }

            var confirmMsg = "정말로 탈퇴하시겠습니까?";
            if (reason && reason !== "-- 선택하세요 --") confirmMsg += "\n탈퇴 사유: " + reason;

            if (window.confirm(confirmMsg)) {
                $("#deactivateAccountForm").submit();
               
            }
        }
    </script>

    <div class="footer"></div>
</body>
</html>