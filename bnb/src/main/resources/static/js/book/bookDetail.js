
// 같은 책 다른 서점 슬라이더 관련
$(document).ready(function() {
    let currentIndex = 0;
    const totalItems = $(".item").length;
    const visibleItems = 4; // 한 번에 보이는 아이템 수
    const moveDistance = 307; // .item의 너비(219px) + 양쪽 마진(44px * 2)
  
    // 아이템 개수가 3개 이하일 경우 버튼을 숨김
    if (totalItems <= 3) {
      $("#prevBtn").hide();
      $("#nextBtn").hide();
      return;  // 아무런 동작도 하지 않고 종료
    }
  
    function updateButtons() {
      $("#prevBtn").prop("disabled", currentIndex === 0);
      $("#nextBtn").prop("disabled", currentIndex >= totalItems - visibleItems);
    }
  
    $("#prevBtn").click(function() {
      if (currentIndex > 0) {
        currentIndex--;
        $(".items001").css("transform", `translateX(-${currentIndex * moveDistance}px)`);
        updateButtons();
      }
    });
  
    $("#nextBtn").click(function() {
      if (currentIndex < totalItems - visibleItems) {
        currentIndex++;
        $(".items001").css("transform", `translateX(-${currentIndex * moveDistance}px)`);
        updateButtons();
      }
    });
  
    updateButtons();
  });

 
 
  // 총 수량에 따른 금액 계산
  $(document).ready(function () {
      // 총 금액 업데이트 함수
      function updateTotalPrice() {
          const singlePrice = parseInt($('#singlePrice').val());  // 단일 상품 가격
          const quantity = parseInt($('#quantityInput').val());  // 수량
          const totalPrice = singlePrice * quantity;  // 총 금액 = 단일 상품 가격 x 수량
  
          // 총 금액을 화면에 업데이트
          $('#totalPrice').text(totalPrice.toLocaleString('en-US'));
      }
  });
 
  document.addEventListener("DOMContentLoaded", function() {
    const minusBtn = document.getElementById("minusBtn");
    const plusBtn = document.getElementById("plusBtn");
    const quantityInput = document.getElementById("quantityInput");
    const totalPriceElement = document.getElementById("totalPrice");
    const unitPrice = parseFloat(totalPriceElement.textContent.replace(/,/g, '')); // 초기 단가 가져오기

    // 총 가격 업데이트 함수
    function updateTotalPrice() {
        const currentQuantity = parseInt(quantityInput.value, 10);
        const newTotalPrice = unitPrice * currentQuantity;
        totalPriceElement.textContent = newTotalPrice.toLocaleString(); // 콤마 추가
    }

    // '-' 버튼 클릭 시 수량 감소
    minusBtn.addEventListener("click", function(event) {
        event.preventDefault();
        let currentQuantity = parseInt(quantityInput.value, 10);
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
            updateTotalPrice();
        }
    });

// '+' 버튼 클릭 시 수량 증가
plusBtn.addEventListener("click", function(event) {
  event.preventDefault();
  let currentQuantity = parseInt(quantityInput.value, 10);
  if (currentQuantity < 9) {
      quantityInput.value = currentQuantity + 1;
      updateTotalPrice();
  } else {
      alert("구매할 수 있는 최대 수량은 9개입니다.");
  }
});

// 수량 직접 입력 시 총 가격 업데이트
quantityInput.addEventListener("input", function(event) {
  let currentQuantity = parseInt(quantityInput.value, 10);
  if (currentQuantity > 9) {
      alert("구매할 수 있는 최대 수량은 9개입니다.");
      quantityInput.value = 9;
  }
  updateTotalPrice();
});

});


