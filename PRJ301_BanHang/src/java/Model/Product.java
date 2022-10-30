/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author 84923
 */
public class Product {

    private int productID;
    private String name, description, img;
    private int categoryID, brandID, quantity;
    private float price;
    private Date date;
    private Brand brand;
    private OrderDetail orderDetail;
    public Product() {
    }

    public Product(int productID, String name, String description, String img, int categoryID, int brandID, int quantity, float price, Date date, Brand brand, OrderDetail orderDetail) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.img = img;
        this.categoryID = categoryID;
        this.brandID = brandID;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
        this.brand = brand;
        this.orderDetail = orderDetail;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    

    @Override
    public String toString() {
        return name;
    }

    
    

    
    
    
   
}
