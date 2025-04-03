<?php

session_start();

include('dbcon.php');
include('header2.php');



// Check if user is logged in

if (!isset($_SESSION['uid'])) {
header("Location: login.php");
 exit();

}



$user_id = $_SESSION['uid'];



// Retrieve cart items for the user

$query = "SELECT ci.cart_id, ci.quantity, m.name, m.price, m.image, m.detail 

FROM cart_items ci

 JOIN menu m ON ci.product_id = m.id

WHERE ci.user_id = ?";

$stmt = $conn->prepare($query);

$stmt->bind_param("i", $user_id);

$stmt->execute();

$result = $stmt->get_result();



// Calculate the total price for the cart

$total_price = 0;

$cart_items = [];



while ($item = $result->fetch_assoc()) {

 $total_price += $item['price'] * $item['quantity'];

 $cart_items[] = $item;

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Cart</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <style>
    /* Main container with background image and flexbox layout */
    body {
    margin: 0;
    font-family:'Baloo Thambi 2', sans-serif;
    background-color: #f7f7f7 ;
}


    .cart-container {
      width: 100vw;
      height: 100vh;
      background-image: url("dataimg/cart-bg.jpg"); /* Replace with your background image path */
      background-repeat: no-repeat;
      background-size: cover;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      margin-top: 50px;
      align-items: center;
    }

    /* Cart table container with rounded corners and shadow */
    .cart-table-container {
      width: 80%;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }

    /* Cart header with larger font size and centered text */
    .cart-header {
      font-family: 'Bree Serif', serif;
      font-size: 1.75rem;
      
      text-align: center;
      margin-bottom: 20px;
    }

    /* Cart table styling */
    .cart-table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ddd;
  padding: 10px;
}

th {
  background-color: #f2f2f2;
}

.cart-item-image img {
  width: 100px;
  height: 100px;
  object-fit: cover;
}

    .cart-item-details {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: flex-start;
      width: 100%;
    }

    .cart-item-name,
    .cart-item-price {
      font-weight: bold;
    }

    /* Checkout button styling */
    .checkout-btn {
      font-weight: bold;
      font-size: 17px;
      border: 1px solid #ff105f;
			outline: none;
			color: #ffffff;
			background: linear-gradient(to left, #ff105f, #ffad06);
			text-decoration: none;
      padding: 10px 20px;
      border-radius: 10px;
      cursor: pointer;
     /* Increase the margin to shift the button down */
}

.checkout-btn:hover {
      border: 1px solid #ff105f;
			outline: none;
			color: #ffffff;
			background: linear-gradient(to left, #ff105f, #ffad06);
			box-shadow: 0 0 30px #ff105f, 0 0 60px #ffad06;
			text-decoration: none;
        }

    /* Remove button styling */
    .remove-btn {
      background-color: #ff105f;
      color: #fff;
      border: none;
      padding: 5px 10px;
      border-radius: 5px;
      cursor: pointer;
    }
    	
		
  </style>
</head>

  <div class="cart-container">
    <div class="cart-table-container">
  <h1></h1>
      <h2 class="cart-header">Your Cart</h2>

      <table class="cart-table">
  <thead>
    <tr>
      <th>Image</th>
      <th>Item</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Amount</th>
      <th>Remove</th>
    </tr>
  </thead>
  <tbody>
    <?php if (count($cart_items) > 0) : ?>
      <?php foreach ($cart_items as $item) : ?>
        <tr>
          <td class="cart-item-image">
            <img src="dataimg/<?php echo htmlspecialchars($item['image']); ?>" alt="<?php echo htmlspecialchars($item['name']); ?>">
          </td>
          <td>
            <span class="cart-item-name"><?php echo htmlspecialchars($item['name']); ?></span>
          </td>
          <td>
            <span class="cart-item-price">₹<?php echo htmlspecialchars($item['price']); ?></span>
          </td>
          <td>
            <form action="update_cart.php" method="POST">
              <input type="hidden" name="cart_id" value="<?php echo $item['cart_id']; ?>">
              <input type="number" name="quantity" value="<?php echo $item['quantity']; ?>" min="1" style="width: 50px;">
              <button type="submit" class="btn btn-warning">Update</button>
            </form>
          </td>
          <td>₹<?php echo htmlspecialchars($item['price'] * $item['quantity']); ?></td>
          <td><a href="remove_from_cart.php?id=<?php echo $item['cart_id']; ?>" class="remove-btn">Remove</a></td>
        </tr>
      <?php endforeach; ?>
    <?php else : ?>
      <tr>
        <td colspan="6" class="text-center">Your cart is empty.</td>
      </tr>
    <?php endif; ?>
 
<th class="total-price" style="background-color: #f2f2f2;">Total Payable Amount:  ₹<?php echo $total_price; ?></th>
</tbody>
</table>
<div style="height: 20px;"></div> <div class="text-center">
        <a href="checkout.php" class="checkout-btn"> Checkout >>></a>
      </div>
    </div>
  </div>
</body>
</html>