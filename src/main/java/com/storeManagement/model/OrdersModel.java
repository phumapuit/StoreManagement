package com.storeManagement.model;

public class OrdersModel extends AbstractModel<OrdersModel> {
    private int user_id;
    private double summary_order;
    private String vnp_TxnRef;
    private int status_payment;


    public String getVnp_TxnRef() {
        return vnp_TxnRef;
    }

    public void setVnp_TxnRef(String vnp_TxnRef) {
        this.vnp_TxnRef = vnp_TxnRef;
    }

    public int getStatus_payment() {
        return status_payment;
    }

    public void setStatus_payment(int status_payment) {
        this.status_payment = status_payment;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getSummary_order() {
        return summary_order;
    }

    public void setSummary_order(double summary_order) {
        this.summary_order = summary_order;
    }
}
