package com.storeManagement.model;

import java.io.Serializable;

public class OrderDetailItem implements Serializable {

    private String images;
    private String product_name;
    private String quantity;
    private String price_quotation;

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice_quotation() {
        return price_quotation;
    }

    public void setPrice_quotation(String price_quotation) {
        this.price_quotation = price_quotation;
    }
}
