$(document).ready(function() {
    var currentSlide = 0;
    var totalSlides = $('.slide').length;
    var slidesPerGroup = 4;
    var totalGroups = Math.ceil(totalSlides / slidesPerGroup);
  
    function showSlide(index) {
      $('.slider').css('transform', 'translateX(' + (-index * 100 / slidesPerGroup) + '%)');
    }
  
    function updateSlidesVisibility() {
      $('.slide').removeClass('active');
      var startIndex = currentSlide * slidesPerGroup;
      var endIndex = Math.min(startIndex + slidesPerGroup, totalSlides);
      for (var i = startIndex; i < endIndex; i++) {
        $('.slide').eq(i).addClass('active');
      }
    }
  
    updateSlidesVisibility();
  
    $('.next-btn').click(function() {
      if (currentSlide < totalGroups - 1) {
        currentSlide++;
        showSlide(currentSlide);
        updateSlidesVisibility();
      }
    });
  
    $('.prev-btn').click(function() {
      if (currentSlide > 0) {
        currentSlide--;
        showSlide(currentSlide);
        updateSlidesVisibility();
      }
    });
  });
  