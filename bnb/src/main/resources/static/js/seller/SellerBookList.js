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


$('body').on('click', '.editBtn', function() {
    const row = $(this).closest('tr');
    const b_s_id = row.data('seller-id');
    const b_isbn = row.data('isbn');
    const b_salestock = row.find('.stockNum').val();
    
    const stockUpdate = {
        b_s_id: b_s_id,
        b_isbn: b_isbn,
        b_salestock: parseInt(b_salestock)
    };

    $.ajax({
        url: '/updateStock',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(stockUpdate),
        dataType: 'json',
        success: function(response) {
            alert("재고가 업데이트되었습니다.");
            
            const stockNotifData = {
                isbn: b_isbn,
                sellerId: b_s_id
            };

            // 알림을 처리하는 API 호출
            $.ajax({
                url: '/processStockNotif?isbn=' + b_isbn + '&sellerId=' + b_s_id,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(stockNotifData),
                dataType: 'json',
                success: function(response) {
                    alert("재입고 알림을 성공적으로 처리하였습니다.");
                },
                error: function(xhr, status, error) {
                    alert("재입고 알림 처리에 실패했습니다. 상세 정보: " + error);
                }
            });
        },
        error: function(xhr, status, error) {
            alert("재고 업데이트에 실패했습니다. 상세 정보: " + error);
        }
    });
});
