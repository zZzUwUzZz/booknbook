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
  