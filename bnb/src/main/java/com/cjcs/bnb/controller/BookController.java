package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;

public class BookController {
    private String categoryTitle;
    private String bookCover;
    private String bookTitle;
    private int price;
    private String author;
    private int quantity;
    private List<String> cartAdd = new ArrayList<>();
    private List<String> likeBook = new ArrayList<>();
    private boolean isOutOfStock = false;

    // 수량 조정 - 감소
    public void adjustQuantity() {
        if (quantity > 0) {
            quantity--;
        }
    }
    
    // 수량 - 증가
    public void manageQuantity() {
        quantity++;
    }

    public int calculateTotalPrice() {
        return price * quantity;
    }

    // 대여 - 장바구니 
    public void rentAdd() {
        cartAdd.add(bookTitle);
        // Display rental added notification
        System.out.println("cartAdd: " + bookTitle);
        // Navigate to rent.jsp
        // navigateToRentPage();
    }

    // Add to cart
    public void cartAdd() {
        if (isOutOfStock) {
            cartAdd.add(bookTitle);
            // Display added to cart notification
            System.out.println("Added to cart: " + bookTitle);
            // Navigate to cart.jsp
            // navigateToCartPage();
        } else {
            // Display out of stock notification
            System.out.println("Book is out of stock.");
            // Activate notification button
            // activateNotificationButton();
        }
    }
    // 책소개
    public String bookIntroduction() {
        return "This book is...";
    }

    // 찜 버튼
    public void likeBook() {
        likeBook.add(bookTitle);
        // Display liked book notification
        System.out.println("Likebook: " + bookTitle);
    }

    public String getCategoryTitle() {
        return categoryTitle;
     }
 
}
