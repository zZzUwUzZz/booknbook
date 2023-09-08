// books.js
$(document).ready(function() {
    $("#mediumCategory").change(function() {
        var selectedMediumCategoryId = $(this).val();
        
        // AJAX 요청을 통해 작은 카테고리 데이터를 가져옵니다.
        $.get("/api/smallCategories", { mediumCategoryId: selectedMediumCategoryId }, function(data) {
            // 작은 카테고리를 업데이트합니다.
        });
    });
});

$(document).ready(function() {
    $('.medium-category').hover(
      function() {
        const index = $(this).attr('id').split('-').pop();
        $(`#small-categories-${index}`).stop().fadeIn();
      },
      function() {
        const index = $(this).attr('id').split('-').pop();
        $(`#small-categories-${index}`).stop().fadeOut();
      }
    );
  });
  