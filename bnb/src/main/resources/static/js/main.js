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

 

