
// 알림 아이콘 버튼

$(document).ready(function () {
    // noti_btn을 클릭하면 noti_md를 토글합니다.
    $(".noti_btn").click(function (event) {
        $(".noti_md").toggle();
        event.stopPropagation();  // 이벤트가 상위 DOM 요소로 전파되는 것을 막습니다.
    });
  
    // noti_md를 클릭해도 아무 일도 일어나지 않도록 합니다.
    $(".noti_md").click(function (event) {
        event.stopPropagation();  // 이벤트가 상위 DOM 요소로 전파되는 것을 막습니다.
    });
  
    // 문서의 바탕을 클릭하면 noti_md를 숨깁니다.
    $(document).click(function () {
        $(".noti_md").hide();
    });
  });
  
  
   
  
  
  var isLoggedIn = false; // 로그인 상태
  var notifications = []; // 알림 목록
  
  // 초기 메시지 설정
  function setDefaultNotification() {
    var notiBox = document.getElementsByClassName('notilistbox')[0];
    notiBox.innerHTML = ''; // 기존 내용 클리어
  
    if (!isLoggedIn) {
      var defaultDiv = document.createElement("div");
      defaultDiv.className = 'noti_ngout';
      defaultDiv.innerHTML = "로그인이 필요한 서비스입니다.";
      notiBox.appendChild(defaultDiv);
    } else if (notifications.length === 0) {
      var defaultDiv = document.createElement("div");
      defaultDiv.className = 'noti_ng';
      defaultDiv.innerHTML = "표시할 알림이 없습니다.";
      notiBox.appendChild(defaultDiv);
    }
  
    // 추가된 알림이 있을 경우
    notifications.forEach(function(notification) {
      var newDiv = document.createElement("div");
      newDiv.className = 'noti_item';
      newDiv.setAttribute('data-read', 'false');  // '읽음' 상태를 나타내는 데이터 속성 추가
      newDiv.addEventListener('click', markAsRead);  // 이 부분 추가
            
      var aTag = document.createElement("a");
      aTag.href = '/product/' + notification.productId; // 상품 상세 페이지로 이동하는 URL
      aTag.innerHTML = notification.message;
      newDiv.appendChild(aTag);
  
      // 날짜를 표기하기 위한 span 요소 생성
      var dateSpan = document.createElement("span");
      dateSpan.className = 'noti_date';
      dateSpan.innerHTML = notification.date;
      newDiv.appendChild(dateSpan);
   
      notiBox.appendChild(newDiv);
    });
  }
  
  // 상품이 입고되었을 때 이 함수를 호출
  function showNotification(productId, productName) {
    if (isLoggedIn) {
      var message = productName + " 상품이 새로 입고되었습니다! 지금 바로 확인해보세요.";
      var date = new Date().toLocaleDateString(); // 현재 날짜
      notifications.push({ productId, message, date }); // 알림 목록에 추가
  
      // 알림 목록 갱신
      setDefaultNotification();
  
      // 빨간 점 추가
      newNotificationReceived();
    }
  }
  
  // 빨간 점 추가
  function newNotificationReceived() {
    var notiBtns = document.getElementsByClassName('noti_btn'); // 클래스를 사용
  
    for(var i = 0; i < notiBtns.length; i++) {
      // new_dot이 이미 있는지 확인
      var existingDot = notiBtns[i].getElementsByClassName('new_dot');
      
      if(existingDot.length === 0) { // new_dot이 없을 경우에만 추가
        var redDot = document.createElement("span");
        redDot.className = 'new_dot';
        redDot.innerHTML = '●';
        notiBtns[i].appendChild(redDot);
      }
    }
  }
  
  
  // 사용자 로그인 상태 설정
  function setLoginStatus(status) {
    isLoggedIn = status;
    notifications = []; // 알림 목록 초기화
    setDefaultNotification(); // 디폴트 메시지 설정
  }
  
  // 페이지 로드 시 디폴트 메시지 설정
  document.addEventListener("DOMContentLoaded", function() {
    setDefaultNotification();
  });
   
  
     
    // setLoginStatus(true); // 로그인한 경우
    // setLoginStatus(false); // 로그인하지 않은 경우
     
    // showNotification(1, '신발');
    // showNotification(2, '바지');
  
  





    // 글자색을 회색으로 변경하고, 모든 알림이 확인되었는지 체크하는 함수
    function markAsRead(event) {
        console.log("markAsRead called"); // 이 로그가 보이는지 확인
        const notiItem = event.currentTarget;
        notiItem.setAttribute('data-read', 'true');
        notiItem.style.color = 'grey';
        checkAllNotificationsRead();
      }
  
  // 모든 알림이 확인되었는지 체크하고, 그렇다면 빨간점을 제거하는 함수
  function checkAllNotificationsRead() {
    const notiItems = document.querySelectorAll('.noti_item');
    let allRead = true;
  
    notiItems.forEach((item) => {
      if (item.getAttribute('data-read') !== 'true') {
        allRead = false;
      }
    });
  
    if (allRead) {
      const notiBtn = document.querySelector('.noti_btn');
      const existingDot = notiBtn.querySelector('.new_dot');
      if (existingDot) {
        notiBtn.removeChild(existingDot);
      }
    }
  }
  