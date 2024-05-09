package com.storeManagement.model;

public class CartItem {
    // luu tru thong tin luu order detail
    private String productId;
    private String productName;
    private String productQuantity;
    private String totalBillOrderDetail;
    // luu tru thong tin summary_order
    private String totalBill;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(String productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getTotalBillOrderDetail() {
        return totalBillOrderDetail;
    }

    public void setTotalBillOrderDetail(String totalBillOrderDetail) {
        this.totalBillOrderDetail = totalBillOrderDetail;
    }

    public String getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(String totalBill) {
        this.totalBill = totalBill;
    }
}
