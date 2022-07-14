package service;

import DTO.Admin;
import model.AdminValidation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class admin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        AdminValidation adminValidation = new AdminValidation();
        Admin myAdmin = new Admin();

        if (adminValidation.correctCredentials(request.getParameter("username"),request.getParameter("password"))) {
            myAdmin = myAdmin.getUserDetailsByName(request.getParameter("username"));

            HttpSession session = request.getSession(true);

            if (request.getParameter("rememberMe")==null)
                session.setMaxInactiveInterval(600); // The session will expire in 10 minutes, starting from user's last request
            session.setAttribute("userID",myAdmin.getAdminID());
            session.setAttribute("userName",myAdmin.getEmail());
            session.setAttribute("firstName",myAdmin.getFirstName());
            session.setAttribute("lastName",myAdmin.getLastName());

            session.setAttribute("uCartItems", 0);

            response.sendRedirect("adminhomepage");
        }
        else {
            request.setAttribute("errorMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>Error!<br></strong>Incorrect username or password!\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
        System.out.println(request.getParameter("username"));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
