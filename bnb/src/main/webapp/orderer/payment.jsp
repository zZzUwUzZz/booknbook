<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <jsp:include page="../../tiles/header.jsp"></jsp:include>
    <div class="pay" id="go_pay">
        <button type="button" class="choice">결제</button>
        <script>
            const payButton = document.getElementById("pay-button");
            payButton.addEventListener('click', () => {
                document.getElementById("pay-button").onclick = function () {
                    alert("결제되셨습니다.");
                };
            });
        </script>
    </div>
    <jsp:include page="../../tiles/footer.jsp"></jsp:include>

</body>
</html>