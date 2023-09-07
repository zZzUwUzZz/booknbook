<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="style/main_style.css">
    <link rel="stylesheet" href="checkbook.css">

</head>
<body>
    <header>
        <jsp:include page="../../tiles/header.jsp"></jsp:include>
        <jsp:include page="../../tiles/orderer/cart_topline.jsp"></jsp:include>

    </header>
    <main>
        <div class="cart_emptied">
            <p class="guide_tile">장바구니에 담은 상품이 없습니다.</p>
        </div>
        <div class="cart_message">

            <!-- <script>
                const 
            </script> -->

        </div>

        <button onclick="doAction()">상품 삭제</button>

        //
        <!-- <div class="warning message">
        //     <p class="choice_delete">상품을 삭제하시겠습니까?</p>
        //     <p>상품이 삭제되었습니다.</p>
        // </div> -->
        //
        <!-- 로그아웃하고 다시 로그인 했을 때도 내가 장바구니에 넣었던 상품은 그대로 유지 -->
        //
        <!-- 장바구니에서 넣어야할 기능 -->
        //
        <!-- 
        //    - 대여/결제 장바구니 따로 구분해서 만들기
        //    - 로그인 안 했을 때는 로그인 해서 들어가는 
        //    - 상품을 장바구니 버튼 클릭 -> 장바구니 페이지로
        //    - 상품 대여/구매 구분 
        //    - 여러 상품 중 체크된 상품만 취소/결제
        //    - 장바구니 상품 취소/삭제 예고 메세지
        //    - 
        //    - 품절된 상품(구매 불가) 
        //    - 품절 상품 대여/예약 활성화
		//    - 빈 장바구니 
        // -->

        <!-- 상품 삭제 버튼 -->
        <script>
            const deleteButton = document.getElementById("delete-button");
            deleteButton.addEventListener('click', () => {
                document.getElementById("delete-button").onclick = function () {
                    alert("삭제되었습니다.");
                };
            });
        </script>

        <button type="button" class="go_back">이전</button>
        <button type="button" class="go_next">다음</button>

        <script type="text/javascript">
            var _before = null;

            $j(document).ready(function () {

                if (_before == null)
                    _before = $j(before_page);

                _before.bind('click_back.backButton', backButton_before);

                $j('.backButton').click(backButton_Click);
            });

            function backButton_before(e) {
                var backButton = $j('.backButton ');

                if (backButton.is(':visible') == true)
                    return;

                backButton.fadeIn(500);
            }

            function backButton_Click(e) {
                $j('body, html').animate({
                    backButton: 0
                }, 500, function () {
                    $j('.backButton').fadeOut(500);
                });
            }
        </script>
        <!-- 이걸 어떻게 할까~~ 음 파일 찾아보면서 해야지... 빨리 끝내고 넘겨야되는데 -->

        <form method="get" action="form-action.html">
            <p></p>
            <label><input type="checkbox" name="color" value="blue" checked> 상품정보</label>
            <label><input type="checkbox" name="color" value="red">삭제</label>
            <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
        </form>

    </main>

    <footer>
        <jsp:include page="../../tiles/footer.jsp"></jsp:include>
    </footer>
</body>

</html>