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


        // 메인 텍스트 
        const text = `"어서오세요, 조용한 골목 책방 한강 서점 입니다."`;
        let index = 0;
    
        function typeText() {
          if (index < text.length) {
            $(".maintt").append(text.charAt(index));
            index++;
            setTimeout(typeText, 80); // 100ms delay between each character
          } else {
            // After the text is fully typed
            setTimeout(eraseText, 3000); // 3 seconds delay before erasing
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