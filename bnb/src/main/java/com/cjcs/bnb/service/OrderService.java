package com.cjcs.bnb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.CartDto;

import lombok.extern.slf4j.Slf4j;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RentalDto;

// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 구매와 대여로 분리할 수 없고 주문단위로 처리하는 작업
// 구매와 대여가 동시에 처리되어야 하는 작업(트랜잭션 등)

@Slf4j
@Service
public class OrderService {

    @Autowired
    private MemberDao mDao;
    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;
    @Autowired
    private OrderDao oDao;
    @Autowired
    private BookMapper bDao;


    // 킹효진

    // 장바구니 아이템 유무 체크
    public void addToCart(CartDto cartDto) {
        CartDto existingItem = oDao.findPurCartItem(cartDto);
        if (existingItem != null) {
            cartDto.setCart_amount(cartDto.getCart_amount() + existingItem.getCart_amount());
            oDao.updateCartItem(cartDto);
        } else {
            oDao.addToCart(cartDto);
        }
    }

    public boolean addToCartRent(CartDto cartDto) {
        CartDto existingItemRent = oDao.findRentCartItem(cartDto);
        if (existingItemRent != null) {
            return false;
        } else {
            oDao.addToCart(cartDto);
            return true;
        }
    }

    public CartDto findPurCartItem(CartDto cartDto) {
        return oDao.findPurCartItem(cartDto);
    }

    public void updateCartItem(CartDto cartDto) {
        oDao.updateCartItem(cartDto);
    }

    // 수희
    public List<CartDto> purchaseCartToPayment(ArrayList<Integer> pcart_idList) {

        List<CartDto> cPList = new ArrayList<>();

        int listLength = pcart_idList.size();

        for (int n=0; n<listLength; n++) {

            int cart_id = pcart_idList.get(n);
            CartDto cartDto = oDao.getCartByCartId(cart_id);
            cPList.add(cartDto);
        }

        return cPList;
    }
        
    public List<CartDto> rentalCartToPayment(ArrayList<Integer> rcart_idList) {

        List<CartDto> cRList = new ArrayList<>();

        int listLength = rcart_idList.size();

        for (int n=0; n<listLength; n++) {

            int cart_id = rcart_idList.get(n);
            CartDto cartDto = oDao.getCartByCartId(cart_id);
            cRList.add(cartDto);
        }

        return cRList;
    }

    public int getPriceSum(List<CartDto> cPList) {

        int total_b_price = 0;

        for (CartDto cPItem : cPList) {
            CartDto cartDto = oDao.getCartByCartId(cPItem.getCart_id());
            total_b_price += cartDto.getB_price() * cartDto.getCart_amount();
        }
        return total_b_price;
    }

    public int getRentSum(List<CartDto> cRList) {

        int total_b_rent = 0;

        for (CartDto cRItem : cRList) {
            CartDto cartDto = oDao.getCartByCartId(cRItem.getCart_id());
            total_b_rent += cartDto.getB_rent() * cartDto.getCart_rentalperiod() / 7;
        }
        return total_b_rent;
    }

    public int getDeliveryFeeSum(List<CartDto> cList) {

        // HashMap<String, Integer> delivery_fee_map = new HashMap<>();
        int total_delivery_fee = 0;
        List<String> storenames = new ArrayList<>();

        for (CartDto cItem : cList) {
            CartDto cartDto = oDao.getCartByCartId(cItem.getCart_id());
            storenames.add(cartDto.getS_storename());
        }

        HashSet<String> set = new HashSet<>(storenames);  // 중복제거스킬..-_-
        storenames = new ArrayList<>(set);

        for (String storename : storenames) {
            total_delivery_fee += mDao.getDeliveryFeeByStorename(storename);
        }

        return total_delivery_fee;
    }

