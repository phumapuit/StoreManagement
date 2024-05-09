package com.storeManagement.model;

public class CategoryModel extends AbstractModel<CategoryModel> {

    private String logo;
    private String category_name;

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
}
