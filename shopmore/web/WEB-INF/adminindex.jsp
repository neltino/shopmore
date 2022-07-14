<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Costin
  Date: 25-May-20
  Time: 02:00
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

%>

<section class="section-name padding-y-sm">
    <div class="container">



        <div class="row">
            <div class="card mx-auto" style="max-width:520px; margin-top:40px;">
                <article class="card-body">
                    <header class="mb-4"><h4 class="card-title">Add Product</h4></header>
                    ${errorMessage} <!-- OR --> ${successMessage} <!-- OR --> ${warningMessage}
                    <%

                        session.setAttribute("errorMessage",null);
                        session.setAttribute("warningMessage",null);
                        session.setAttribute("successMessage",null);
                    %>
                    <form name="addProduct" action="ProductAdd" method="post">
                        <div class="form-group">
                            <label><i class="fa fa-edit"></i> Product name</label>
                            <input type="text" name="productName" class="form-control" placeholder="">
                        </div> <!-- form-group end.// -->
                        <div class="form-row">
                            <div class="col form-group">
                                <label><i class="fas fa-naira-sign">&#x20A6;</i> Price</label>
                                <input type="number" name="productPrice" class="form-control" placeholder="">
                            </div> <!-- form-group end.// -->
                            <div class="col form-group">
                                <label><i class="">&#x2116;</i> Quantity</label>
                                <input type="number" name="productQuantity" class="form-control" placeholder="">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->

                        <div class="form-row">
                            <div class="col form-group">
                                <label><i class="fas fa-link"></i> Image Link</label>
                                <input type="text" name="productLink" class="form-control" placeholder="">
                            </div> <!-- form-group end.// -->
                            <div class="col form-group">
                                <label><i class="fas fa-fill-drip"></i> Colour</label>
                                <input type="text" name="productColor" class="form-control" placeholder="">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label><i class="fas fa-list-ol"></i> Model &#x2116;</label>
                                <input type="text" name="productModel" class="form-control">
                            </div>
                            <div class="form-group col-md-6">
                                <label><i class="fas fa-layer-group"></i> Category</label>
                                <select id="inputState" name="productCategory" class="form-control">
                                    <option> ------------- </option>
                                    <option value="1" selected="">Fashion</option>
                                    <option value="2">Home Interior</option>
                                    <option value="3">Others</option>

                                </select>
                            </div> <!-- form-group end.// -->
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-pen-nib"></i> Description</label>
                            <input type="text" name="productDescription" class="form-control">
                        </div>



                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Add Product  </button>
                        </div> <!-- form-group// -->
                    </form>
                </article><!-- card-body.// -->
            </div> <!-- card .// -->
        </div> <!-- row.// -->

    </div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->


<!-- ========================= SECTION  ========================= -->

<!-- ========================= SECTION  END// ======================= -->
<%@include file="../includes/footer.jsp" %>
