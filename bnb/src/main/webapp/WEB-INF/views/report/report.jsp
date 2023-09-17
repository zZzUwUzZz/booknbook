<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
// 현재 날짜와 시간을 가져옵니다.
Date currentDate = new Date();

// 날짜와 시간을 원하는 형식으로 변환합니다.
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
String formattedDate = dateFormat.format(currentDate);
%>
<!DOCTYPE html>
<html>
<head>

<!-- 수연 -->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제보하기</title>
    
    <style>
        body {
            background-color: #4d6b50;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            position: relative;
            border: 1px solid #000000;
            padding: 20px;
            width: 50%;
            background-color: #fffbed;
        }

        .title-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-field {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .input-field label {
            flex: 1;
            text-align: left;
        }

        .input-field input[type="text"],
        .input-field textarea {
            flex: 5;
            margin-left: 10px;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
        }

        /* 문자 수 카운트 설정 */
        #charCount {
            font-size: 12px;
            color: gray;
        }

        /* 제출 버튼 스타일 수정 */
        #input2 {
            text-align: center;
            margin-top: 20px;
        }

        #input2 input[type="submit"] {
            background-color: #4d6b50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s; /* 호버 효과 */
        }

        #input2 input[type="submit"]:hover {
            background-color:  #ff9946; /* 클릭 시 버튼 배경색 변경 */
        }

        .input-field-image {
            display: flex;
            align-items: center;
        }

        .input-field-image label {
            flex: 1;
            text-align: left;
        }

        .input-field-image input[type="file"] {
            flex: 5;
            text-align: center;
        }
    </style>

</head>

<body>

    <div class="container">
        <div class="title-box">
            <h1>제보하기</h1>
        </div>
        <form action="/report" method="post">
            <div class="input-field">
                <label for="report_title">제목</label>
                <input type="text" id="report_title" name="report_title" required>
            </div>
            
            <div class="input-field">
                <label for="report_content">내용</label>
                <textarea id="report_content" name="report_content" rows="5" style="resize: none;" oninput="checkCharCount()" maxlength="5000" required></textarea>
                <div id="charCount">0/5000</div>
            </div>

            <div class="input-field">
                <input type="submit" value="제출하기">
            </div>
        </form>
        
    <script>
    
    function checkCharCount() {
    const content = document.getElementById("report_content").value; // ID 변경
    const charCount = content.length;
    const charLimit = 5000;

    document.getElementById("charCount").textContent = `${charCount}/${charLimit}`;

    if (charCount > charLimit) {
        document.getElementById("charCount").style.color = "red";
    } else {
        document.getElementById("charCount").style.color = "gray"; 
    }
}
    </script>
 <jsp:include page="report_submission.jsp" />
</body>
</html>
