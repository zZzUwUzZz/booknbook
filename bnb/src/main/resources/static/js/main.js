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


     
 
       let index = 0;

// 랜덤 문구 배열
const greetings = ["반갑습니다, 커피향이 가득한", "어서오세요, 음악이 흐르는", "어서오세요, 조용한 골목 책방", "안녕하세요, 편안한 분위기의", "환영합니다, 아늑한 공간의", "반갑습니다! 감성이 넘치는"];

// 랜덤 문구 선택
const randomGreeting = greetings[Math.floor(Math.random() * greetings.length)];

// 서점명 가져오기
const storeName = $('#randomStoreName').val();

// 최종 문구 생성
const text = `"${randomGreeting} ${storeName} 입니다."`;

function typeText() {
  if (index < text.length) {
    $(".maintt").append(text.charAt(index));
    index++;
    setTimeout(typeText, 80); // 100ms delay between each character
  } else {
    // After the text is fully typed
    setTimeout(eraseText, 5000); // 3 seconds delay before erasing
  }
}

function eraseText() {
  const currentText = $(".maintt").text();
  if (currentText.length > 0) {
    $(".maintt").text(currentText.slice(0, -1));
    setTimeout(eraseText, 80); // 100ms delay between each backspace
  } else {
    // After the text is fully erased
    index = 0;
    setTimeout(typeText, 80); // 100ms delay before retyping
  }
}

$(document).ready(function() {
  typeText();
});
 
        