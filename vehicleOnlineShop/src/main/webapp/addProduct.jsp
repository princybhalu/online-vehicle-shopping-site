<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="vehicleOnlineShop.Product" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
                <a class="nav-link " aria-current="page" href="adminhomepage">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">Add Product</a>
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
              
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>

      <div class="text-center fs-5" style="font-size: 20px; margin-top: 15px; "> ${ Msg } </div>
      
      
      <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">Add Product</div>

     
      <div class="container" style="margin-top: 30px;">
      <form action="addProduct" method="post" >
        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="n" placeholder="Enter Product Name">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Company</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="c" placeholder="Enter Product Company">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Price</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="p" placeholder="Enter Product Price">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Feature</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="f" placeholder="Enter Product Feature">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Total Stock</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="ts" placeholder="Enter Product Total Stock">
          </div>
          <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Product Image URL</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="iurl" placeholder="Enter Product Image URL">
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
      </div>

</body>
</html>