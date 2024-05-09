package com.storeManagement.model;

public class OrdersDetailModel extends AbstractModel<OrdersDetailModel> {
    private int order_id;
    private int product_id;
    private String product_name;
    private int quantity ;
    private double price_quotation;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice_quotation() {
        return price_quotation;
    }

    public void setPrice_quotation(double price_quotation) {
        this.price_quotation = price_quotation;
    }
}
