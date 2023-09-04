document.addEventListener('DOMContentLoaded', () => {
    const searchForm = document.getElementById('searchForm');
    
    searchForm.addEventListener('submit', function(event) {
      event.preventDefault();
      const keyword = document.getElementById('searchInput').value.trim();
    
    if (keyword === '') {
      // 키워드가 비어있거나 공백인 경우, 폼 제출을 막음
      event.preventDefault();
       return;
    } 
      // Navigate to the search results page with the keyword as a query parameter
      window.location.href = `search?keyword=${encodeURIComponent(keyword)}`;
      //window.location.href = `search.jsp`;
    });
  });
  