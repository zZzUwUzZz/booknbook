package com.cjcs.bnb.exception;

//예외 처리 
//결제 처리할 때 
//주문을 할 때 재고가 주문갯수보다 없는 경우 
public class OutOfStockException extends RuntimeException{
    public OutOfStockException(String message){
        super(message);
    }
}
