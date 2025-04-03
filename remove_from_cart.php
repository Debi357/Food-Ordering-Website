<?php
session_start();
include('dbcon.php');

// Check if user is logged in
if (!isset($_SESSION['uid'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['uid'];
$cart_id = $_GET['id'];

// Remove item from the cart
$query = "DELETE FROM cart_items WHERE cart_id = ? AND user_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ii", $cart_id, $user_id);
$stmt->execute();

// Redirect back to the cart page
header("Location:cart.php");
exit();
?>
