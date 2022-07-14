<%@ page import="DTO.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@include file="includes/header.jsp" %>

<!-- ========================= SECTION PAGETOP ========================= -->
<section class="section-pagetop bg">
<div class="container">
	<h2 class="title-page">Shopping cart</h2>
</div> <!-- container //  -->
</section>
<!-- ========================= SECTION INTRO END// ========================= -->

<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content padding-y">
<div class="container">

<div class="row">
	<main class="col-md-9">
<div class="card">

<table class="table table-borderless table-shopping-cart">
<thead class="text-muted">
<tr class="small text-uppercase">
  <th scope="col">Product</th>
  <th scope="col" width="120"></th>
  <th scope="col" width="120">Price</th>
  <th scope="col" class="text-right" width="200"> </th>
</tr>
</thead>
<tbody>
<%
	DecimalFormat df = new DecimalFormat("#,###.00");
	session.setAttribute("discount",30);
    List<Product> cartProducts = (List<Product>) session.getAttribute("cartProducts");
    int price=0;
    int discount=0;
    int delivery=20;
    for (Product cartProduct:cartProducts) {
		out.print("<tr>\n" +
				"\t<td>\n" +
				"\t\t<figure class=\"itemside\">\n" +
				"\t\t\t<div class=\"aside\"><img src=\"" + cartProduct.getImageLink() + "\" class=\"img-sm\" width=\"80\" height=\"80\"></div>\n" +
				"\t\t\t<figcaption class=\"info\">\n" +
				"\t\t\t\t<a href=\"product?id=" + cartProduct.getID() + "\" class=\"title text-dark\">");
		out.print(cartProduct.getName());
		out.print("<p class=\"text-muted small\">" + cartProduct.getDescription() + "</a>");
		out.print("</figcaption>\n" +
				"\t\t</figure>\n" +
				"\t</td>");
		out.print("<td> \n" +

				"\t</td>");
		out.print("<td> \n" +
				"\t\t<div class=\"price-wrap\"> \n" +
				"\t\t\t<var class=\"price\">&#x20a6; " + df.format(cartProduct.getPrice()) + "</var> \n" +
				"\t\t\t<small class=\"text-muted\"> VAT Included </small> \n" +
				"\t\t</div> <!-- price-wrap .// -->\n" +
				"\t</td>");
		out.print("<td class=\"text-right\"> \n" +
				"\t<form action = 'remove' method = 'post'>" +
					"<input type = 'text' name = 'idul' value = '"+cartProduct.getID() + "' hidden>" +
					"<input class = 'btn btn-light' type = 'submit' value = 'Remove'>"+
				"</form\n" +
				"\t</td>");
		out.print("</tr>");
		price += cartProduct.getPrice();
	}

%>
</tbody>
</table>

<div class="card-body border-top">
	<a href="payment" class="btn btn-primary float-md-right"> Make Purchase <i class="fa fa-chevron-right"></i> </a>
	<a <% out.print("href=\"homepage\""); %> class="btn btn-light"> <i class="fa fa-chevron-left"></i> Continue shopping </a>
</div>	
</div> <!-- card.// -->

<div class="alert alert-success mt-3">
	<% if(price>=500) {
			delivery=0;
			out.print("<p class=\"icontext\"><i class=\"icon text-success fa fa-truck\"></i> Free Delivery for this order - Subtotal price is higher than &#x20a6; 500</p>");
	}
	%>
</div>

	</main> <!-- col.// -->
	<aside class="col-md-3">
		<div class="card mb-3">
			<div class="card-body">
			<form>
				<div class="form-group">
					<label>Have coupon?</label>
					<div class="input-group">
						<input type="text" class="form-control" name="" placeholder="Coupon code">
						<span class="input-group-append"> 
							<button class="btn btn-primary">Apply</button>
							<br>
						</span>
					</div>
					<br>
					<p class="label-rating text-success"><i class="fas fa-check"></i> Apply Coupon </p>
				</div>
			</form>
			</div> <!-- card-body.// -->
		</div>  <!-- card .// -->
		<div class="card">
			<div class="card-body">
					<dl class="dlist-align">
					  <dt>Subtotal:</dt>
					  <dd class="text-right">&#x20a6; <% out.print(df.format(price)); %></dd>
					</dl>
					<dl class="dlist-align">
					  <dt>Discount:</dt>
					  <dd class="text-right">
						  <%
							  if(session.getAttribute("discount")!=null){
							  	discount=(Integer)session.getAttribute("discount");
							  	out.print("-"+ discount +"%");
							  }
							  else out.print("No discount");
						  %>
					  </dd>
					</dl>
					<dl class="dlist-align">
						<dt>Shipping: </dt>
						<dd class="text-right">
							<% if(delivery>0) out.print("&#x20a6; "+delivery);
								else out.print("Free delivery");
							%>
						</dd>
					</dl>
					<dl class="dlist-align">
					  <dt>Total:</dt>
					  <dd class="text-right  h5"><strong>
						  <%
							  price -= discount/100*price+delivery;
							  if(price>0)
							  	out.print("&#x20a6; "+ df.format(price));
							  else out.print("FREE!");
							  session.setAttribute("orderPrice",price);
						  %>
					  </strong></dd>
					</dl>
					<hr>
					<p class="text-center mb-3">
						<img src="images/misc/payments.png" height="26">
					</p>
					
			</div> <!-- card-body.// -->
		</div>  <!-- card .// -->
	</aside> <!-- col.// -->
</div>

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg padding-y">
<div class="container">
<h6>Payment and refund policy</h6>
<p>It's good to read private policy.</p>

</div><!-- container // -->
</section>
