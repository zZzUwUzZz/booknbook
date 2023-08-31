<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Book List</h1>
<h1>아니 외않되냐고 ㅅㅂ</h1>
        
   


    <h2>${book.b_price}</h2>   
    <h2>${book.b_title}</h2> 
    <h2>${book.b_price}</h2>  

   
    <table>
   
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.b_s_id}</td>   
                <td>${book.b_title}</td> 
                <td>${book.b_price}</td> 
            </tr>
        </c:forEach>
    </table> 

    
</body>
</html>