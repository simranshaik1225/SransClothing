<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
</head>
<body>
    
  <header>
    <div><strong>Sran</strong></div>
    <nav>
      <a href="${pageContext.request.contextPath}/">Home</a>
      
      <a href="${pageContext.request.contextPath}/topsController/tops">Tops</a>
      <a href="${pageContext.request.contextPath}/shrugsController/shrugs">Shrugs</a>
      <a href="${pageContext.request.contextPath}/kurtisController/kurtis">Kurtis</a>
      <a href="#">Kurta Sets</a>
      <a href="${pageContext.request.contextPath}/dressController/dress">Dresses</a>
      
    </nav>
    <div class="header-icons">
     <div class="search-box">
  <form action="${pageContext.request.contextPath}/searchController/search" method="get">
    <input type="text" placeholder="Search for products, categories..." name="search">
    <button type="submit" ><i class='bx bx-search'></i></button>
  </form>
</div>
    
    <c:choose>
    <c:when test="${not empty sessionScope.loggedInUser}">
      <span>${loggedInUser.customerName}</span>
      <a href="${pageContext.request.contextPath}/logoutController/logout" >Logout</a>
      <a href="${pageContext.request.contextPath}/orderhistory">Orders</a>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/loginController/login">
        <i class='bx bx-user'></i>
      </a>
    </c:otherwise>
  </c:choose>
      
      <a href="${pageContext.request.contextPath}/wishlist"><i class='bx bx-heart'></i></a>
      <a href="${pageContext.request.contextPath}/cartController/cartView"><i class='bx bx-cart'></i></a>
      
      
    </div>
  </header>
  <main class="login-wrapper">
  <div class="login-title">
    <h1>Log In</h1>
    <p><a href="">Home</a> &gt; Account</p>
  </div>

  <div class="login-container">
    <div class="login-box">
      <h2>Log In</h2>
      <form method="post" action="${pageContext.request.contextPath}/loginController/loginCheck">
  <input type="email" name="email" placeholder="Email" required />
  <input type="password" name="password" placeholder="Password" required />





  <button type="submit" class="login-btn">Sign In</button>
</form>
      
       </div>

    <div class="register-box">
      <h2>New Customer</h2>
      <p>
        Sign up for early Sale access plus tailored new arrivals, trends and promotions. 
        To opt out, click unsubscribe in our emails.
      </p>
      <button class="register-btn" onclick="location.href='${pageContext.request.contextPath}/registrationController/registration'">Register</button>
    </div>
  </div>
</main>

   
   <footer>
    <div class="footer-col">
      <h4>Information</h4>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Washcare</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Terms & Conditions</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Refund Policy</a></li>
        <li><a href="#">Shipping Policy</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Best Sellers</a></li>
        <li><a href="#">New Arrivals</a></li>
        <li><a href="#">Tops</a></li>
        <li><a href="#">Kurta</a></li>
        <li><a href="#">Kurta Sets</a></li>
        <li><a href="#">Dress</a></li>
        <li><a href="#">Sale</a></li>
        <li><a href="#">Size Guide</a></li>
      </ul>
    </div>
    <div class="footer-col subscribe">
      <h4>Subscribe</h4>
      <p>Enter your email below to be the first to know about new collections and product launches.</p>
      <input type="email" placeholder="Enter your email" />
      <button>Subscribe</button>
    </div>
  </footer>
</body>
</html>