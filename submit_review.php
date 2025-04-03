<?php
session_start();
include('dbcon.php');

// Check if the user is logged in
if (!isset($_SESSION['uid'])) {
    header("Location: login.php");
    exit();
}

// Check if the necessary POST fields are set
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['order_id'], $_POST['review'], $_POST['rating'])) {
    $order_id = (int)$_POST['order_id'];
    $review = htmlspecialchars($_POST['review']);
    $rating = (int)$_POST['rating'];
    $user_id = $_SESSION['uid'];

    // Insert the review into the database
    $query = "INSERT INTO reviews (orderId, userId, review, rating) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iisi", $order_id, $user_id, $review, $rating);

    if ($stmt->execute()) {
        // Redirect back to the order confirmation page with a success message
        header("Location: order_confirmation.php?order_id=$order_id&message=success");
        exit();
    } else {
        // Redirect back with an error message
        header("Location: order_confirmation.php?order_id=$order_id&message=error");
        exit();
    }
} else {
    // If invalid access, redirect to home or login page
    header("Location: index.php");
    exit();
}
?>
