/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Order {

    private int id;
    private Date date;
    private int accID;
    private double totalmoney;
    private int status;
    private Account account;
    private int nam;
    private int thang;

    public Order() {
    }

    public Order(int id, Date date, int accID, double totalmoney, int status, Account account, int nam, int thang) {
        this.id = id;
        this.date = date;
        this.accID = accID;
        this.totalmoney = totalmoney;
        this.status = status;
        this.account = account;
        this.nam = nam;
        this.thang = thang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getNam() {
        return nam;
    }

    public void setNam(int nam) {
        this.nam = nam;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    
    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", date=" + date + ", accID=" + accID + ", totalmoney=" + totalmoney + ", status=" + status + ", account=" + account + '}';
    }

}
