<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.web.servlet.ModelAndView " %>
<%@ page import="org.springframework.stereotype.Controller " %>
<%@ page import="vehicleOnlineShop.Wishlist" %>
<%@ page import="vehicleOnlineShop.Product" %>
<%@ page import="org.hibernate.Session " %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Place Order</title>
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

<% int id = (Integer) request.getAttribute("id");
   int pid = (Integer) request.getAttribute("pid");

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
                <a class="nav-link " aria-current="page" href="backToHome?id=${id}">Home</a>
             <li class="nav-item">
                <a class="nav-link" href="showOrder?id=${ id}">Show Order</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="myProfile?id=${id}">My Profile</a>
              </li>
               <li class="nav-item ">
                <a class="nav-link active" href="#">Wish List</a>
              </li>
              
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>
      
      <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">Place Order</div>
      
      <div class="container" style="margin-top: 20px;">
     
        
<% 


     
     
     try {
     	Configuration ci = new Configuration().configure().addAnnotatedClass(Product.class);			
     	ci.configure("hibernate.cfg.xml");
     	
     	SessionFactory factory1 = ci.buildSessionFactory();
     	Session Session = factory1.openSession();
     	
     	
     	@SuppressWarnings("rawtypes")
     	java.util.List lis = Session.createQuery("from Product where id = " + pid ).list();
     	@SuppressWarnings("rawtypes")
     	java.util.Iterator its=lis.iterator();
     	
     	while(its.hasNext()) {
     		Object ob = (Object)its.next();
     		
     		
     		 Product rs = (Product)ob;
     		 
     		 %>
     	
         
         <div class="card mb-3" >
           <div class="row no-gutters">
           <div class="col-md-4">
      <img src="<% out.print(rs.getImageurl()); %>" class="card-img-top card-img" style="hight='300'; width='300'">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><% out.print(rs.getName());  %></h5>
        <p class="card-text">Company : <% out.print(rs.getCompany()); %></p>
        <p class="card-text">Price : <% out.print(rs.getPrice()); %></p>
        <p class="card-text"><small class="text-muted"><% out.print(rs.getFeature()); %></small></p>
       
      </div>
    </div>
    <br><br><center>
    <form action="cnfPlaceOrder" method="post" >
  <div class="form-row" style=" margin-buttom : 10px ;">
   
   <input type="hidden" name='id' value="${id} "  >
    <input type="hidden" name='pid' value="${pid}"  >
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Are sure you want to buy this car !?</label>
      
    </div>
   
  </div>
  
  </div>
  <button type="submit" class="btn btn-primary">Yes</button>
  <a class="btn btn-primary" href="wishlist?id=${id}" role="button">NO</a>
  
  </form><center>
    
  </div>
</div>
         
        <%
    	}
       	Session.close();
       	factory1.close();
       }
       catch(Exception ex) {
       	System.out.println(ex);	
       	
       }
     		 
	
	


%>


        
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
</body>
</html>