<?php
include('dbcon.php');



if (isset($_POST['category_id'])) {
    $category_id = intval($_POST['category_id']);

    $query = "SELECT * FROM menu WHERE category_id = $category_id";
    $result = mysqli_query($conn, $query);

    while ($row = mysqli_fetch_assoc($result)) {
        echo '<div class="card">';
        echo '<img src="dataimg/' . $row['image'] . '" class="card-img-top" alt="' . $row['name'] . '">';
        echo '<div class="card-body">';
        echo '<h5 class="card-title">' . $row['name'] . '</h5>';
        echo '<p class="card-text">' . $row['detail'] . '</p>';
        echo '<p class="price">Price: ₹' . $row['price'] . '</p>';
        echo '<form action="add_to_cart.php" method="post">';
        echo '<input type="hidden" name="id" value="' . $row['id'] . '">';
        echo '<input type="number" name="quantity" value="1" min="1" class="form-control mb-2">';
        echo '<button type="submit" class="btn btn-primary add-to-cart-btn">Add to Cart</button>';
        echo '</form>';
        echo '</div>';
        echo '</div>';
    }
}
?>
