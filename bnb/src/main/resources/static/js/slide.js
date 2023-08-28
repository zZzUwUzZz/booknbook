$(document).ready(function () {
    const slideContainer = $('.slide-container');
    const prevButton = $('.prev-btn');
    const nextButton = $('.next-btn');
    const slideWidth = $('.slide').outerWidth();
    const slideCount = $('.slide').length;
    const slidesPerPage = 4;
    let currentIndex = 0;

    function updateSlidePosition() {
        const offset = -currentIndex * slideWidth * slidesPerPage;
        slideContainer.css('transform', `translateX(${offset}px)`);
    }

    nextButton.click(function () {
        currentIndex = (currentIndex + 1) % Math.ceil(slideCount / slidesPerPage);
        updateSlidePosition();
    });

    prevButton.click(function () {
        currentIndex = (currentIndex - 1 + Math.ceil(slideCount / slidesPerPage)) % Math.ceil(slideCount / slidesPerPage);
        updateSlidePosition();
    });

    // Initialize the slide position
    updateSlidePosition();
});
