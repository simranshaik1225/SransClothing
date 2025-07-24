<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Checkout.css">
    <link rel="icon" type="image/webp" href="/FoodApplication/images/logo.webp">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
</head>
<body>
    <div class="checkout-container">
        <h2>Checkout</h2>
        
        <form action="${pageContext.request.contextPath}/checkoutController/orderConfirmation" method="post">

            <div class="address-section">
                <h3>Delivery Address</h3>
                <input type="text" name="doorno" placeholder="Door No / Building Name" required>
                <input type="text" name="street" placeholder="Street" required>
                <input type="text" name="city" placeholder="City" required>
                <input type="text" name="pincode" placeholder="Pincode" required>
                <input type="text" name="phonenumber" placeholder="PhoneNumber" required>
            </div>

            <div class="payment-section">
                <h3>Select Payment Method</h3>

                <div class="payment-options">
                    <h4>UPI Apps</h4>
                    <div class="upi-icons">
                        <label class="upi-option">
                            <input type="radio" name="paymentMethod" value="Paytm" required>
                            <img src="/FoodApplication/images/paytm.png" alt="Paytm" height="100px" width="100px">
                        </label>
                        <label class="upi-option">
                            <input type="radio" name="paymentMethod" value="GPay">
                            <img src="/FoodApplication/images/gpay.jpeg" alt="GPay" height="100px" width="100px">
                        </label>
                        <label class="upi-option">
                            <input type="radio" name="paymentMethod" value="PhonePe">
                            <img src="/FoodApplication/images/phonepe.png" alt="PhonePe" height="100px" width="100px">
                        </label>
                    </div>
            
                    <h4>Other Options</h4>
                    <label><input type="radio" name="paymentMethod" value="Card"> Credit/Debit Card</label><br>
                    <label><input type="radio" name="paymentMethod" value="Cash on Delivery"> Cash on Delivery</label>
            
                    <br><br>
                    
                </div>
            </div>
            

            <input type="submit" value="Place Order" class="place-order-btn">
        </form>
    </div>
</body>
</html>

    