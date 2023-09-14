package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.dto.StockUpdateDto;

@Mapper
public interface StockMapper {
    int updateStock(StockUpdateDto stockUpdateDto);

    List<StockNotifDto> getNotifList(String b_s_id, String b_isbn);

    void addNotifToBoard(NotifBoardDto notifBoard);

    void removeNotif(StockNotifDto notif);

    List<BookDto> SellerBookListDT(String s_id, String filter, String keyword);

    BookDto BookInfoDt(String isbn, String sellerId);
}
