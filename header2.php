<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>KGF</title>
	<!-- font awesome -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
  	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Baloo+Thambi+2:wght@400;600&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
	<!-- Increament & Decreament JS -->
	<script type="text/javascript" src="../javascript/quantity_inc_dec.js"></script>
	<style>
		/* Import Google Font - Knewave */
		@import url('https://fonts.googleapis.com/css2?family=Playfair Display&display=swap');

		/* General body styling */
		body {
			font-family: 'Baloo Thambi 2', sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f7f7f7 ;
		}

		/* Main menu and navbar styling */
		.main-menu {
			width: 100%;
			background-color: #343a40; /* Dark background color */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			position: relative;
		}

		.navbar {
			background-color: #343a40; /* Same dark background as header */
		}

		.inner-menu {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 15px 30px;
			background-color: #343a40; /* Same dark background color */
		}

		/* Navbar brand/logo styling */
		.logo-text {
			color: white;
			font-size: 28px;
			font-weight: bold;
			font-family:'Playfair Display', sans-serif;
		}

		/* KGF title in center */
		h1 {
			color: white;
			font-size: 37px;
			text-align: center;
			margin: 0;
			font-family: 'Playfair Display', sans-serif;
		}

		/* Home and Cart links */
		.inner-menu a {
			color: white;
			font-size: 20px;
			text-decoration: none;
			font-weight: bold;
			padding: 10px 15px;
			border: 2px solid white;
			border-radius: 5px;
			transition: all 0.3s ease;
			font-family: 'Playfair Display', sans-serif;
		}

		/* Hover effect for links */
		.inner-menu a:hover {
			background:linear-gradient(to left, #ff105f, #ffad06); /* Green hover */
			color: #fff;
			text-decoration: none;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}

		/* Cart badge styling */
		.inner-menu a span {
			color: #FFD700; /* Gold color for the count */
			font-size: 18px;
			margin-left: 5px;
		}

		/* Responsive design */
		@media (max-width: 768px) {
			.inner-menu {
				flex-direction: column;
				text-align: center;
			}

			.inner-menu a {
				margin-bottom: 10px;
			}

			h1 {
				margin-bottom: 15px;
				font-size: 26px;
			}
		}
	</style>
</head>
<body>

	<!-- Main Menu and Header Section -->
	<div class="main-menu">
		<header>
			<nav class="navbar navbar-expand-lg navbar-dark">
				<div class="container-fluid">
					
				</div>
			</nav>
		</header>
	</div>

	<!-- Navigation Menu -->
	<div class="inner-menu">
		<a href="menu.php">MENU</a>
		<h1>KGF</h1>
		<a href="cart.php">CART 
			
		</a>
	</div>

	<!-- Page content goes here -->
	<div class="content">
		<p> </p>
	</div>

</body>
</html>
