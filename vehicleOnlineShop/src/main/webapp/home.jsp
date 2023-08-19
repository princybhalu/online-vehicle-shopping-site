<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.web.servlet.ModelAndView " %>
<%@ page import="org.springframework.stereotype.Controller " %>
<%@ page import="vehicleOnlineShop.Product" %>
<%@ page import="org.hibernate.Session " %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vehicle Vila</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style>
	.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}
	</style>
  </head>
  <body>
     <% 
      String name = null;
      int rd = (Integer) request.getAttribute("rollid");
       name = (String ) request.getAttribute("Username");
      int id = (Integer) request.getAttribute("id");
      
     
    	     
     
 
     %>
       
       <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; font-size : 20px; ">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" style="font-size: 23px;">Vehicle Vila</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <%
                  if(rd == 1){
              %>
              
              <li class="nav-item">
                <a class="nav-link" href="addProduct.jsp">Add Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="viewCustomer.jsp">View Customer</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="inventory.jsp">Inventory</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Log Out</a>
              </li>
              
              
               <% }else{ %>
              <li class="nav-item">
                <a class="nav-link" href="showOrder?id=${ id}">Show Order</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="myProfile?id=${id}">My Profile</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="wishlist?id=${id}">Wish List</a>
              </li>
              
                            <% } %>
              
              
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>

    <% if(name != null){ %>
       <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; " >Welcome ${Username} In Vehicle Vila</div>  
       <% } %>
       <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; " > ${Msg} </div> 
       
       
       
             
       <%
       try {
       	Configuration cfg = new Configuration().configure().addAnnotatedClass(Product.class);			
       	cfg.configure("hibernate.cfg.xml");
       	SessionFactory factory = cfg.buildSessionFactory();
       	Session Session = factory.openSession();
       	
       	
       	
       	java.util.List li = Session.createQuery("from Product").list();
       	java.util.Iterator it=li.iterator();
       	int col = 0 ;
       	while(it.hasNext()) {
       		Object o = (Object)it.next();
       		 Product rs = (Product)o;
       	     col++;
       	    
       		 if(col % 3 == 1 ){ %>
       			 <div class="container" style="margin-top: 25px;">
       			 <div class="row"> 
       			 
       			 <% }  %>
       	     
       	     
       	     <div class="col-sm-4 card-group ">
                <div class="card" style="width: 18rem;">
                     <img src="<% out.print(rs.getImageurl()); %>" class="card-img-top"  style="hight='300'; width='300'" >
                    <div class="card-body">
                      <h5 class="card-title"><% out.print(rs.getName());  %></h5>
                      <p class="card-text"><% out.print(rs.getFeature()); %></p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item"><% out.print(rs.getPrice()); %></li>
                      <li class="list-group-item"><% out.print(rs.getCompany()); %></li>
                     
                   
                    
                      <%
                            if(rd != 1){
                       %>
                        </ul>
                        <div class="card-body"> 
                       <a class="btn btn-primary" href="addToCard?id=${id}&pid=<% out.print(rs.getId());  %>" role="button">Add To WishList</a>
                         <a class="btn btn-primary" href="placeOrderForm?pid=<% out.print(rs.getId());  %>&id=${id}" role="button">Place Order</a>
                        </div> 
                      <% }else{ %>
                       <li class="list-group-item"> <% out.print(rs.getStock()); %></li>
                        </ul> <div class="card-body"> 
                      <a class="btn btn-primary" href="addstock?pid=<% out.print(rs.getId());  %>" role="button">Add Stock</a>
                       </div> 
                      <% } %>
                   
                  </div>
            </div>


               
                <%  
                
                if(col % 3 == 0){ %>
      			</div> </div>  
      			 <%  } 
       	}
       	Session.close();
       	factory.close();
       }
       catch(Exception ex) {
       	System.out.println(ex);	
       }



                
%>
      
       
       
         <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
     <br> <br> <br>  <br> <br> <br>
  </body>
</html>
       
      
      




