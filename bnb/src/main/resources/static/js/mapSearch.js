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


    
 


// $(".bs_item").click(function() {
//     const storeId = $(this).attr('data-store-id');
    
//     $.get("/get_store_details", { id: storeId }, function(data) {
//         console.log("Received data:", data);

//       // data를 사용해 모달에 정보를 채웁니다.
//       $('#storeName').text(data.store_name);
//       $('#storeDescription').text(data.store_description);

//       // 모달을 보여줍니다 (여기서는 Materialize CSS의 모달을 예로 들었습니다.)
//       $('#storeDetailModal').modal('show');
//     });
//   });
 



document.addEventListener("DOMContentLoaded", function() {
    let modal = document.getElementById("storeDetailModal");
    let span = document.getElementsByClassName("close-button")[0];
  
    span.onclick = function() {
      modal.style.display = "none";
    };
  
    window.onclick = function(event) {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    };
  
    document.querySelectorAll(".bs_item").forEach(function(storeItem) {
      storeItem.addEventListener("click", function() {
        const storeId = this.getAttribute('data-store-id');
        fetch(`/get_store_details?id=${storeId}`)
          .then(response => response.json())
          .then(data => {
            console.log("Received data from server:", data);  // 콘솔 로그를 통해 서버에서 받은 데이터 확인
            document.getElementById("storeName").textContent = data.store_name;
            document.getElementById("storeDescription").textContent = data.store_description;
            modal.style.display = "block";
          })
          .catch(error => {
            console.log("Error fetching store details:", error);  // 오류가 발생한 경우 콘솔 로그로 확인
          });
      });
    });
  });
  