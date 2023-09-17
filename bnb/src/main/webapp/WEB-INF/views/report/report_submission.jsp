<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제보하기 성공</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <style>

        .wrapper {
            margin-top: 40px;
        }
        h1 {
            border-bottom: 1px solid #36593a;
        }
        h1, h3 {
            box-sizing: border-box;
            background-color: rgb(150, 150, 150);
            width: 900px;
            margin: auto;
            padding: 10px;
        }
        .cart_area {
            background-color: rgb(150, 150, 150);
            width: 900px;
            margin: auto;
        }
        table {
            background-color: white;
            width: 880px;
            margin: auto;
            text-align: center;
            padding: 5px;
        }
        tr {
            height: 30px;
        }
        .qty_input {
            width: 35px;
        }
    
        #success {
            background-color: rgb(150, 150, 150);
            width: 900px;
            height: 400px;
            font-size: xx-large;
            text-align: center;
            line-height: 400px;
            border-bottom: 1px solid #36593a;
            margin: auto;
        }
        
    </style>
</head>
<body>

    <div class="wrapper">

        <h1>REPORT SUCCESSFUL</h1>

        <div id="success">

            제보하기가 완료되었습니다.
            
        </div>

    </div>


</body>
</html>