<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dresses</title>
    
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress.css">
    
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">

</head>
<body>
    
  <header>
    <div><strong>Sran</strong></div>
    <nav>
      <a href="${pageContext.request.contextPath}/">Home</a>
      <a href="#">Best Sellers</a>
      <a href="#">New Arrivals</a>
      <a href="#">Tops</a>
      <a href="#">Shrugs</a>
      <a href="#">Kurta</a>
      <a href="#">Kurta Sets</a>
      
      <a href="${pageContext.request.contextPath}/dressController/dress">Dress</a>
      
      <a href="#">Restocked</a>
      <a href="#">Sale</a>
      <a href="#">Size Guide</a>
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
   <main class="container">
    <aside class="filters">
  <h2>Filters</h2>

  <div class="filter-group">
    <p>Availability</p>
    <label><input type="checkbox" checked /> In stock (<c:out value="${fn:length(dresses)}" />)</label>
    <label><input type="checkbox" /> Out of stock (0)</label>
  </div>

  <div class="filter-group">
    <p>Price</p>
    <input type="range" min="0" max="1699" value="1699" />
    <div class="price-inputs">
      <input type="text" value="0" /> to <input type="text" value="1699" />
    </div>
  </div>

  <div class="filter-group">
    <p>Size</p>
    <label><input type="checkbox" /> XS</label>
    <label><input type="checkbox" /> S</label>
    <label><input type="checkbox" /> M</label>
    <label><input type="checkbox" /> L</label>
    <label><input type="checkbox" /> XL</label>
    <label><input type="checkbox" /> XXL</label>
  </div>
</aside>

    

    <section class="products-section">
      
      <div class="page-title">
        <div class="title-group">
            <h2>Dresses</h2>
            <p><a href="${pageContext.request.contextPath}/">Home </a>>      Dresses</p>
        </div>
        <div class="sort">
            <label for="sort">Sort:</label>
            <select id="sort">
             <option>Date, new to old</option>
            <option>Price, low to high</option>
            <option>Price, high to low</option>
            </select>
        </div>
        </div>

<div class="product-grid">
  <c:forEach var="product" items="${dresses}">
    <div class="product-card">
      <div class="image-container">
        <img src="${pageContext.request.contextPath}/resources/images/fabric.jpg" alt="${product.productDescription}">
        <div class="hover-icons">
          <span class="icon"><i class='bx bx-heart'></i></span>
          <span class="icon"><i class='bx bx-cart'></i> </span>
        </div>
        <button class="select-btn">Select options</button>
      </div>
      <h3>${product.category.categoryDescription}</h3>
      <p>₹699</p>
    </div>
  </c:forEach>
</div>


 
      <div class="pagination">
  <c:if test="${currentPage > 1}">
    <a href="${pageContext.request.contextPath}/dressController/dress?page=${currentPage - 1}">&laquo;</a>
  </c:if>

  <c:forEach var="i" begin="1" end="${totalPages}">
    <c:choose>
      <c:when test="${i == currentPage}">
        <a class="active" href="${pageContext.request.contextPath}/dressController/dress?page=${i}">${i}</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/dressController/dress?page=${i}">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>

  <c:if test="${currentPage < totalPages}">
    <a href="${pageContext.request.contextPath}/dressController/dress?page=${currentPage + 1}">&raquo;</a>
  </c:if>
</div>



    </section>
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
        <li><a href="#">Tops</a></li>
        <li><a href="#">Kurta</a></li>
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