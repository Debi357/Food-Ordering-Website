<?php
session_start();
include('dbcon.php'); // Database connection file

// Check if the user is logged in
if (!isset($_SESSION['uid'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['uid'];

// If the form is submitted, process the request
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $new_address = trim($_POST['address']);
    
    // Validate input
    if (empty($new_address)) {
        $error_message = "Address cannot be empty.";
    } else {
        // Update the address in the database
        $query = "UPDATE user SET address = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("si", $new_address, $user_id);

        if ($stmt->execute()) {
            $success_message = "Address updated successfully!";
        } else {
            $error_message = "Failed to update the address. Please try again.";
        }
    }
}

// Fetch the current address
$query = "SELECT address FROM user WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$current_address = $user['address'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Address</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            color: #333;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #343a40;
        }

        .alert {
            font-size: 16px;
            font-weight: bold;
        }

        .form-label {
            font-size: 16px;
            color: #343a40;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            box-shadow: none;
            font-size: 14px;
            padding: 12px;
        }

        .btn-primary {
            background-color: #ff105f;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #ffad06;
        }

        .btn-secondary {
            background-color: #343a40;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #6c757d;
        }

        .mb-4 {
            margin-bottom: 20px;
        }

        .text-center {
            text-align: center;
        }

        .alert-success {
            background-color: #28a745;
            color: white;
        }

        .alert-danger {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Change Address</h2>

        <!-- Success or Error Message -->
        <?php if (isset($success_message)) : ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php elseif (isset($error_message)) : ?>
            <div class="alert alert-danger"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <!-- Current Address -->
        <div class="mb-4">
            <h5>Current Address:</h5>
            <p><?php echo htmlspecialchars($current_address); ?></p>
        </div>

        <!-- Change Address Form -->
        <form method="post" action="">
            <div class="mb-3">
                <label for="address" class="form-label">New Address:</label>
                <textarea name="address" id="address" class="form-control" rows="4" placeholder="Enter your new address"><?php echo isset($new_address) ? htmlspecialchars($new_address) : ''; ?></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Address</button>
            <a href="checkout.php" class="btn btn-secondary">Back to Checkout</a>
        </form>
    </div>
</body>
</html>
