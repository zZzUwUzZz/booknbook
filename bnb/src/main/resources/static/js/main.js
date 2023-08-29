// 첫 번째 슬라이드

$(document).ready(function () {
    const slideContainer = $('.slide-container');
    const slides = $('.slide-container .slide');
    const prevButton = $('#prev-btn');
    const nextButton = $('#next-btn');
    const slidesPerPage = 4;
    let currentIndex = 0;

    function updateSlidePosition() {
        const offset = -currentIndex * slidesPerPage * (slides.outerWidth() + 20); // 20px 간격 고려
        slideContainer.css('transform', `translateX(${offset}px)`);
    }

    nextButton.click(function () {
        currentIndex = (currentIndex + 1) % Math.ceil(slides.length / slidesPerPage);
        updateSlidePosition();
    });

    prevButton.click(function () {
        currentIndex = (currentIndex - 1 + Math.ceil(slides.length / slidesPerPage)) % Math.ceil(slides.length / slidesPerPage);
        updateSlidePosition();
    });

    // Initialize the slide position
    updateSlidePosition();
});




// 두 번째 슬라이드

$(document).ready(function () {
    const slideContainer = $('.slide-container_02');
    const slides = $('.slide-container_02 .b_slide');
    const prevButton = $('#prev-btn_02');
    const nextButton = $('#next-btn_02');
    const slidesPerPage = 4;
    let currentIndex = 0;

    function updateSlidePosition() {
        const offset = -currentIndex * slidesPerPage * (slides.outerWidth() + 20); // 20px 간격 고려
        slideContainer.css('transform', `translateX(${offset}px)`);
    }

    nextButton.click(function () {
        currentIndex = (currentIndex + 1) % Math.ceil(slides.length / slidesPerPage);
        updateSlidePosition();
    });

    prevButton.click(function () {
        currentIndex = (currentIndex - 1 + Math.ceil(slides.length / slidesPerPage)) % Math.ceil(slides.length / slidesPerPage);
        updateSlidePosition();
    });

    // Initialize the slide position
    updateSlidePosition();
});



// 책 검색 모달
$(document).ready(function () {
            $(".bk_sc").click(function () {
                $(".sc_md").fadeIn(); //기본 fadeIn 메소드
                $('body').css('overflow', 'hidden');
            });
            $(".sc_cls").click(function () {
                $(".sc_md").fadeOut(); //기본 fadeIn 메소드
                $('body').css('overflow', 'auto'); 
            });

        })

 


// 알림 아이콘 버튼
$(document).ready(function () {
    $(".noti_btn").click(function () {
        $(".noti_md").toggle();
    });
});

// 알림 목록창

var isLoggedIn = false; // 로그인 상태
var notifications = []; // 알림 목록

// 초기 메시지 설정
function setDefaultNotification() {
  var notiBox = document.getElementsByClassName('notilistbox')[0];
  notiBox.innerHTML = ''; // 기존 내용 클리어

  if (!isLoggedIn) {
    var defaultDiv = document.createElement("div");
    defaultDiv.innerHTML = "로그인이 필요한 서비스입니다.";
    notiBox.appendChild(defaultDiv);
  } else if (notifications.length === 0) {
    var defaultDiv = document.createElement("div");
    defaultDiv.innerHTML = "표시할 알림이 없습니다.";
    notiBox.appendChild(defaultDiv);
  }
  
  // 추가된 알림이 있을 경우
  notifications.forEach(function(notification) {
    var newDiv = document.createElement("div");
    newDiv.id = 'notification_' + notification.productId;
    newDiv.innerHTML = notification.message;
    notiBox.appendChild(newDiv);
  });
}

// 상품이 입고되었을 때 이 함수를 호출
function showNotification(productId, productName) {
  if (isLoggedIn) {
    var message = productName + " 상품이 새로 입고되었습니다! 지금 바로 확인해보세요.";
    notifications.push({ productId, message }); // 알림 목록에 추가

    // 알림 목록 갱신
    setDefaultNotification();
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

  // 예제 코드
  // setLoginStatus(true); // 로그인한 경우
  // setLoginStatus(false); // 로그인하지 않은 경우
  
  // 예제 코드
  // showNotification(1, '신발');
  // showNotification(2, '바지');
  
