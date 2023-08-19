<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Vehicle Vila</title>
  <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet"><link rel="stylesheet" href="./style.css">
  
  <style>
  body {
  background: #ABCDEF;
  font-family: Assistant, sans-serif;
  display: flex;
  min-height: 90vh;
}
.login {
  color: white;
  background: background: #136a8a;
  background: 
    -webkit-linear-gradient(to right, #267871, #136a8a);
  background: 
    linear-gradient(to right, #267871, #136a8a);
  margin: auto;
  box-shadow: 
    0px 2px 10px rgba(0,0,0,0.2), 
    0px 10px 20px rgba(0,0,0,0.3), 
    0px 30px 60px 1px rgba(0,0,0,0.5);
  border-radius: 8px;
  padding: 50px;
}
.login .head {
  display: flex;
  align-items: center;
  justify-content: center;
}
.login .head .company {
  font-size: 2.2em;
}
.login .msg {
  text-align: center;
}
.login .form input[type=text].text {
  border: none;
  background: none;
  box-shadow: 0px 2px 0px 0px white;
  width: 100%;
  color: white;
  font-size: 1em;
  outline: none;
}
.login .form .text::placeholder {
  color: #D3D3D3;
}
.login .form input[type=password].password {
  border: none;
  background: none;
  box-shadow: 0px 2px 0px 0px white;
  width: 100%;
  color: white;
  font-size: 1em;
  outline: none;
  margin-bottom: 20px;
  margin-top: 20px;
}
.login .form .password::placeholder {
  color: #D3D3D3;
}
.login .form .btn-login {
  background: none;
  text-decoration: none;
  color: white;
  box-shadow: 0px 0px 0px 2px white;
  border-radius: 3px;
  padding: 5px 2em;
  transition: 0.5s;
}
.login .form .btn-login:hover {
  background: white;
  color: dimgray;
  transition: 0.5s;
}
.login .forgot {
  text-decoration: none;
  color: white;
  float: right;
}
footer {
  position: absolute;
  color: #136a8a;
  bottom: 10px;
  padding-left: 20px;
}
footer p {
  display: inline;
}
footer a {
  color: green;
  text-decoration: none;
}
footer a:hover {
  text-decoration: underline;
}
footer .heart {
  color: #B22222;
  font-size: 1.5em
}
  </style>
</head>
<body>
<!-- partial:index.partial.html -->
<section class='login' id='login'>
  <div class='head'>
  <h1 class='company'>Vehicle Vila</h1>
  </div>
  <p class='msg'>Registration</p>
   ${ Msg }
  <div class='form'>
    <form action="adduser" >
  <input type="text" placeholder='Username' class='text' id='username' name='username' required><br>
  <input type="text" placeholder='Phone no' class='text' id='phoneno' name='phoneno' style="margin-top: 18px" required><br>
  <input type="password" placeholder='Password' name="password" class='password' required><br>
  <input type="password" placeholder='Confirm Password' name="cpassword" class='password' style="margin-top: 3px" required>
  
  <input type="submit" class='btn-login' id='do-login' value='Sign in'>
  <!-- <a href="#" class='forgot' style="margin-left: 15px ;">New Registration</a> -->
    </form>
  </div>
</section>

<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
