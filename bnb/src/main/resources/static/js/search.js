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
