package service;

import DTO.AddingProduct;
import model.UserValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class ProductAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(false);
        UserValidation userObject = new UserValidation();
        if(request.getParameter("productName").length()>=3 && request.getParameter("productPrice").length()> 0 && request.getParameter("productQuantity").length() > 0 && request.getParameter("productLink").length() >= 3 && request.getParameter("productModel").length()>=0 && request.getParameter("productCategory").length()>=1 && request.getParameter("productDescription").length()>=3 && request.getParameter("productColor").length()>=3) {

                session.setAttribute("successMessage", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n" +
                        "  <strong>Success!</strong><br> Product added successfully!" +
                        "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "    <span aria-hidden=\"true\">&times;</span>\n" +
                        "  </button>\n" +
                        "</div>");
                String pName = request.getParameter("productName");
                String pPrice = request.getParameter("productPrice");
                String pQuantity = request.getParameter("productQuantity");
                String pLink = request.getParameter("productLink");
                String pModel = request.getParameter("productModel");
                String pCategory = request.getParameter("productCategory");
                String pDescription = request.getParameter("productDescription");
                String pColor = request.getParameter("productColor");
            AddingProduct addingProduct = new AddingProduct(pName, pPrice, pQuantity, pLink, pModel, pCategory, pDescription, pColor);
            try {
                addingProduct.addProduct();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            response.sendRedirect("adminhomepage");
        } else {
            session.setAttribute("warningMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>Error!</strong> Product could not be added!<br>" +
                    "  Please check that you have completed all the fields <br>" +
                    "  with relevant information." +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            System.out.println(request.getParameter("productQuantity"));
            response.sendRedirect("adminhomepage");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
