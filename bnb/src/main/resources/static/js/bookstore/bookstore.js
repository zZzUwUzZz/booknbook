
$(document).ready(function() {
    let currentSlide = 0;
    const slides = $(".bsSlide");
    const totalSlides = slides.length;
  
    function updateSlide() {
      slides.removeClass("active");
      $(slides[currentSlide]).addClass("active");
    }
  
    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        updateSlide();
      }

      
    $("#prev").click(function() {
      currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
      updateSlide();
    });
  
    $("#next").click(nextSlide);
 
    setInterval(nextSlide, 5000);

    updateSlide();
  });
  