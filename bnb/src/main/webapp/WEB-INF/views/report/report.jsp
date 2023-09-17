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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    

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

</body>
</html>
