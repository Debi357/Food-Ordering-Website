<?php
session_start();
include('dbcon.php');

// Retrieve the order ID and payment status from the payment gateway response
$order_id = $_GET['order_id'];
$payment_status = $_GET['payment_status']; // This should be provided by the payment gateway (e.g., 'success' or 'failed')
$transaction_id = $_GET['transaction_id']; // Payment transaction ID from the gateway (if applicable)

// Retrieve the order details
$order_query = "SELECT * FROM `order` WHERE orderId = ?";
$order_stmt = $conn->prepare($order_query);
$order_stmt->bind_param("i", $order_id);
$order_stmt->execute();
$order_result = $order_stmt->get_result();

if ($order_result->num_rows > 0) {
    $order_row = $order_result->fetch_assoc();

    if ($payment_status == 'success') {
        // Update the order status to 'Completed'
        $status = 'Completed';
        $update_order_query = "UPDATE `order` SET status = ?, transaction_id = ? WHERE orderId = ?";
        $update_order_stmt = $conn->prepare($update_order_query);
        $update_order_stmt->bind_param("ssi", $status, $transaction_id, $order_id);
        $update_order_stmt->execute();

        // You can also perform other tasks, like sending email confirmation, etc.
        header("Location: order_success.php?order_id=$order_id");
    } else {
        // Update the order status to 'Failed'
        $status = 'Failed';
        $update_order_query = "UPDATE `order` SET status = ?, transaction_id = ? WHERE orderId = ?";
        $update_order_stmt = $conn->prepare($update_order_query);
        $update_order_stmt->bind_param("ssi", $status, $transaction_id, $order_id);
        $update_order_stmt->execute();

        // You can also notify the user about the payment failure
        header("Location: order_failure.php?order_id=$order_id");
    }
} else {
    echo "Order not found.";
}
?>
