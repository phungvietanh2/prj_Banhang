/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class OrderDetail {

    private int oid, productID, quantity;
    private double price;
    private String status;
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int productID, int quantity, double price, String status, Product product) {
        this.oid = oid;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getProductID() {
        return productID;
    }
     
    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "oid=" + oid + ", productID=" + productID + ", quantity=" + quantity + ", price=" + price + ", status=" + status + ", product=" + product + '}';
    }

}
