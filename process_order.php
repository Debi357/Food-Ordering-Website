<?php
session_start();
include('dbcon.php');

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

// Retrieve cart items for the user
$query = "SELECT ci.cart_id, ci.quantity, m.name, m.price 
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

// Get the selected payment method from the form
$payment_method = $_POST['payment_method'];

if ($payment_method == 'cod') {
    // Process Cash on Delivery (COD) order

    // Manually start a transaction
    $conn->autocommit(FALSE);

    try {
        // Insert order details into the `order` table
        $status = 'Pending';
        $sql = "INSERT INTO `order` (userId, total, payment_method, status, name, address, email) 
                VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            throw new Exception("Error preparing statement: " . $conn->error);
        }
        $stmt->bind_param("idsssss", $user_id, $total_price, $payment_method, $status, $user_name, $user_address, $user_email);
        if (!$stmt->execute()) {
            throw new Exception("Error executing order insertion: " . $stmt->error);
        }

        // Retrieve the last inserted order ID
        $order_id = $conn->insert_id;

        // Insert each cart item into the `order_items` table
        // Insert each cart item into the `order_items` table
foreach ($cart_items as $item) {
    $itemName = $item['name'];
    $itemPrice = $item['price'];
    $itemQty = $item['quantity'];
    $itemTotal = $itemPrice * $itemQty;

    $item_sql = "INSERT INTO order_items (orderId, itemName, price, qty, total) VALUES (?, ?, ?, ?, ?)";
    $item_stmt = $conn->prepare($item_sql);
    if ($item_stmt === false) {
        throw new Exception("Error preparing item statement: " . $conn->error);
    }
    $item_stmt->bind_param("isdid", $order_id, $itemName, $itemPrice, $itemQty, $itemTotal);
    if (!$item_stmt->execute()) {
        throw new Exception("Error inserting order item: " . $item_stmt->error);
    }
    $item_stmt->close();
}


        // Commit the transaction
        $conn->commit();
        $conn->autocommit(TRUE); // Re-enable autocommit

        // Redirect to order confirmation page
        header("Location: order_confirmation.php?order_id=$order_id");
        exit;

    } catch (Exception $e) {
        // Rollback transaction on error
        $conn->rollback();
        echo "Failed to process order: " . $e->getMessage();
    }

} elseif ($payment_method == 'online') {
    // Process online payment
    $payment_gateway_url = "https://your-payment-gateway-url";
    $order_id = generate_unique_order_id(); // Implement a unique order ID generator
    $amount = $total_price;
    $callback_url = "https://your-website-url/payment_callback.php";
    $payment_url = $payment_gateway_url . "?order_id=" . $order_id . "&amount=" . $amount . "&callback_url=" . $callback_url;
    header("Location: " . $payment_url);
    exit;

} else {
    echo "Invalid payment method selected.";
}
?>