    @Transactional
    public Boolean addOrder(String c_id, ArrayList<Integer> pcart_idList, ArrayList<Integer> rcart_idList,
                            String o_delivery_sort, String o_recip_addr, String o_recip_name, String o_recip_phone,
                            Integer o_total_pricerent, Integer o_total_deliveryfee, Integer o_total_payment) {

        try {
            
            HashMap<String, Object> orderMap = new HashMap<>();
            orderMap.put("c_id", c_id);
            orderMap.put("o_delivery_sort", o_delivery_sort);
            orderMap.put("o_recip_addr", o_recip_addr);
            orderMap.put("o_recip_name", o_recip_name);
            orderMap.put("o_recip_phone", o_recip_phone);
            orderMap.put("o_total_pricerent", o_total_pricerent);
            if (o_delivery_sort.equals("택배")) {
                orderMap.put("o_total_deliveryfee", o_total_deliveryfee);
                orderMap.put("o_total_payment", o_total_payment);
            } else if (o_delivery_sort.equals("방문수령")) {
                orderMap.put("o_total_deliveryfee", 0);
                orderMap.put("o_total_payment", o_total_pricerent);
            }
            log.info("orderMap:{}", orderMap);
               
            oDao.addOrderSelectKey(orderMap);
            Integer o_id = (Integer)orderMap.get("o_id");
               
            log.info("o_id:{}", o_id);
               
            if (pcart_idList != null) {
               
                for (Integer cart_id : pcart_idList) {
                   
                    CartDto cDto = oDao.getCartByCartId(cart_id);
                    pDao.addPurchaseList(o_id, cDto.getCart_s_id(), cDto.getCart_b_isbn(), c_id, cDto.getCart_amount());
                    bDao.updateSaleStock(cDto.getCart_s_id(), cDto.getCart_b_isbn(), cDto.getCart_amount());
                    oDao.deleteCartItem(cart_id);
                }
            }
           
            if (rcart_idList != null) {
               
                for (Integer cart_id : rcart_idList) {
                    
                    CartDto cDto = oDao.getCartByCartId(cart_id);
                    rDao.addRentalList(o_id, cDto.getCart_s_id(), cDto.getCart_b_isbn(), c_id, cDto.getCart_rentalperiod());
                    bDao.updateRentalStock(cDto.getCart_s_id(), cDto.getCart_b_isbn());
                    oDao.deleteCartItem(cart_id);
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR: "+e.getStackTrace());
            return false;
        }

        return true;
    }

    @Transactional
    public void cancelOrderByOId(Integer o_id) {

        try {

            pDao.cancelPurchaseByOId(o_id);
            rDao.cancelRentalByOId(o_id);

        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }

    }

    // 예림
    // 오늘 판매 건수 카운트
    public int getTodaySellCnt(String s_id) {
        return oDao.getTodaySellCnt(s_id);
    }

    // 오늘 대여 건수 카운트
    public int getTodayRentCnt(String s_id) {
        return oDao.getTodayRentCnt(s_id);
    }

    // 오늘 예약 건수 카운트
    public int getTodayRentResCnt(String rr_s_id) {
        return oDao.getTodayRentResCnt(rr_s_id);
    }

    // 오늘 배송 준비중 건수 카운트
    public int getTodayDeliveryPrepare(String s_id) {
        return oDao.getTodayDeliveryPrepare(s_id);
    }

    // 오늘 배송중 건수 카운트
    public int getTodayDeliverShip(String s_id) {
        return oDao.getTodayDeliverShip(s_id);
    }

    // 오늘 배송 준비완료 건수 카운트
    public int getTodayDeliverComplete(String s_id) {
        return oDao.getTodayDeliverComplete(s_id);
    }

    // 한 달 간 취소 요청 수 카운트
    public int getMonthCancelRequest(String s_id) {
        return oDao.getMonthCancelRequest(s_id);
    }

    // 한 달 간 반품/교환 요청 수 카운트
    public int getMonthReturnRequest(String s_id) {
        return oDao.getMonthReturnRequest(s_id);
    }

    // 입력한 기간 내 총 정산 금액 합산
    public int getCalculate(String Start_Date, String End_Date) {
        List<Integer> RentList = oDao.CalculateRent(Start_Date, End_Date);
        List<Integer> LateList = oDao.CalculateLate(Start_Date, End_Date);
        List<Integer> SellList = oDao.CalculateSell(Start_Date, End_Date);
        List<Integer> ReturnList = oDao.CalculateReturn(Start_Date, End_Date);

        int total = 0;

        // 대여료 합계 계산
        for (Integer Rent : RentList) {
            if (Rent != null) { // null 체크 추가
                total += Rent;
            }
        }

        // 연체료 합계 계산
        for (Integer Late : LateList) {
            if (Late != null) { // null 체크 추가
                total += Late;
            }
        }

        // 판매 금액 합계 계산
        for (Integer Sell : SellList) {
            if (Sell != null) { // null 체크 추가
                total += Sell;
            }
        }

        // 반품 금액 합계 계산
        for (Integer Return : ReturnList) {
            if (Return != null) { // null 체크 추가
                total -= Return;
            }
        }

        return total;
    }

    // 입력한 기간 내 대여료 합계
    public int getCalculateRent(String Start_Date, String End_Date) {
        List<Integer> RentList = oDao.CalculateRent(Start_Date, End_Date);

        int total = 0;

        // 대여료 합계 계산
        for (Integer Rent : RentList) {
            if (Rent != null) { // null 체크 추가
                total += Rent;
            }
        }

        return total;
    }

    // 입력한 기간 내 연체료 합계
    public int getCalculateLate(String Start_Date, String End_Date) {
        List<Integer> LateList = oDao.CalculateLate(Start_Date, End_Date);

        int total = 0;

        // 연체료 합계 계산
        for (Integer Late : LateList) {
            if (Late != null) { // null 체크 추가
                total += Late;
            }
        }

        return total;
    }

    // 입력한 기간 내 판매금액 합계
    public int getCalculateSell(String Start_Date, String End_Date) {
        List<Integer> SellList = oDao.CalculateSell(Start_Date, End_Date);

        int total = 0;

        // 판매 금액 합계 계산
        for (Integer Sell : SellList) {
            if (Sell != null) { // null 체크 추가
                total += Sell;
            }
        }

        return total;
    }

    // 입력한 기간 내 반품/환불 합계
    public int getCalculateReturn(String Start_Date, String End_Date) {
        List<Integer> ReturnList = oDao.CalculateReturn(Start_Date, End_Date);

        int total = 0;

        // 반품 금액 합계 계산
        for (Integer Return : ReturnList) {
            if (Return != null) { // null 체크 추가
                total -= Return;
            }
        }

        return total;
    }

}
