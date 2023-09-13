<!DOCTYPE html>
<html lang="en">
<head>
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

        /* 글자 수 카운트 설정 */
        #charCount {
            font-size: 12px;
            color: gray;
        }

        /* 제출 버튼 설정 */
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
        }

        #input2 input[type="submit"]:hover {
            background-color: #4d6b50;
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
            flex: 1;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title-box">
            <h1>제보하기</h1>
        </div>
        <form>
            <div class="input-field">
                <label for="bookTitle">제목</label>
                <input type="text" id="bookTitle" name="bookTitle">
            </div>
            
            <div class="input-field">
                <label for="content">소개</label>
                <textarea id="content" name="content" rows="5" style="resize: none;" oninput="checkCharCount()"></textarea>
            </div>
            <span id="charCount">0/200 characters</span>
            
            <div class="input-field">
                <label for="storeAddress">서점주소</label>
                <input type="text" id="storeAddress" name="storeAddress">
            </div>
            
            <div class="input-field-image">
                <label for="storeImage">서점사진</label>
                <input type="file" id="storeImage" name="storeImage">
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
            const charLimit = 200; // 최대 글자 수 제한

            document.getElementById("charCount").textContent = `${charCount}/${charLimit} characters`;

            if (charCount > charLimit) {
                document.getElementById("charCount").style.color = "red";
            } else {
                document.getElementById("charCount").style.color = "gray"; 
            }
        }

        const form = document.querySelector("form");

        form.addEventListener("submit", function (e) {
            e.preventDefault(); 
        });
    </script>
</body>
</html>
