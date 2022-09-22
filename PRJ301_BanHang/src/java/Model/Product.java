/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author 84923
 */
public class Product {
    private int productID;
    private String name,description,img,gb ,color;
    private int categoryID,brandID,quantity;
    private float price;

    public Product() {
    }

    public Product(int productID, String name, String description, String img, String gb, String color, int categoryID, int brandID, int quantity, float price) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.img = img;
        this.gb = gb;
        this.color = color;
        this.categoryID = categoryID;
        this.brandID = brandID;
        this.quantity = quantity;
        this.price = price;
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

    public String getGb() {
        return gb;
    }

    public void setGb(String gb) {
        this.gb = gb;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", description=" + description + ", img=" + img + ", gb=" + gb + ", color=" + color + ", categoryID=" + categoryID + ", brandID=" + brandID + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
}
