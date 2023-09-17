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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제보하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
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
        
        #charCount {
            font-size: 12px;
            color: gray;
        }

        /* 제출 버튼 스타일 */
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

        .input-field-date {
            display: flex;
            align-items: center;
        }

        .input-field-date label {
            flex: 1;
            text-align: left;
        }

        .input-field-date p {
            flex: 5;
            text-align: left;
            font-size: 16px; 
            color: #777;
            margin-top: 13px;
        }
    </style>
</head>

<body>
    <div class="container"> 
        <div class="title-box">
            <h1>제보하기</h1>
        </div>

        <form action="submit.php" method="post" enctype="multipart/form-data">
            <div class="input-field">
                <label for="storeName">서점 이름</label>
                <input type="text" id="storeName" name="storeName" required>
            </div>
            
            <div class="input-field">
                <label for="content">소개</label>
                <textarea id="content" name="content" rows="5" style="resize: none;" oninput="checkCharCount()" maxlength="1000" required></textarea>
            </div>
            <span id="charCount">0/1000 글자</span> 

            <div class="input-field">
                <label for="storeAddress">서점 주소</label>
                <input type="text" id="storeAddress" name="storeAddress" required>
            </div>
            
            <div class="input-field-image">
                <label for="storeImage">서점 사진</label>
                <input type="file" id="storeImage" name="storeImage" accept="image/*" required>
            </div>
            
            <table>
                <tr>
                    <td>${report_id}</td>
                    <td>${report_title}</td>
                    <td>${report_content}</td>
                    <td>${report_date}</td>
                </tr>
            </table> 

            <!-- 작성일 스타일 수정 (글자 크기 조절) -->
            <div class="input-field-date">
                <label for="today_day">작성일</label>
                <p id="today_day"><%= formattedDate %></p>
            </div>

            <div id="input2">
                <input type="submit" value="제출하기">
            </div>
        </form>
    </div>

    <script>
    function checkCharCount() {
        const content = document.getElementById("content").value;
        const charCount = content.length;
        const charLimit = 1000; // 최대 글자 수 제한

        document.getElementById("charCount").textContent = `${charCount}/${charLimit} 0/1000`;

        if (charCount > charLimit) {
            document.getElementById("charCount").style.color = "red";
        } else {
            document.getElementById("charCount").style.color = "gray"; 
        }
    }
    </script>
</body>
</html>
