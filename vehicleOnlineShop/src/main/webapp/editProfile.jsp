<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.web.servlet.ModelAndView " %>
<%@ page import="org.springframework.stereotype.Controller " %>
<%@ page import="vehicleOnlineShop.Customer" %>
<%@ page import="org.hibernate.Session " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; font-size : 20px; ">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" style="font-size: 23px;">Vehicle Vila</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link " aria-current="page" href="home.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="showOrder?id=${ id}">Show Order</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">Profile</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="wishlist?id=${id}">Wish List</a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>
      
     
     
<div class="text-center fs-5" style="font-size: 20px; margin-top: 15px; "> ${ Msg } </div>
      
      <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">Edit Profile</div>
      
      <% 
      
      int id = (Integer) request.getAttribute("id");
      
      try {
    		Configuration cfg = new Configuration().configure().addAnnotatedClass(Customer.class);			
    		cfg.configure("hibernate.cfg.xml");
    		SessionFactory factory = cfg.buildSessionFactory();
    		Session Session = factory.openSession();
    		
    		
    		
    		java.util.List li = Session.createQuery("from Customer where id = " + id ).list();
    		java.util.Iterator it=li.iterator();
    		while(it.hasNext()) {
    			Object o = (Object)it.next();
    			Customer rs = (Customer)o;
    		    String name = rs.getName();
    		     int rid = rs.getRoll_id();
    		   
    		     
      %>
     

     
      <div class="container" style="margin-top: 30px;">
      <form action="editData" method="post">
      <input type="hidden" name='id' value="<%  out.print(rs.getId() ); %> "  >
      
        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">User Name</label>
            <input type="text" name="un" class="form-control" id="formGroupExampleInput" placeholder="<%  out.print(rs.getName() ); %> ">
          </div>
        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Phone No</label>
            <input type="text" name="pn" class="form-control" id="formGroupExampleInput" placeholder="<% out.print(rs.getPhone_no() );%>">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Gender</label>
            <input type="text" name="g" class="form-control" id="formGroupExampleInput" placeholder="<% out.print(rs.getGender()); %>">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Address</label>
            <input type="text" name="address" class="form-control" id="formGroupExampleInput" placeholder=" <% out.print(rs.getAddress() );%> ">
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
      </div>
 <%  
	     
		 System.out.println(rs.getId());
		//flag++;
	}
	Session.close();
	factory.close();
}
catch(Exception ex) {
	System.out.println(ex);	
}
      %>
</body>
</html>