$(document).ready(function() {
  // 클릭하면 모달에 있는 정보와 즐겨찾기 상태 업데이트
  $('.bs_item').click(function() {
      const storeId = $(this).data('store-id');
      //const userId = $(this).data('user-id');
      
      // 즐겨찾기 상태 불러오기
      $.ajax({
          url: `/isFavorite?userId=customer001&storeId=${storeId}`,
          type: 'GET',
          success: function(response) {
              const buttonId = `favoriteButton_${storeId}`;
              const favoriteButton = $('#' + buttonId).length ? $('#' + buttonId) : $('.favoriteButton');
              
              favoriteButton.attr('id', buttonId);
              favoriteButton.data('store-id', storeId);
          }
      });

      // 서점 상세 정보 불러오기
      $.ajax({
          url: `/get_store_details?id=${storeId}`,
          type: 'GET',
          success: function(data) {
              $('#storeImg').attr('src', "/uploads/" + data.store_img);
              $('#storeAddr').text(data.store_addr);
              $('#storeName').text(data.store_name);
              $('#storeDescription').text(data.store_description);
              $('#storePhone').text(data.store_phone);
              $('#storeDetailModal').css('display', 'block');
          },
          error: function(error) {
              console.log("Error fetching store details:", error);
          }
      });
  });
});



$(document).ready(function() {
    function updateFavoriteButton(userId, storeId) {
      $.ajax({
          url: "/isFavorite",
          type: "GET",
          data: { userId, storeId },
          success: function(response) {
              const favoriteButton = $("#favoriteButton_" + storeId);
              const newIcon = response.isFavorite ? 
                  '<span class="material-symbols-sharp" id="favtrue">bookmark</span>' : 
                  '<span class="material-symbols-sharp" id="favfalse">bookmark</span>';
              favoriteButton.html(newIcon);
              favoriteButton.data("is-favorite", response.isFavorite);
          }
      });
    }

  // 상점 아이템 클릭 시 모달 열고 즐겨찾기 상태 업데이트
  $(document).on('click', '.bs_item', function() {
    const storeId = $(this).data("store-id");
      const userId = "customer001";  // 임의의 사용자 ID

      // 즐겨찾기 상태 업데이트
      updateFavoriteButton(userId, storeId);

      const favoriteButton = $(".favoriteButton"); // 모달 내의 즐겨찾기 버튼
      favoriteButton.attr('id', `favoriteButton_${storeId}`);
      favoriteButton.data('store-id', storeId);
      favoriteButton.text("");
      favoriteButton.data("is-favorite", "");
      // 모달 열기
      $('#storeDetailModal').css('display', 'block');
      setTimeout(function() {
          $('#storeDetailModal').css('transform', 'translateX(92%)');
      }, 50);
  });
  
  // 모달 닫기 버튼 클릭
  $(document).on('click', '.close-button', function() {
      const favoriteButton = $(".favoriteButton");
      favoriteButton.text("");
      favoriteButton.data("is-favorite", "");
      $('#storeDetailModal').css('transform', 'translateX(-40%)');
  });
  
  // 즐겨찾기 버튼 클릭 이벤트 핸들러
  $(document).on('click', '[id^=favoriteButton_]', function() {
    const userId = 'customer001';
    const storeId = $(this).data("store-id");
    const isFavorite = $(this).data("is-favorite");
    const button = $(this);
    const url = isFavorite ? "/removeFavorite" : "/addFavorite";
    
    $.ajax({
        url: url,
        type: "POST",
        data: { userId, storeId },
        success: function(response) {
            if (response.isSuccess) {
                const newIsFavorite = !isFavorite;
                const newIcon = newIsFavorite ? 
                  '<span class="material-symbols-sharp" id="favtrue">bookmark</span>' : 
                  '<span class="material-symbols-sharp" id="favfalse">bookmark</span>';
                button.html(newIcon);
                button.data("is-favorite", newIsFavorite);
            }
        }
    });
});
});