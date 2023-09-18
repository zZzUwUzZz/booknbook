// 데이터는 잘가져옴 

$(document).ready(function () {

  var isLoggedIn = true; // 로그인 상태
  var notifications = []; // 알림 목록

    // 1. 페이지 로딩 시 서버에서 알림 목록을 불러옵니다.
    const userId = "customer001"; // 실제 로그인된 사용자 ID
    $.get("/notifications?userId=" + userId, function (data) {
      console.log("Server response: ", data); // 이 부분을 추가
      notifications = data;
      setDefaultNotification();

      let hasUnread = false;
      for (const notification of notifications) {
        if (notification.nb_read === 'N') {
          hasUnread = true;
          break;
        }
    }
    if (hasUnread) {
      newNotificationReceived();
    } else {
      removeNewDot();
      $('.WStest').text('실시간 알림 성공').css('display', 'none');
    }
    });


// 알림 아이콘 버튼 이벤트
$(".noti_btn").click(function (event) {
  $(".noti_md").toggle();
  markAllAsRead();  // 모든 알림을 읽음 상태로 변경
  event.stopPropagation();
});


// 모든 알림을 읽음 상태로 변경하는 함수
function markAllAsRead() {
  const userId = "customer001";  // 실제 로그인된 사용자 ID를 이곳에 입력해야 함
  // 서버에 읽음 상태로 바꾸는 요청을 보냅니다.
  $.post("/markAllAsRead", { userId: userId }, function(response) {
      // 모든 알림을 읽음 상태로 변경한 후에 빨간 점을 제거합니다.
      $(".noti_btn .new_dot").remove();
  });
}

function removeNewDot() {
  $(".noti_btn .new_dot").remove();
}


  $(".noti_md").click(function (event) {
    event.stopPropagation();
  });

  $(document).click(function () {
    $(".noti_md").hide();
  });

 

  // 초기 알림 상태 설정
  setDefaultNotification();


 // WebSocket 초기화
 var socket = new SockJS('/ws');
 var stompClient = Stomp.over(socket);

 stompClient.connect({}, function (frame) {
   stompClient.subscribe('/topic/notifications/' + userId, function (notification) {
    console.log("WebSocket notification: ", notification); // 이 부분을 추가

     var noti = JSON.parse(notification.body);
     notifications.push(noti);
     setDefaultNotification();
     showNotification(noti.userId, noti.b_title, noti.s_storename, noti.b_isbn, noti.b_s_id);
     newNotificationReceived();  // 새로운 알림이 있을 때 빨간 점 추가

   });
 });

  
  // 빨간 점 추가
  function newNotificationReceived() {
    $(".noti_btn").each(function () {
      if (!$(this).find('.new_dot').length) { // new_dot이 없을 경우에만 추가
        var redDot = $('<span>').addClass('new_dot').text('●');
        $(this).append(redDot);
      }
    });
  }

// showNotification 함수 수정
// function showNotification(userId, b_title, s_storename, b_isbn, b_s_id) {
//   var message = `"` + b_title + `" 상품이 새로 입고되었습니다! 지금 바로 확인해보세요.` + " ― " + s_storename + " 서점";
//   var date = new Date().toLocaleDateString();
  
//   var notificationObj = {
//       userId: userId,
//       message: message,
//       date: date,
//       b_title: b_title,
//       s_storename: s_storename,
//       b_isbn: b_isbn,
//       b_s_id: b_s_id
//   };
  
//  // notifications.push(notificationObj);
//   setDefaultNotification();
//   newNotificationReceived();
// }


 // setDefaultNotification 함수 수정
function setDefaultNotification() {
  var notiBox = $('.notilistbox').first();
  notiBox.html('');
  
  let hasUnread = false;

  if (!isLoggedIn) {
    notiBox.append('<div class="noti_ngout">로그인이 필요한 서비스입니다.</div>');
  } else if (notifications.length === 0) {
    notiBox.append('<div class="noti_ng">표시할 알림이 없습니다.</div>');
  } else {
    notifications.forEach(function (notification) {
      
      if (notification.nb_read === 'N') {
        hasUnread = true;
      }
      console.log("DB에 있는 알림 목록", notification);

      $('.WStest').text('실시간 알림 성공').css('display', 'block');
     
      var newDiv = $('<div></div>');
      newDiv.addClass('noti_item');
      newDiv.attr('data-read', 'false');
      
      var aTag = $('<a></a>');
      aTag.attr('href', '/books/detail/' + notification.b_isbn + '/' + notification.b_s_id);
      
      // var fullMessage = `"` + notification.b_title + `" 상품이 재입고되었습니다! 지금 바로 확인해보세요.` + " ― " + notification.s_storename + " 서점";
     
      // nb_msg 값을 기반으로 다양한 메시지를 생성합니다.
      var fullMessage = '';
      if (notification.nb_msg === '입고') {
        fullMessage = `"` + notification.b_title + `" 상품이 재입고되었습니다! 지금 바로 확인해보세요.` + " ― " + notification.s_storename + " 서점";
      } else if (notification.nb_msg === '대여가능') {
        fullMessage = `"` + notification.b_title + `" 상품 대여 가능 합니다! 지금 바로 확인해보세요.` + " ― " + notification.s_storename + " 서점";
      } // 추가적인 조건을 이곳에 작성
     
     
      aTag.html(fullMessage);
    
      var dateSpan = $('<span></span>');
      dateSpan.addClass('noti_date');
      dateSpan.html(notification.nb_date);
    
      newDiv.append(aTag);
      newDiv.append(dateSpan);
      newDiv.click(markAsRead);
      
      notiBox.prepend(newDiv);
      newNotificationReceived();
    });
  }
}
 
  function markAsRead(event) {
    const notiItem = $(event.currentTarget);
    notiItem.attr('data-read', 'true').css('background', '#cdcdcd');
    checkAllNotificationsRead();
  }
 
  if (hasUnread) {
    newNotificationReceived();
  } else {
    removeNewDot();
  }
  
})