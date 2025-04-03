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

// Get product details from POST request
$product_id = $_POST['id'];
$name = $_POST['name'];
$price = $_POST['price'];
$image = $_POST['image'];
$detail = $_POST['detail'];
$quantity = $_POST['quantity'];

// Check if the product is already in the cart for this user
$query = "SELECT * FROM cart_items WHERE user_id = ? AND product_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ii", $user_id, $product_id);
$stmt->execute();
$result = $stmt->get_result();

// If the product is already in the cart, update the quantity
if ($result->num_rows > 0) {
    $cart_item = $result->fetch_assoc();
    $new_quantity = $cart_item['quantity'] + $quantity;

    $update_query = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
    $update_stmt = $conn->prepare($update_query);
    $update_stmt->bind_param("iii", $new_quantity, $user_id, $product_id);
    $update_stmt->execute();
} else {
    // If not in cart, insert a new record
    $insert_query = "INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)";
    $insert_stmt = $conn->prepare($insert_query);
    $insert_stmt->bind_param("iii", $user_id, $product_id, $quantity);
    $insert_stmt->execute();
}

// Redirect to the cart page
header("Location: cart.php");
exit();
?>