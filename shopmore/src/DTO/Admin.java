package DTO;

import java.sql.*;

public class Admin extends DBConnector{

    Integer adminID;
    String username;
    String email;
    String firstName;
    String lastName;


    public Admin() {}

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public Integer getAdminID() {
        return adminID;
    }
    public String getUsername() {
        return username;
    }
    public String getEmail() {
        return email;
    }
    public String getFirstName() {
        return firstName;
    }
    public String getLastName() {
        return lastName;
    }


//    public Admin getUserDetailsByID(Integer customerID) {
//        Admin myAdmin = new Admin();
//
//        Connection conn;
//        String sql;
//        Statement stmt;
//
//        ResultSet rs;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//
//            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);
//
//            stmt = conn.createStatement();
//            sql = "SELECT username, firstname, lastname FROM Admin WHERE ID = " + 1 + "";
//            rs = stmt.executeQuery(sql);
//            System.out.println(">> Getting user details for `" + username + "`");
//
//            while (rs.next()) {
//                myAdmin.setUsername(rs.getString("username"));
//                myAdmin.setFirstName(rs.getString("firstname"));
//                myAdmin.setLastName(rs.getString("lastname"));
//
//            }
//            rs.close();
//
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        return myAdmin;
//    }

    public Admin getUserDetailsByName(String username){
        Admin myAdmin = new Admin();

        Connection conn;
        String sql;
        Statement stmt;

        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(DBConnector.DB_URL, DBConnector.USER, DBConnector.PASS);

            stmt = conn.createStatement();
            sql = "SELECT ID, username, firstname, lastname  FROM admin where username = '" + username + "'";
            rs = stmt.executeQuery(sql);
            System.out.println("\n>> Getting user details for `" + username + "`");

            while (rs.next()) {
                myAdmin.setAdminID(rs.getInt(1));
                myAdmin.setEmail(rs.getString(2));
                myAdmin.setFirstName(rs.getString(3));
                myAdmin.setLastName(rs.getString(4));
            }
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return myAdmin;
    }
}
