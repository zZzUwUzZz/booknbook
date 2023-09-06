package com.cjcs.bnb.exception;

//예외 처리 
//결제 처리할 때 

public class OutOfStockException extends RuntimeException{
    public OutOfStockException(String message){
        super(message);
    }
}
