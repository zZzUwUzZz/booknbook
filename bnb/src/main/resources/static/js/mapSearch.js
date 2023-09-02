// 페이지가 로드되면 실행될 함수
document.addEventListener('DOMContentLoaded', () => {
  
    // 검색 폼과 입력 필드 찾기
    const searchForm = document.getElementById('mapSearchForm');
    const searchInput = document.getElementById('mapscInput');
    
    // 이전에 검색한 키워드가 있으면 입력 필드에 설정
    const urlParams = new URLSearchParams(window.location.search);
    const keyword = urlParams.get('keyword');
    if (keyword) {
      searchInput.value = decodeURIComponent(keyword);
    }
  
    // 검색 폼 제출 이벤트 리스너
    searchForm.addEventListener('submit', function(event) {
      event.preventDefault(); // 폼의 기본 제출 동작을 막음
      
      const keyword = searchInput.value.trim(); // 공백을 제거한 키워드를 가져옴
      
      if (keyword === '') {
        return; // 키워드가 없으면 아무것도 하지 않음
      }
      
      // 키워드를 쿼리 파라미터로 추가하여 페이지를 이동
      window.location.href = `map?keyword=${encodeURIComponent(keyword)}`;
    });
  });
  