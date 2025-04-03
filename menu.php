<?php
session_start();
include('dbcon.php');
include('header.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KGF - Menu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Baloo Thambi 2', sans-serif;
            background-color: #f7f7f7;
        }
        h2 {
        color: #ff5722; /* Example color */
        font-family: 'Bree Serif', serif;
    }

        .container {
            padding: 20px;
        }

        .category-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .category {
            cursor: pointer;
            text-align: center;
        }

        .category img {
            border-radius: 50%;
            height: 100px;
            width: 100px;
            object-fit: cover;
        }

        .menu-items {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
    border: none; /* Remove border for a cleaner look */
    border-radius: 15px; /* Rounded corners for modern design */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth animation */
    overflow: hidden; /* Ensure content stays inside the card */
    background-color: #ffffff; /* Pure white background */
}

.card:hover {
    transform: translateY(-10px); /* Slight lift effect */
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* More prominent shadow on hover */
}

.card img {
    height: 180px; /* Uniform image height */
    width: 100%; /* Ensure full-width image */
    object-fit: cover; /* Maintain aspect ratio and crop excess */
    border-bottom: 2px solid #f0f0f0; /* Subtle separator */
}

.card-body {
    padding: 20px; /* Comfortable spacing */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 300px; /* Adjust to balance layout */
}

.card-title {
    font-family: 'Bree Serif', serif;
    font-size: 20px;
   
    color: #333; /* Darker text for readability */
    margin-bottom: 10px;
}

.card-text {
    font-size: 14px;
    color: #555; /* Muted text color */
    margin-bottom: 15px; /* Space between description and price */
}

.price {
    font-size: 18px;
    font-weight: bold;
    color: #ff5722; /* Highlight price with a distinctive color */
}

.add-to-cart-btn {
    background:  linear-gradient(to right, #ff105f, #ffad06); /* Warm gradient */
    color: #fff;
    border: none;
    padding: 10px 15px;
    border-radius: 25px; /* Fully rounded button */
    font-size: 14px;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;
}

.add-to-cart-btn:hover {
    background: linear-gradient(to left, #ff105f, #ffad06); /* Inverse gradient on hover */
    transform: scale(1.05); /* Slight zoom effect */
}

.menu-items {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Responsive columns */
    gap: 20px; /* Uniform spacing between cards */
    margin-top: 20px;
}

    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">From Our Kitchen to Your Plate!</h2>

        <!-- Category Section -->
        <div class="category-container">
            <?php
            $category_query = "SELECT * FROM category";
            $category_result = mysqli_query($conn, $category_query);

            while ($category = mysqli_fetch_assoc($category_result)) {
                echo '<div class="category" onclick="loadItems(' . $category['id'] . ')">';
                echo '<img src="dataimg/' . $category['image'] . '" alt="' . $category['name'] . '">';
                echo '<p>' . $category['name'] . '</p>';
                echo '</div>';
            }
            ?>
        </div>

        <!-- Menu Items Section -->
        <div class="menu-items" id="menu-items">
            <!-- Items will be dynamically loaded here -->
        </div>
    </div>

    <script>
        // Function to load items for the selected category
        function loadItems(categoryId) {
            $.ajax({
                url: 'fetch_item.php', // Endpoint to fetch items
                method: 'POST',
                data: { category_id: categoryId },
                success: function (response) {
                    $('#menu-items').html(response);
                }
            });
        }
    </script>
</body>
</html>
