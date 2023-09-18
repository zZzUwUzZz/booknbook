
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
  
  $(document).ready(function() {
    // 현재 URL을 확인
    if (window.location.pathname === '/books') {
      // h4 엘리먼트를 찾고 "전체보기" 텍스트를 추가
      $('.catetext h4').append("전체도서");
    }
  });

  $(document).ready(function(){
    // 선택된 소분류 ID와 중분류 ID를 가져옵니다. 이 값은 서버에서 전달해야 합니다.
    var selectedSmallId = '${category_s_id}';
    var selectedMediumId = '${category_m_id}';

    // 선택된 중분류에 해당하는 div에 'selected' 클래스를 추가합니다.
    $('[data-medium-id="' + selectedMediumId + '"]').addClass('selected');

    // 선택된 소분류에 해당하는 div를 찾습니다.
    var selectedSmallDiv = $('.small-category[data-small-id="' + selectedSmallId + '"]');

    // 선택된 소분류의 부모 div (small-categories)에서 중분류 ID를 가져옵니다.
    var parentMediumId = selectedSmallDiv.closest('.small-categories').data('medium-id');

    // 해당 중분류에 'selected' 클래스를 추가합니다.
    $('[data-medium-id="' + parentMediumId + '"]').addClass('selected');
});
