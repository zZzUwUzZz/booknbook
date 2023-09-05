// 페이지가 로드되면 실행될 함수
document.addEventListener('DOMContentLoaded', () => {
  
    // 검색 폼과 입력 필드 찾기
    const searchForm = document.getElementById('mapSearchForm');
    const mapscInput = document.getElementById('mapscInput');
    
    // 이전에 검색한 키워드가 있으면 입력 필드에 설정
    const urlParams = new URLSearchParams(window.location.search);
    const keyword = urlParams.get('keyword');
    if (keyword) {
      mapscInput.value = decodeURIComponent(keyword);
    }
  
    // 검색 폼 제출 이벤트 리스너
    searchForm.addEventListener('submit', function(event) {
      event.preventDefault(); // 폼의 기본 제출 동작을 막음
      
      const keyword = mapscInput.value.trim(); // 공백을 제거한 키워드를 가져옴
      
      if (keyword === '') {
        return; // 키워드가 없으면 아무것도 하지 않음
      }
      
      // 키워드를 쿼리 파라미터로 추가하여 페이지를 이동
      window.location.href = `map?keyword=${encodeURIComponent(keyword)}`;
    });
  });
  

  // 마커 추가 하기
  function addMarker(location, title, description, address) {
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        title: title
    });

    var infoWindow = new google.maps.InfoWindow({
        content: '<h3>' + title + '</h3><p>' + description + '</p><p>Address: ' + address + '</p>'
    });

    marker.addListener('click', function() {
        infoWindow.open(map, marker);
    });

    markers.push(marker);
}




function initMap() {
    var center = {lat: 37.5665, lng: 126.9780}; // 서울
    map = new google.maps.Map(document.getElementById('gmp-map'), {
        zoom: 12,
        center: center,
        styles: [
            {
                "featureType": "poi",
                "stylers": [
                    { "visibility": "off" }
                ]
            }
        ]
    });

    infoWindow = new google.maps.InfoWindow();

    // dbMarkers 배열을 순회하면서 마커 추가
    for (var i = 0; i < dbMarkers.length; i++) {
        addMarker(dbMarkers[i], dbMarkers[i].title, dbMarkers[i].description, dbMarkers[i].address);
    }

    // URL의 쿼리 파라미터에서 keyword를 읽어옴
    var urlParams = new URLSearchParams(window.location.search);
    var keyword = urlParams.get('keyword');

    if (keyword) {
        searchMarkers(keyword.toLowerCase());
    }
}




  function searchMarkers(keyword) {
      var found = false;
      for (var i = 0; i < markers.length; i++) {
          if (markers[i].title.toLowerCase().includes(keyword)) {
              markers[i].setMap(map);
              map.setCenter(markers[i].getPosition());
              map.setZoom(14);
              infoWindow.setContent(markers[i].title);
              infoWindow.open(map, markers[i]);
              found = true;
              break; // 첫 번째로 찾은 마커로 이동
          } else {
              markers[i].setMap(null);
          }
      }

      if (!found) {
          alert('No matching places found.');
      }
  }

 