
// 페이지네이션






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
    searchForm.addEventListener('submit', function (event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 막음

        const keyword = mapscInput.value.trim(); // 공백을 제거한 키워드를 가져옴

        if (keyword === '') {
            return; // 키워드가 없으면 아무것도 하지 않음
        }

        // 키워드를 쿼리 파라미터로 추가하여 페이지를 이동
        window.location.href = `map?keyword=${encodeURIComponent(keyword)}`;
    });
});
    


function initMap() {
    var center = {
        lat: 37.5665,
        lng: 126.9780
    }; // 서울
    map = new google.maps.Map(document.getElementById('gmp-map'), {
        zoom: 12,
        center: center,
        styles: [{
            "featureType": "poi",
            "stylers": [{
                "visibility": "off"
            }]
        }]
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

// 마커 추가 하기
function addMarker(location, title, description, address) {
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        title: title,
        address: address   
    });
    var infoWindow = new google.maps.InfoWindow({
        content: '<h3>' + title + '</h3><p>' + description + '</p><p>' + address + '</p>'
    });

    marker.addListener('click', function () {
        map.setCenter(marker.getPosition());
        map.setZoom(14);
        infoWindow.open(map, marker);
    });

    markers.push(marker);
}


function searchMarkers(keyword) {
    var found = false;
    for (var i = 0; i < markers.length; i++) {
        // title 또는 address에 keyword가 포함되어 있는지 확인
        if (markers[i].title.toLowerCase().includes(keyword) || markers[i].address.toLowerCase().includes(keyword)) {
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
 

// 페이지 로드가 완료된 후
// 전역 범위에 마커와 인포윈도우를 저장하는 배열을 선언
var markers = [];
var infoWindows = [];

// addMarker 함수에서 마커와 인포윈도우를 생성하고, 배열에 추가
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
    infoWindows.push(infoWindow);
}

// bs_itempf 클릭 이벤트에서 마커에 대응하는 InfoWindow 열기
document.addEventListener('DOMContentLoaded', function() {
    // bs_itempf 클릭 이벤트
    document.querySelectorAll('.bs_itempf').forEach(function(item) {
      item.addEventListener('click', function() {
        const lat = parseFloat(this.getAttribute('data-lat'));
        const lng = parseFloat(this.getAttribute('data-lng'));

        // 지도를 해당 위치로 이동
        map.panTo({ lat, lng });
        map.setZoom(15);

        // 대응하는 마커의 InfoWindow 열기
        for (var i = 0; i < markers.length; i++) {
            if (markers[i].getPosition().lat() === lat && markers[i].getPosition().lng() === lng) {
                infoWindows[i].open(map, markers[i]);
                break;
            }
        }
      });
    });
});




//   모달 
$(document).ready(function() {
    $('.bs_item').on('click', function() {
      $('#storeDetailModal').css('display', 'block');
      setTimeout(function() {
        $('#storeDetailModal').css('transform', 'translateX(92%)');
      }, 50);
    });
  
    $('.close-button').on('click', function() {
      $('#storeDetailModal').css('transform', 'translateX(-40%)');
    });
  });

 

// 모달 클릭 시 정보 가져오기
document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll(".bs_item").forEach(function(storeItem) {
    storeItem.addEventListener("click", function() {
      const storeId = this.getAttribute('data-store-id');
      fetch(`/get_store_details?id=${storeId}`)
        .then(response => response.json())
        .then(data => { 
          console.log("Received data from server:", data);  // 콘솔 로그를 통해 서버에서 받은 데이터 확인
          
          // ID 대신 클래스를 사용
          const favoriteButton = document.querySelector(".favoriteButton");
          
          favoriteButton.setAttribute('data-store-id', storeId);
          document.getElementById("storeImg").src = "/uploads/" + data.store_img;
          document.getElementById("storeAddr").textContent = data.store_addr;
          document.getElementById("storeName").textContent = data.store_name;
          document.getElementById("storeDescription").textContent = data.store_description;
          document.getElementById("storePhone").textContent = data.store_phone;
          modal.style.display = "block";
        })
        .catch(error => { 
          console.log("Error fetching store details:", error);  // 오류가 발생한 경우 콘솔 로그로 확인
        });
    });
  });
});

// 즐겨찾기
//  $(document).ready(function() {
//   $('.favoriteButton').click(function() {
//     var storeId = $(this).attr('data-store-id');
//     var userId =$(this).attr('data-user-id');
    
//     // AJAX 요청을 이용해 서버에 즐겨찾기 상태를 토글합니다.
//     $.post('/toggleFavorite', { userId: userId, storeId: storeId }, function(response) {
//       // 서버로부터 응답을 받았을 때의 처리. 예를 들면,
//       if (response.isFavorite) {
//         $(`[data-store-id=${storeId}]`).text("즐겨찾기 해제");
//       } else {
//         $(`[data-store-id=${storeId}]`).text("즐겨찾기 추가");
//       }
//     });
//   });
// });

$(document).on('click', '.favoriteButton', function() {
  var storeId = $(this).data('store-id');
  var userId = $(this).data('user-id');
  var buttonId = $(this).attr('id');
  
  // AJAX 요청을 이용해 서버에 즐겨찾기 상태를 토글합니다.
  $.post('/toggleFavorite', { userId: userId, storeId: storeId }, function(response) {
    // 서버로부터 응답을 받았을 때의 처리
    if (response.isFavorite) {
      $('#' + buttonId).text("즐겨찾기 해제");
    } else {
      $('#' + buttonId).text("즐겨찾기 추가");
    }
  });
});