<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>

            <style>
                img#imagePreview {
                    object-fit: cover;
                    width: 300px;
                    height: 100%;
                    max-height: 300px;
                    border-radius: 50%;
                }

                .seller_pfimg {
                    width: 300px;
                    height: 300px;
                    border-radius: 50%;
                    background: #a9a9a9;
                }
            </style>


        </head>

        <body>

            <jsp:include page="/WEB-INF/views/adminFile/seller.jsp"/>
            <h1>seller info edit page</h1>

            <div>

                <div class="info">
                    <div class="seller_pfimg">
                        <img src="${sf_sysname}" id="imagePreview" alt="Image Preview">
                    </div>
                    <p>확장자: png, jpg, jpeg / 용량: 1MB 이하</p>
                    <span id="warning" style="color: red;"></span>
                </div>

                <form id="uploadForm" action="/seller/settings/account" method="post" enctype="multipart/form-data">

                    <input type="file" id="fileInput" name="file">
                    <input type="hidden" name="sellerId" value="testseller01">
                    <button type="submit" id="uploadBtn">Upload</button>
                </form>
     
            </div>

            <script src="/js/fileUpload.js"></script>      
        </body>

        </html>