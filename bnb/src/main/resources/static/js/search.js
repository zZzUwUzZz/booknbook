 $(document).ready(function() {
  $('#searchForm').on('submit', function(e) {
      e.preventDefault();  // 폼 제출 방지
      var keyword = $('#searchInput').val().trim();  // 앞뒤 공백 제거

      if (keyword === '') {
          alert('검색어를 입력해주세요.');  // 사용자에게 메시지 표시
      } else {
          window.location.href = '/search?keyword=' + encodeURIComponent(keyword);
      }
  });
});


$(document).ready(function() {
    // 랜덤하게 표시할 추가 텍스트 목록
    const randomTexts = [
        "(^_^)b", "(;-;)",  "\(^Д^)/", "(≥o≤)", "\(o_o)/"
    ];

    if (totalItems === 0) {
        // 랜덤 인덱스 생성
        const randomIndex = Math.floor(Math.random() * randomTexts.length);

        // 랜덤 텍스트 선택
        const randomText = randomTexts[randomIndex];

        // 랜덤 텍스트를 .randomemoji에 적용
        $('.randomemoji').text(randomText);

        // no-results div에 스타일 적용
        $('.no-results').show();  // no-results div를 보이게 설정
        $('.pagination').show();
    }
});
