<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
   .container-mypage{
  min-height: 86vh;
}
</style>
<footer>

    <div class="ft">

        <div class="sns_link">
            <a>INSTAGRAM</a><br>
        </div>

        <div>
            <p>© 2023 BOOK N BOOK.</p>
        </div>
    </div>

</footer>

<script>
$(document).ready(function() {
  // Get the height of the window and page content
  const pageHeight = $(window).height();
  const contentHeight = $(".container-mypage",".bkIntoContain").height();

  // Convert 83vh to pixels
  const minHeight = 0.86 * pageHeight;
  
  // Check if the page height is below 83vh
  if (contentHeight < minHeight) {
    // Set the height to 84vh
    $(".container-mypage",".bkIntoContain").css("min-height", "87vh");
  }
});
</script>