<?php
include('dbcon.php');

// Fetch the Razorpay payment details
$order_id = $_GET['order_id'];
$payment_id = $_GET['payment_id'];
$signature = $_GET['signature'];

// Razorpay API credentials
$api_key = 'your_razorpay_key';
$api_secret = 'your_razorpay_secret';

// Verify the payment signature
$checksum = $order_id . "|" . $payment_id;
$generated_signature = hash_hmac('sha256', $checksum, $api_secret);

if ($generated_signature === $signature) {
    // Update order status in your database (as successful payment)
    // You can save the order details and payment info

    // Example:
    $query = "INSERT INTO orders (order_id, user_id, total_amount, payment_status) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("siis", $order_id, $_SESSION['uid'], $_POST['amount'], 'Paid');
    $stmt->execute();

    echo "Payment Successful!";
} else {
    echo "Payment Verification Failed!";
}
?>
