    package com.cjcs.bnb.service;

    import java.util.Date; // java.util.Date를 import
    import java.sql.Timestamp; // java.sql.Timestamp를 import

    import java.util.List;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.http.HttpStatus;
    import org.springframework.http.ResponseEntity;
    import org.springframework.messaging.simp.SimpMessagingTemplate;
    import org.springframework.stereotype.Service;
    import org.springframework.transaction.annotation.Transactional;

    import com.cjcs.bnb.dto.BookDto;
    import com.cjcs.bnb.dto.NotifBoardDto;
    import com.cjcs.bnb.dto.StockNotifDto;
    import com.cjcs.bnb.dto.StockUpdateDto;
    import com.cjcs.bnb.mappers.StockMapper;
@Service
public class StockService {
    @Autowired
    private StockMapper stockMapper;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    
    public boolean updateStock(StockUpdateDto stockUpdateDto) {
        return stockMapper.updateStock(stockUpdateDto) > 0;
    }

    public List<BookDto> SellerBookListDT(String s_id, String filter, String keyword) {
        return stockMapper.SellerBookListDT(s_id, filter, keyword);
    }

    public BookDto BookInfoDt(String isbn, String sellerId) {
        return stockMapper.BookInfoDt(isbn, sellerId);
    }

    public boolean findStockNotif(StockNotifDto stockNotifDto) {
        return stockMapper.findStockNotif(stockNotifDto) != null;
    }

    public void insertStockNotif(StockNotifDto stockNotifDto) {
        stockMapper.insertStockNotif(stockNotifDto);
    }

    

    // 재입고 신청자들에게 보낼 알림창 목록
    public void processStockNotif(String isbn, String sellerId) {
        List<StockNotifDto> usersToNotify = stockMapper.findUsersToNotify(isbn, sellerId);
        for (StockNotifDto user : usersToNotify) {
            // Create notification message
            NotifBoardDto notif = new NotifBoardDto();
            notif.setNb_m_id(user.getC_id());
            notif.setNb_msg("Your book with ISBN: " + sellerId + isbn + " is now available.");
            
            // Add notification
            stockMapper.insertNotification(notif);

            // Remove the user from Stock_Notif
            stockMapper.deleteStockNotif(user);
        }
    }


    public boolean checkAlreadyRequested(StockNotifDto stockNotif) {
        return stockMapper.findStockNotif(stockNotif) != null;
    }

    public void addStockNotification(StockNotifDto stockNotif) {
        System.out.println("Adding stock notification: " + stockNotif);
        stockMapper.insertStockNotif(stockNotif);
    }

 
    // 재입고 알림 처리
    // @Transactional
    // public ResponseEntity<String> processStock(String isbn, String sellerId) {
    // System.out.println("Processing stock for ISBN: " + isbn + ", SellerID: " +
    // sellerId);

    // List<StockNotifDto> usersToNotify = stockMapper.findUsersToNotify(isbn,
    // sellerId);
    // for (StockNotifDto user : usersToNotify) {
    // // 알림 메시지 생성
    // NotifBoardDto notif = new NotifBoardDto();
    // notif.setNb_m_id(user.getC_id());
    // notif.setNb_msg("Your book with ISBN: " + isbn + " is now available.");

    // // 알림 추가
    // stockMapper.insertNotification(notif);

    // // 신청자 정보 삭제
    // stockMapper.deleteStockNotif(user);

    // simpMessagingTemplate.convertAndSend("/topic/notifications/customer001",
    // notif.getNb_msg());

    // }
    // return new ResponseEntity<>("Processed", HttpStatus.OK);
    // }


}