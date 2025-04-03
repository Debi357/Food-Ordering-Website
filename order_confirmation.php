<?php
session_start();
include('dbcon.php');
include('header.php');

// Check if order_id is provided in the URL
if (!isset($_GET['order_id'])) {
    echo "No order ID provided.";
    exit();
}

$order_id = $_GET['order_id'];

// Fetch order details from the database
$order_query = "SELECT o.Id, o.total, o.payment_method, o.status, o.name, o.address, o.email, u.mobile 
                FROM `order` o 
                JOIN user u ON o.userId = u.id
                WHERE o.Id = ?";
$order_stmt = $conn->prepare($order_query);
$order_stmt->bind_param("i", $order_id); // Using $order_id for binding
$order_stmt->execute();
$order_result = $order_stmt->get_result();

if ($order_result->num_rows == 0) {
    echo "Order not found.".$order_id;
    exit();
}

$order_details = $order_result->fetch_assoc();

// Fetch ordered items from the order_items table
$items_query = "SELECT itemName, price, qty, total FROM order_items WHERE orderId = ?";
$items_stmt = $conn->prepare($items_query);
$items_stmt->bind_param("i", $order_id); // Using $order_id for binding
$items_stmt->execute();
$items_result = $items_stmt->get_result();

// Fetch reviews for the order
$reviews_query = "SELECT r.review, r.rating, u.name 
                  FROM reviews r
                  JOIN user u ON r.userId = u.id
                  WHERE r.orderId = ?";
$reviews_stmt = $conn->prepare($reviews_query);
$reviews_stmt->bind_param("i", $order_id); // Bind the order_id
$reviews_stmt->execute();
$reviews_result = $reviews_stmt->get_result(); // Get the result

if (isset($_GET['message'])): ?>
    <div class="message">
        <?php if ($_GET['message'] === 'success'): ?>
            <p class="success"></p>
        <?php elseif ($_GET['message'] === 'error'): ?>
            <p class="error">Unable to submit your review. Please try again later.</p>
        <?php endif; ?>
    </div>
<?php endif;

// Check if the user is logged in
if (!isset($_SESSION['uid'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <style>
 /* General Page Styling */
body {
    font-family: 'Baloo Thambi 2', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: white;
   
    margin-bottom: 20px;
    font-family: 'Bree Serif', serif;
}

h2{  font-family: 'Bree Serif', serif;
    color: #333;
    font-size: 1.75rem;
    margin-bottom: 25px;
  
}
h3 {
    color: #ff5722;
}
p {
    color: #555;
    line-height: 1.6;
    font-size: 1rem;
}

strong {
    color: #333;
    font-weight: 600;
}

/* Order Details Section */
.order-details {
    margin-bottom: 30px;
}

.order-details h2 {
    font-size: 1.75rem;
}

.order-details p {
    font-size: 1.125rem;
    margin-bottom: 8px;
}

.confirmation-message {
    background-color: #e0f7fa;
    padding: 15px;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 1rem;
    color: #333;
}

.confirmation-message p {
    margin: 0;
}

/* Ordered Items Table */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

table th, table td {
    padding: 12px;
    border: 1px solid #e0e0e0;
    text-align: left;
    font-size: 1rem;
}

th {
    background-color: #f7f7f7;
    font-weight: bold;
    color: #555;
}

td {
    color: #666;
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tr:hover {
    background-color: #f1f1f1;
}

/* Review Section */
/* Review Section */
.review-section {
    margin-top: 40px;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.05);
}

.review-form {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 20px;
}

textarea {
    width: 50%;
    padding: 12px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 1rem;
    resize: vertical;
    min-height: 120px;
}

select {
    padding: 10px;
    width: 40%;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 1rem;
}

button[type="submit"] {
    padding: 10px 10px;
    width: 30%;
    background:linear-gradient(to left, #ff105f, #ffad06);
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    
    font-weight: bold;
      font-size: 17px;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    border: 1px solid #ff105f;
			outline: none;
			color: #ffffff;
			background: linear-gradient(to left, #ff105f, #ffad06);
			box-shadow: 0 0 30px #ff105f, 0 0 60px #ffad06;
			text-decoration: none;}



.reviews-list {
    margin-top: 30px;
}

.review {
    background-color: #f9f9f9;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
}

.review p {
    margin: 5px 0;
}

.review strong {
    font-weight: bold;
}

.review-rating {
    font-style: italic;
    color: #555;
}


/* Responsive Design */
@media (max-width: 768px) {
    .container {
        width: 95%;
        padding: 10px;
    }

    table th, table td {
        font-size: 14px;
    }

    p {
        font-size: 14px;
    }

    h1 {
        font-size: 24px;
    }

    h2 {
        font-size: 20px;
    }

    h3 {
        font-size: 18px;
    }

    textarea, select, button[type="submit"] {
        font-size: 14px;
    }
}

    </style>
</head>
<body>

<div class="container">
    <!-- Order Details -->
    <div class="order-details">
        <h2>Order ID: #<?php echo $order_details['Id']; ?></h2>
        <p><strong>Name:</strong> <?php echo $order_details['name']; ?></p>
        <p><strong>Email:</strong> <?php echo $order_details['email']; ?></p>
        <p><strong>Mobile:</strong> <?php echo $order_details['mobile']; ?></p>
        <p><strong>Address:</strong> <?php echo $order_details['address']; ?></p>
        <p><strong>Payment Method:</strong> <?php echo ucfirst($order_details['payment_method']); ?></p>
        <p><strong>Status:</strong> <?php echo ucfirst($order_details['status']); ?></p>
        <p><strong>Total Amount:</strong> ₹<?php echo number_format($order_details['total'], 2); ?></p>

    </div>

    <!-- Ordered Items Table -->
    <h2>Ordered Items</h2>
    <table class="order-items-table">
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($item = $items_result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo htmlspecialchars($item['itemName']); ?></td>
                <td>₹<?php echo number_format($item['price'], 2); ?></td>
                <td><?php echo $item['qty']; ?></td>
                <td>₹<?php echo number_format($item['total'], 2); ?></td>

            <?php } ?>
        </tbody>
    </table>

    <!-- Confirmation Message -->
    <div class="confirmation-message">
        <p>Thank you for your order! A confirmation email has been sent to <?php echo htmlspecialchars($order_details['email']); ?>.</p>
        <p>Your order will be processed shortly.</p>
    </div>

    <!-- Review Section Inside Container -->
    <div class="review-section">
        <h2>Leave a Review</h2>
        <form class="review-form" action="submit_review.php" method="post">
            <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
            <textarea name="review" placeholder="Write your review here..." required></textarea>
            <select name="rating" required>
                <option value="" disabled selected>Select a rating</option>
                <option value="1">1 - Poor</option>
                <option value="2">2 - Fair</option>
                <option value="3">3 - Good</option>
                <option value="4">4 - Very Good</option>
                <option value="5">5 - Excellent</option>
            </select>
            <button type="submit">Submit Review</button>
        </form>

        <!-- Display Customer Reviews -->
        <div class="reviews-list">
           
            <?php while ($review = $reviews_result->fetch_assoc()) { ?>
            <div class="review">
            <h3>Thank you for your reviews!</h3>
                <p><strong><?php echo htmlspecialchars($review['name']); ?>:</strong> <?php echo htmlspecialchars($review['review']); ?></p>
                <p class="review-rating">Rating: <?php echo $review['rating']; ?>/5</p>
            </div>
            <?php } ?>
        </div>
        
    </div>
</div>

</body>
</html>

<?php
$conn->close();
?>
 