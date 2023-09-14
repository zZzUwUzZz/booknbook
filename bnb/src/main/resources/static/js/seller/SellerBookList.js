
$(".stockNum, .wareNum").attr({
    "max" : 999,
    "min" : 1
});

$('.bkwareBtn').click(function() {
    $('.saletext').text('판매입고');
    $('.waretext').text('대여입고');
    $('.bkstBtn').text('입고 처리').addClass('ware');
   $('.editBtn').text('입고 처리').addClass('ware').css('background','#9aa0a6');
  
  
    $('.allbkstatusBtn').text('전체 입고 처리').addClass('ware');

    $('tr').each(function(index, element) {
        if(index !== 0) {  // skip the header row
            $(element).find('.stockNum').attr('id', `stockNum-${index}`).attr('name', `stockNumSt-${index}`);
            $(element).find('.wareNum').attr('id', `wareNum-${index}`).attr('name', `wareNumSt-${index}`);
            $(element).find('.editBtn').attr('id', `editBtn-${index}`);
        }
    });
});

$(document).ready(function() {
    $('.bkwareBtn').trigger('click');
});

 
// existing jQuery code
$(`editBtn-${index}`).click(function() {
    var stockNum = $(this).closest('tr').find('.stockNum').val();
    var wareNum = $(this).closest('tr').find('.wareNum').val();
    // assuming you have other fields like category, title, etc.

    $.post("/updateStock", {
        saleStock: stockNum,    
        rentalStock: wareNum,
        // other fields
    }, function(data) {
        alert("입고 처리 되었습니다");
    });
});
 

