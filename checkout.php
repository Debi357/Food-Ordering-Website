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

// Retrieve user information
$user_query = "SELECT name, mobile, address, email FROM user WHERE id = ?";
$user_stmt = $conn->prepare($user_query);
$user_stmt->bind_param("i", $user_id);
$user_stmt->execute();
$user_result = $user_stmt->get_result();
$user_row = $user_result->fetch_assoc();

$user_name = $user_row['name'];
$user_mobile = $user_row['mobile'];
$user_address = $user_row['address'];
$user_email = $user_row['email'];


// ... rest of the code (cart items, total price, payment options)

// ... (rest of your code)

// Retrieve cart items for the user
$query = "SELECT ci.quantity, m.name, m.price, m.image, m.detail
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
    <title>Checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<style>/* Body styling for a clean look */
body {
    font-family: 'Baloo Thambi 2', sans-serif;
    background-color:  #f7f7f7 ;
    margin: 0;
    padding: 0;
    line-height: 1.6;
    color: #495057;
}

/* Container styling */
.container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px 30px;
    background-color: #fff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* Header titles */
h2, h3 {
    font-family: 'Bree Serif', serif;
    color: #333;
    margin-bottom: 25px;
}

/* Account and cart summary */
p {
    font-size: 16px;
    color: #555;
}

a.btn {
    text-decoration: none;
    font-weight: 600;
    color: #fff;
    background-color:  #ff105f;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    transition: all 0.3s ease;
}

/* Cart summary table */
.table {
    margin-top: 20px;
    width: 100%;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
}

.table th, .table td {
    text-align: left;
    padding: 12px 15px;
    border-bottom: 1px solid #ddd;
}

.table th {
    background-color: #f8f9fa;
    color: #333;
    font-weight: bold;
    text-transform: uppercase;
}

.table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table td {
    font-size: 16px;
}

.text-right {
    text-align: right;
    font-weight: 600;
}

/* Payment method section */
.form-check {
    margin-bottom: 15px;
}

.form-check-input {
    margin-right: 10px;
    cursor: pointer;
}

.form-check-label {
    font-size: 16px;
    color: #333;
    cursor: pointer;
}

/* Submit button */
button[type="submit"] {
    font-weight: bold;
      font-size: 17px;
    border: 1px solid #ff105f;
			outline: none;
			color: #ffffff;
			background: linear-gradient(to left, #ff105f, #ffad06);
			text-decoration: none;
}

button[type="submit"]:hover {
    border: 1px solid #ff105f;
			outline: none;
			color: #ffffff;
			background: linear-gradient(to left, #ff105f, #ffad06);
			box-shadow: 0 0 30px #ff105f, 0 0 60px #ffad06;
			text-decoration: none;}



/* Responsive design */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }

    h2, h3 {
        font-size: 24px;
    }

    a.btn, button[type="submit"] {
        font-size: 16px;
        padding: 10px 50px;
    }
    
    .table th, .table td {
        padding: 10px 8px;
        font-size: 14px;
    }
    
    p {
        font-size: 14px;
    }
}

    </style>
</head>
<body>
    <div class="container">
        

        <div class="row">
            <div class="col-md-6">
                <h3>Account Details</h3>
                <p><strong>Name:</strong> <?php echo $user_name; ?></p>
                <p><strong>Mobile No:</strong> <?php echo $user_mobile; ?></p>
                <p><strong>Address:</strong> <?php echo $user_address; ?></p>
                <p><strong>Email:</strong> <?php echo $user_email; ?></p>
                <a href="change_address.php" class="btn btn-primary">Change Address</a>
            </div>
            <div class="col-md-6">
                <h3>Cart Summary</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($cart_items as $item) : ?>
                            <tr>
                                <td><?php echo $item['name']; ?></td>
                                <td>₹<?php echo $item['price']; ?></td>
                                <td><?php echo $item['quantity']; ?></td>
                                <td>₹<?php echo $item['price'] * $item['quantity']; ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr>
                            <td colspan="3" class="text-right">Total:</td>
                            <td>₹<?php echo $total_price; ?></td>
                        </tr>
                    </tbody>
                </table>

                <h3>Payment Method</h3>
                <form action="process_order.php" method="post">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" id="cod" value="cod" checked>
                        <label class="form-check-label" for="cod">
                            Cash On Delivery (COD)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" id="online" value="online">
                        <label class="form-check-label" for="online">
                            Online Payment
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary"> ORDER NOW >>> </button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>