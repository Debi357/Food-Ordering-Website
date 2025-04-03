<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Order Confirmation - Jhatpat Foods</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Thambi+2:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Baloo Thambi 2', sans-serif;
        }
        .main-menu {
            width: 100%;
        }
        /* Navbar styling */
        .navbar-dark {
            background: #000000b0;
            background-image: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url('images/navbar-bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            padding: 20px;
        }
        .navbar-brand h1 {
            font-family: 'Knewave', cursive;
            font-size: 36px;
            color: white;
            margin: 0;
        }
        .inner-menu {
            display: flex;
            justify-content: space-between;
            background-color: #333;
            padding: 10px 20px;
            color: white;
        }
        .inner-menu a {
            color: white;
            text-decoration: none;
            padding: 5px 15px;
            border: 1px solid white;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }
        .inner-menu a:hover {
            background-color: 4CAF50#;
            color: black;
        }
        .cart-badge {
            background-color: #f44336;
            border-radius: 50%;
            padding: 2px 8px;
            font-size: 14px;
            margin-left: 5px;
        }
    </style>
</head>
<body>

    <!-- Main Menu (Navbar) -->
    <div class="main-menu sticky-top">
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <h1 class="logo-text">
                            KGF
                        </h1>
                    </a>
                </div>
            </nav>
        </header>
    </div>

    <!-- Inner Menu (Links like Home, Cart, etc.) -->
    <div class="inner-menu sticky-top">
        <a href="index.php" style="float: left;">HOME</a>
        <a href="cart.php" style="float: right;">CART 
        <?php
        if (isset($_SESSION['cart'])) 
        {
            $count = count($_SESSION['cart']);
            echo "<span><b>$count</b></span>";
        }
        else
        {
            echo "<span><b>0</b></span>";
        }
        ?>
        </a>	
    </div>

</body>
</html>
