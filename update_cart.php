<?php
session_start();
include('dbcon.php');

// Check if user is logged in
if (!isset($_SESSION['uid'])) {
    header("Location: login.php");
    exit();
}

// Get user id from session
$user_id = $_SESSION['uid'];

// Get cart item id and new quantity from the POST request
$cart_id = $_POST['cart_id'];
$new_quantity = $_POST['quantity'];

// Check if the quantity is valid (greater than 0)
if ($new_quantity <= 0) {
    echo "Quantity must be greater than 0.";
    exit();
}

// Update the quantity in the cart_items table
$query = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND user_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("iii", $new_quantity, $cart_id, $user_id);
$stmt->execute();

// Redirect to the cart page after updating the quantity
header("Location: cart.php");
exit();
?>
