<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registration.css">
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
    <c:when test="${not empty loggedInUser}">
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
  <main class="register-container">
  <div class="breadcrumb">
    <a href="#">Home</a> &gt; <span>Create Account</span>
  </div>

  <h1 class="register-title">Register</h1>

  <form class="register-form" action="success" method="POST">
    <h2>Register</h2>
    <input type="text" name="customerName" placeholder="customerName" required>
    <input type="tel" name="phoneNumber" placeholder="phoneNumber" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>

    <p class="note">
      Sign up for early Sale access plus tailored new arrivals, trends and promotions.
      To opt out, click unsubscribe in our emails.
    </p>

    <button type="submit" class="btn-primary">Register</button>
    <a href="${pageContext.request.contextPath}/loginController/login" class="btn-outline">Log In</a>
  </form>
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
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li><a href="#">Best Sellers</a></li>
        <li><a href="#">New Arrivals</a></li>
        <li><a href="${pageContext.request.contextPath}/topsController/tops">Tops</a></li>
        <li><a href="${pageContext.request.contextPath}/kurtisController/kurtis">Kurta</a></li>
        <li><a href="#">Kurta Sets</a></li>
        <li><a href="${pageContext.request.contextPath}/dress">Dress</a></li>
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