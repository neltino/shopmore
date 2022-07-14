package model;

import DTO.AdminLogin;
import DTO.UserLogin;
import DTO.UserRegister;

public class AdminValidation {

    public boolean correctCredentials(String sUserName, String sUserPassword){

        AdminLogin DB_User = new AdminLogin();

        return DB_User.validateCredentials(sUserName,sUserPassword);
    }

//    public boolean newUser(String sFirstName, String sLastName, String sUserName, String sUserPassword, Integer age, String country, String city, Integer zipcode, String address){
//
//        UserRegister DB_User = new UserRegister();
//
//        return DB_User.newUser(sFirstName, sLastName, sUserName, sUserPassword, age, country, city, zipcode, address);
//    }
}
