const data = ['apple', 'banana', 'cherry', 'date', 'elderberry'];

document.addEventListener('DOMContentLoaded', () => {
  const params = new URLSearchParams(window.location.search);
  const keyword = params.get('keyword');
  const resultList = document.getElementById('resultList');
  
  if (keyword) {
    const filteredData = data.filter(item => item.toLowerCase().includes(keyword.toLowerCase()));
    
    for (const item of filteredData) {
      const listItem = document.createElement('li');
      listItem.textContent = item;
      resultList.appendChild(listItem);
    }
  }
});
