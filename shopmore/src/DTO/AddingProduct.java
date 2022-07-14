package DTO;

import java.sql.*;

public class AddingProduct {
    String productName;
    String productPrice;
    String productQuantity;
    String productLink;
    String productModel;
    String productCategory;
    String productDescription;
    String productColor;

    public AddingProduct(String productName, String productPrice, String productQuantity, String productLink, String productModel, String productCategory, String productDescription, String productColor) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productLink = productLink;
        this.productModel = productModel;
        this.productCategory = productCategory;
        this.productDescription = productDescription;
        this.productColor = productColor;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(String productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductLink() {
        return productLink;
    }

    public void setProductLink(String productLink) {
        this.productLink = productLink;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }
    @Override
    public String toString() {
        return "AddingProduct{" +
                "productName='" + productName + '\'' +
                ", productPrice='" + productPrice + '\'' +
                ", productQuantity='" + productQuantity + '\'' +
                ", productLink='" + productLink + '\'' +
                ", productModel='" + productModel + '\'' +
                ", productCategory='" + productCategory + '\'' +
                ", productDescription='" + productDescription + '\'' +
                '}';
    }

    public String addProduct() throws SQLException {
        Connection conn;
        String sql = null;
        Statement stmt = null;

        ResultSet rs = null;
        try{
            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
                int proPrice = Integer.parseInt(getProductPrice());
                int proQty = Integer.parseInt(getProductQuantity());
                int proCat = Integer.parseInt(getProductCategory());
                sql = "INSERT INTO products (name, price, quantity, image_link, category_id, description, model_no, color) " +
                        "values ('" + productName + "', '" + proPrice + "', '" + proQty + "','"+ productLink + "','" + proCat + "','" + productDescription + "','" + productModel + "','" + productColor + "');";                         ;
            //System.out.println(sql);
            stmt.executeUpdate(sql);
            return "Product " + productName +" added successfully!";

        }catch (SQLException e){
            e.getMessage();
        }
        return "FAILED to add product!";
    }
}

