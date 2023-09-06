<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modal</title>
</head>
<body>
    <div id="container">
        <h2>Lorem Ipsum</h2>
        <button id="btn-modal">모달 창 열기 버튼</button>
        <div id="lorem-ipsum"></div>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>삭제</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>선택하신 상품을 삭제하시겠습니까?</p>
                <p>선택하신 상품이 삭제되었습니다.</p>
            </div>
        </div>
    </div>
    <script>
        const loremIpsum = document.getElementById("lorem-ipsum")
        fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
            .then(response => response.text())
            .then(result => loremIpsum.innerHTML = result)

            const modal = document.getElementById("modal")
            
            function modalOn() {
            modal.style.display = "flex"
            }
            function isModalOn() {
            return modal.style.display === "flex"
            }
            function modalOff() {
            modal.style.display = "none"
            }
            const btnModal = document.getElementById("btn-modal")
            btnModal.addEventListener("click", e => {
            modalOn()
            })
            const closeBtn = modal.querySelector(".close-area")
            closeBtn.addEventListener("click", e => {
            modalOff()
            })
            modal.addEventListener("click", e => {
            const evTarget = e.target
            if(evTarget.classList.contains("modal-overlay")) {
            modalOff()
            }
            })
    
    </script>

</body>
</html>