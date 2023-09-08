$(document).ready(function() {
    $(".favoriteButton").click(function() {
        const userId = $(this).data("user-id");
        const storeId = $(this).data("store-id");
        const buttonId = "favoriteButton_" + storeId;
        const isFavorite = $(this).data("is-favorite");

        let url = isFavorite ? "/removeFavorite" : "/addFavorite";

        $.ajax({
            url: url,
            type: "POST",
            data: { userId: userId, storeId: storeId },
            success: function(response) {
                if (response.isSuccess) {
                    const newStatus = isFavorite ? "즐겨찾기 추가" : "즐겨찾기 해제";
                    $("#" + buttonId).text(newStatus);
                    $("#" + buttonId).data("is-favorite", !isFavorite);  // 상태 업데이트
                }
            }
        });
    });
});
