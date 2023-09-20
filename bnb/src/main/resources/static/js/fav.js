  
 
    // 클릭하면 모달에 있는 정보와 즐겨찾기 상태 업데이트
    $('.bs_item').click(function () {

        const storeId = $(this).data('store-id');
     
        if (userId !== null && typeof userId !== 'undefined') {
            // 즐겨찾기 상태 불러오기
        $.ajax({
            url: `/isFavorite?userId=${userId}&storeId=${storeId}`,
            type: 'GET',
            success: function (response) {
                console.log("스토어:" , storeId);
                console.log("회원:" , userId);

                const buttonId = `favoriteButton_${storeId}`;
                const favoriteButton = $('#' + buttonId).length ? $('#' + buttonId) : $('.favoriteButton');
                favoriteButton.attr('id', buttonId);
                favoriteButton.data('storeId', storeId);
                favoriteButton.data('userId', userId);
            },
            error: function (error) {
                console.log("Error fetching store details:", error);
            }
        });
    }   
        // 서점 상세 정보 불러오기
        $.ajax({
            url: `/get_store_details?id=${storeId}`,
            type: 'GET',
            success: function (data) {
                
                console.log("모달 스토어:" , storeId);
                console.log("모달 회원:" , userId);

                $('#storeImg').attr('src', "/uploads/" + data.store_img);
                $('#storeAddr').text(data.store_addr);
                $('#storeName').text(data.store_name);
                $('#storeDescription').text(data.store_description);
                $('#storePhone').text(data.store_phone);
                $('a[href="/bookstore/detail/"]').attr('href', '/bookstore/detail/' + data.store_s_id); // 추가된 부분

            },
            error: function (error) {
                console.log("Error fetching store details:", error);
            }
        });
    });
 
    function updateFavoriteButton(userId, storeId) {
        $.ajax({
            url: "/isFavorite",
            type: "GET",
            data: { userId, storeId },
            success: function (response) {
                const favoriteButton = $("#favoriteButton_" + storeId);
                const newIcon = response.isFavorite ?
                    '<span class="material-symbols-sharp" id="favtrue">bookmark</span>' :
                    '<span class="material-symbols-sharp" id="favfalse">bookmark</span>';
                favoriteButton.html(newIcon);
                favoriteButton.data("is-favorite", response.isFavorite);
            }
        });
    }

    // 상점 아이템 클릭 시 모달 열고 즐겨찾기 상태 업데이트
    $(document).on('click', '.bs_item', function () {
        const storeId = $(this).data("store-id");

        if (userId !== null && typeof userId !== 'undefined') {
            // 즐겨찾기 상태 업데이트
            updateFavoriteButton(userId, storeId);
        }
        const favoriteButton = $(".favoriteButton"); // 모달 내의 즐겨찾기 버튼
        favoriteButton.attr('id', `favoriteButton_${storeId}`);
        favoriteButton.data('store-id', storeId);
        favoriteButton.text("");
        favoriteButton.data("is-favorite", "");
        // 모달 열기
        $('#storeDetailModal').css('display', 'block');
        setTimeout(function () {
            $('#storeDetailModal').css('transform', 'translateX(92%)');
        }, 50);
    });

    // 모달 닫기 버튼 클릭
    $(document).on('click', '.close-button', function () {
        const favoriteButton = $(".favoriteButton");
        favoriteButton.text("");
        favoriteButton.data("is-favorite", "");
        $('#storeDetailModal').css('transform', 'translateX(-40%)');
    });

    // 즐겨찾기 버튼 클릭 이벤트 핸들러
    $(document).on('click', '[id^=favoriteButton_]', function () {
        
        if (!isLoggedIn) {
            alert('로그인 후 이용 가능합니다.');
            return;
        }

        const storeId = $(this).data("store-id");
        const isFavorite = $(this).data("is-favorite");
        const button = $(this);
        const url = isFavorite ? "/removeFavorite" : "/addFavorite";

        $.ajax({
            url: url,
            type: "POST",
            data: { userId, storeId },
            success: function (response) {
                if (response.isSuccess) {
                    const newIsFavorite = !isFavorite;
                    const newIcon = newIsFavorite ?
                        '<span class="material-symbols-sharp" id="favtrue">bookmark</span>' :
                        '<span class="material-symbols-sharp" id="favfalse">bookmark</span>';
                    button.html(newIcon);
                    button.data("is-favorite", newIsFavorite);
                }
            }
        });
    });
 