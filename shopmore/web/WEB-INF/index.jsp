<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Decagon
  Date: 26-June-2022
  Time: 18:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>

${warningMessage} ${successMessage}
<%--  display the message in the session variable --%>
<%
    session.setAttribute("warningMessage",null);  //then clean up
    session.setAttribute("successMessage",null);  //after yourself

    Product product = new Product();
    List<Product> homepageProducts;
    if(session.getAttribute("homepageProducts")==null){
        homepageProducts = product.getNewestProducts();
    }else homepageProducts = (List<Product>) session.getAttribute("homepageProducts");
    DecimalFormat df = new DecimalFormat("#, ###.00");
%>

<section class="section-name padding-y-sm">
    <div class="container">
        <header class="section-heading">
            <h3 class="section-title">Latest Products</h3>
        </header><!-- sect-heading -->


        <div class="row">
            <%
                for (Product homepageProduct:homepageProducts) {
                    out.print("<div class=\"col-md-3\">\n" +
                            "                <div href=\"#\" class=\"card card-product-grid\">\n" +
                            "                    <a href=\"product?id="+ homepageProduct.getID() +"\" class=\"img-wrap\">");
                    out.print("<img src=\"" + homepageProduct.getImageLink() + "\"> </a>");
                    out.print("<figcaption class=\"info-wrap\">\n" +
                            "                        <a href=\"product?id="+ homepageProduct.getID() +"\" class=\"title\">");
                    if(homepageProduct.getName().length()>54){
                        out.print(homepageProduct.getName().substring(0,50));
                        out.print("...</a>");
                    } else {
                        out.print(homepageProduct.getName());
                        out.print("</a>");
                    }
                    out.print("<div price mt-1'>&#x20A6; "+ df.format(homepageProduct.getPrice()) +"</div>");

                    out.print("<button id = 'prd"+ homepageProduct.getID() +"' class = 'btn btn-light'><i style = 'color: grey' class = 'fas fa-heart' id = 'pr"+homepageProduct.getID() + "' ></i></button>");
                    out.print("</figcaption>\n" +
                            "                </div>\n" +
                            "            </div>");

                    out.print("<script> " +
                            "let myID"+ homepageProduct.getID() + " = document.getElementById('prd"+ homepageProduct.getID() +"'); "+
                                "myID"+ homepageProduct.getID() + ".addEventListener('click', function(){" +

                                       "if(pr"+ homepageProduct.getID() + ".style.color == 'grey'){" +
                                        "pr" +homepageProduct.getID() + ".style.color = 'red';" +
                            "}else{" +
                                   "pr" + homepageProduct.getID() + ".style.color = 'grey'"+
                            "}" +


                                    "})" +
                            "</script>");
                }

            %>
        </div> <!-- row.// -->

    </div><!-- container // -->
</section>

<!-- ========================= SECTION  END// ========================= -->


<!-- ========================= SECTION  ========================= -->

<!-- ========================= SECTION  END// ======================= -->
<%@include file="../includes/footer.jsp" %>
