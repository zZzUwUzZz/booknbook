$(document).ready(function () {
    const slideContainer = $('.slide-container');
    const slides = $('.slide');
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
