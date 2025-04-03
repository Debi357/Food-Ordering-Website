-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2025 at 12:17 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'debika', '2003');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `image` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE IF NOT EXISTS `cart_items` (
  `cart_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_id`, `user_id`, `product_id`, `quantity`) VALUES
(18, 17, 14, 1),
(19, 17, 23, 1),
(23, 19, 35, 7),
(25, 16, 44, 3),
(26, 16, 61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Beverages', 'coffe.webp'),
(2, 'Breakfast', 'breakfast.jpg'),
(3, 'Salads', 'salad.jpg'),
(4, 'Appetizers', 'snacks.jpg'),
(5, 'Main Course', 'main.avif'),
(6, 'Grill/BBQ', 'grill.webp'),
(7, 'Dessert', 'dessert.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `price` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_no` (`item_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `item_no`, `name`, `type`, `detail`, `price`, `image`, `category_id`) VALUES
(1, 1, 'Samosa', 'Veg', ' a crispy, deep-fried pastry filled with spiced potatoes, peas, and sometimes meat, often served with chutneys for dipping.', '25', 'samosa.jpg', 4),
(2, 2, 'Jalebi', 'Veg', 'Jalebi is made by deep-frying maida flour batter in pretzel or circular shapes, which are then soaked in sugar syrup.', '49', 'j.webp', 7),
(3, 3, 'Naan', 'Veg', 'Naan is a leavened, oven-baked flatbread.', '25', 'naan.jpeg', 5),
(4, 4, 'Paneer Bhurji', 'Veg', 'Scrambled Indian cottage cheese with onion, tomatoes and spices.', '50', 'Paneer-Bhurji.png', 5),
(5, 5, 'Pulav', 'Veg', ' a spicy rice dish prepared by cooking rice with various vegetables and spices.', '60', 'veg-pulao.jpg', 5),
(6, 6, 'Chiken Biryani', 'Non Veg', ' a delicious savory rice dish loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice.', '100', 'cb.jpg', 5),
(7, 7, 'Fishfry', 'Non Veg', ' a dish where fish fillets are battered or breaded and deep-fried until crispy, often served with sides like fries, coleslaw, and tartar sauce.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '120', 'B.jpg', 4),
(8, 8, 'Butter Chicken', 'Non Veg', ' a dish, originating in the Indian subcontinent, of chicken in a mildly spiced tomato sauce.', '99', 'ButterChicken.jpg', 5),
(9, 9, 'Masala Dosa', 'nonveg', 'A crispy rice crepe filled with spiced mashed potatoes, typically served with chutneys and sambar.', '55', 'h.jpg', 4),
(10, 10, 'Chicken Wings', 'non vage', 'Crispy and flavorful wings tossed in a savory sauce.', '160', 'wings.jpg', 4),
(12, 12, 'Fries', 'veg', 'Golden, crispy fries perfect for dipping in your favorite sauces.', '120', 'fries.webp', 4),
(13, 13, 'Jalepino Nachos', 'veg', 'Crunchy tortilla chips topped with melted cheese and spicy jalapenos.', '150', 'nacho.jpg\r\n', 4),
(14, 14, 'Black coffe', 'veg', 'Bold and aromatic black coffee, perfect for coffee lovers.', '60', 'black.webp\r\n', 1),
(15, 15, 'Cold coffe', 'veg', 'Smooth, chilled coffee with a rich, refreshing taste.', '150', 'cold-coffee.jpg', 1),
(16, 16, 'Cappuccino', 'veg', ' A creamy, frothy espresso drink topped with steamed milk and foam.', '', 'cappuccino.png', 1),
(17, 17, 'Orange juice', 'veg', 'Refreshing and tangy fresh-squeezed orange juice.', '110', 'orenge.jpeg', 1),
(18, 18, 'Watermelon juice', 'veg', 'A sweet and refreshing juice made from ripe, juicy watermelon, perfect for quenching your thirst.', '110', 'water.webp', 1),
(19, 19, 'Mango juice', 'veg', 'Sweet and tropical mango juice, a taste of the tropics in every sip.', '120', 'mango.jpeg', 1),
(20, 20, 'Pineapple juice', 'veg', 'Fresh, vibrant pineapple juice with a sweet, tart flavor.', '120', 'pi.jpg', 1),
(21, 21, 'Chocolate Milkshake', 'veg', 'A creamy and indulgent blend of milk, chocolate syrup, and ice cream, topped with whipped cream for a sweet treat.', '180', 'choco.jpg', 1),
(22, 22, 'Strawberry Milkshake', 'veg', 'A creamy and sweet milkshake made with fresh strawberries, milk, and a touch of sweetness for a delicious treat.', '200', 'straw.jpg', 1),
(23, 23, 'Pancake', 'veg', 'Soft, fluffy cakes made from a batter of flour, milk, and eggs, often served with syrup and butter.', '130', 'pan.webp', 2),
(24, 24, 'French Omelete', 'Nonveg', 'A savory dish made by beating eggs and cooking them in a pan, often filled with vegetables, cheese, or meats.', '100', 'omelet.webp', 2),
(25, 25, 'Vegetable Sandwich', 'veg', 'A healthy and flavorful sandwich filled with fresh vegetables, creamy spreads, and optional cheese, served between slices of bread.', '100', 'veg.webp', 2),
(26, 26, 'Egg sandwich', 'Nonveg', 'A sandwich filled with boiled or scrambled eggs, often paired with vegetables, mayo, or mustard, between slices of bread.', '130', 'egg.webp', 2),
(27, 27, 'Chicken Sandwich', 'Nonveg', 'A sandwich filled with tender, seasoned chicken, often served with lettuce, tomatoes, and sauces between two slices of bread or in a bun.', '180', 'chicken.jpg', 2),
(28, 28, 'Aloo Paratha', 'veg', 'A traditional Indian flatbread stuffed with a spiced mashed potato filling, typically served with yogurt, pickles, or curry.', '60 (2 piece)', 'pot.webp', 2),
(29, 29, 'Paneer Paratha', 'veg', 'A flavorful Indian flatbread stuffed with spiced crumbled paneer, cooked to golden perfection with a hint of butter or ghee.\n\n\n\n\n\n\n\n\n\n\n\n', '90 (2 piece)', 'paneer.jpg', 2),
(30, 30, 'Caesar Salad', 'Nonveg', 'A classic salad featuring crisp romaine lettuce, crunchy croutons, Parmesan cheese, and a creamy Caesar dressing.', '200', 'c.jpg', 3),
(31, 31, 'Leafy Green Salad', 'veg', 'A refreshing mix of crisp lettuce, spinach, and arugula, tossed with cherry tomatoes, cucumbers, and a light vinaigrette dressing, perfect for a healthy bite.', '170', 'Green.jpg', 3),
(32, 32, 'Greek Salad', 'veg', ' A vibrant mix of crisp cucumbers, juicy tomatoes, red onions, and Kalamata olives, topped with tangy feta cheese and a zesty olive oil dressing."', '300', 'Greek.jpg', 3),
(33, 33, 'Fattoush', 'veg', ' a crisp Middle Eastern salad with greens, veggies, and crunchy pita, dressed in lemon and olive oil.', '350', 'fat.jpg', 3),
(34, 34, 'Cobb Salad', 'Nonveg', 'a mixed salad with greens, chicken, bacon, avocado, eggs, and blue cheese.\n\n\n\n\n\n\n', '400', 'Cobb.webp', 3),
(35, 35, 'Chicken Salad', 'Nonveg', 'A refreshing mix of tender chicken, crisp vegetables, and a creamy dressing, offering a healthy and flavorful meal option.', '350', 'chi.webp', 3),
(36, 36, 'Ambrosia', 'veg', ' a sweet fruit salad made with mixed fruits, whipped cream, and often marshmallows or coconut.', '300', 'a.jpg', 3),
(37, 37, 'Waldorf Salad', 'veg', 'a mix of apples, celery, walnuts, and grapes, dressed in mayonnaise or yogurt.', '300', 'w.webp', 3),
(38, 38, 'Veg Momo', 'veg', 'Steamed dumplings filled with mixed vegetables, served with a spicy dipping sauce.', '120', 'v.jpg', 4),
(39, 39, 'Chicken Momo', 'Nonveg', 'Steamed dumplings filled with seasoned chicken, served with a flavorful dipping sauce.', '150', 'm.jpg', 4),
(40, 40, 'Corn on the Cob (Bhutta)', 'veg', 'Grilled corn brushed with butter and spices, delivering a smoky, tangy, and juicy flavor.', '90 (2 piece)', '6.jpeg', 6),
(41, 41, 'Paneer Tikka', 'veg', 'Marinated cubes of paneer (Indian cottage cheese) grilled to perfection, offering a smoky, spiced flavor with a crispy exterior.', '200 (8 piece)', 'p.jpg', 6),
(42, 42, 'Fish Tikka', 'Nonveg', 'Marinated fish chunks, typically boneless, grilled or baked to perfection, with smoky flavors and a tender, juicy texture.', '200 (8 piece) ', 'F.webp', 6),
(43, 43, 'Tandoori Chicken Wings', 'Nonveg', 'Marinated chicken wings grilled in a tandoor, with a smoky flavor and vibrant spices.', '250 (3 piece)', 't.jpeg', 6),
(44, 44, 'Chicken Tikka Kebab', 'Nonveg', 'Succulent pieces of chicken marinated in a blend of yogurt and spices, skewered and grilled to a smoky, tender perfection.', '250 (6 piece)', 'd.webp', 6),
(45, 45, 'Chicken & Vegetable Shish Kebab', 'Nonveg', 'Grilled skewers of tender chicken and fresh vegetables, marinated in flavorful spices for a smoky and savory taste.', '250 (4 piece)', '1.jpg', 6),
(46, 46, 'Tandoori Chicken Legs', 'Nonveg', 'Chicken drumsticks marinated in a blend of yogurt and spices, then grilled to perfection in a tandoor for a smoky, flavorful finish.', '250 (6 piece)', 'n.jpg', 6),
(47, 47, 'Seekh Kebab', 'Nonveg', 'Spiced minced meat (usually lamb or chicken) molded onto skewers and grilled until charred and juicy, offering a smoky, savory flavor.', '200 (6 piece)', 's.webp', 6),
(48, 48, 'Chocolate Cupcake', 'veg', 'moist, rich treat with a delicious cocoa flavor, topped with creamy chocolate frosting.', '40', 'cc.jpg', 7),
(49, 49, 'Chocolate Waffle', 'veg', ' a delicious, crispy waffle infused with rich cocoa, often topped with melted chocolate, whipped cream, and various sweet toppings.', '60', 'cw.jpg', 7),
(50, 50, 'Turtle Brownie Icecream', 'veg', 'a decadent dessert featuring rich chocolate brownie chunks, caramel swirls, and crunchy pecans, all swirled together in creamy ice cream.', '120', 'tur.jpg', 7),
(51, 51, 'Gulab Jamun', 'veg', ' a popular Indian dessert made of deep-fried dough balls soaked in a sweet, aromatic syrup flavored with rose water, cardamom, and saffron.\r\n\r\n\r\n\r\n\r\n', '15', 'gulab.webp', 7),
(52, 52, 'Molten Lava cake', 'veg', 'a rich and indulgent dessert with a warm, gooey chocolate center that flows out when cut, encased in a soft, decadent chocolate cake.', '200', 'Mol.jpg', 7),
(53, 53, 'Chocolate Doughnut', 'veg', 'a fluffy, deep-fried dough pastry coated in a smooth layer of rich chocolate glaze, offering a delightful combination of sweetness and texture.', '60', 'do.jpg', 7),
(54, 54, 'chocolate mousse', 'veg', 'a creamy, airy dessert made with rich chocolate, whipped cream, and eggs, creating a smooth and indulgent texture with a deep chocolate flavor.', '120', 'mo.jpg', 7),
(55, 55, 'Palak Paneer', 'veg', 'a flavorful North Indian dish made with paneer (Indian cottage cheese) cooked in a smooth, spiced spinach gravy.', '170', 'palak.webp', 5),
(56, 56, 'Paneer Butter Masala', 'veg', 'a creamy, spiced tomato curry with soft paneer cubes.', '200', 'pb.jpg', 5),
(58, 57, 'Mixed Fried Rice', 'Nonveg', ' a flavorful dish made with stir-fried rice, vegetables, and seasonings.', '350', 'mi.avif', 5),
(59, 58, 'Chilli Chicken', 'Nonveg', 'a spicy, stir-fried chicken dish with a tangy sauce, featuring green chilies, soy sauce, and garlic.', '250', 'Chilli-Chicken.jpg', 5),
(60, 67, 'jjjjj', '', 'oooo', '67', 'aloo.jpeg', 2),
(61, 88, 'Chicken Noodles', '', 'A popular indo chinese recipe made with chicken,noodles,vegetables,garlic tossed with sauces', '90', 'no.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `price` int(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(600) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=711 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Id`, `userId`, `itemName`, `price`, `qty`, `total`, `name`, `address`, `email`, `payment_method`, `order_date`, `status`) VALUES
(18, 2, 'Jalebi', 49, 1, 49, 'abcd', 'Shankar Ngr, Tilak Rd, ABC(east) eee\r\nMumbai 400001', 'aaa@g.c', '', '2024-06-17 20:30:03', '0'),
(19, 2, 'Samosa', 15, 1, 15, 'abcd', 'Shankar Ngr, Tilak Rd, ABC(east) eee\r\nMumbai 400001', 'aaa@g.c', '', '2024-07-29 22:53:00', '0'),
(20, 1, 'Samosa', 15, 2, 79, 'Nitish Nagar', 'Shivaji Road, Thane(W), Thane - 400601', 'nitish@gmail.com', '', '2024-07-31 05:36:18', '0'),
(21, 1, 'Jalebi', 49, 1, 79, 'Nitish Nagar', 'Shivaji Road, Thane(W), Thane - 400601', 'nitish@gmail.com', '', '0000-00-00 00:00:00', '0'),
(22, 13, 'Samosa', 15, 1, 126, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(23, 13, 'Jalebi', 49, 1, 126, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(24, 13, 'Naan', 12, 1, 126, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(25, 13, 'Paneer Bhurji', 50, 1, 126, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(26, 13, 'Samosa', 15, 1, 27, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(27, 13, 'Naan', 12, 1, 27, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(28, 13, 'Samosa', 15, 1, 127, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(29, 13, 'Naan', 12, 1, 127, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(30, 13, 'Biryani', 100, 1, 127, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(31, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(32, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(33, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(34, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(35, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(36, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(37, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(38, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(39, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(40, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(41, 13, 'Jalebi', 49, 1, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(42, 13, 'Biryani', 100, 3, 349, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(43, 13, 'Samosa', 15, 1, 162, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(44, 13, 'Jalebi', 49, 3, 162, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(45, 13, 'Jalebi', 49, 2, 122, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(46, 13, 'Naan', 12, 2, 122, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(47, 13, 'Jalebi', 49, 2, 122, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(48, 13, 'Naan', 12, 2, 122, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(49, 13, 'Samosa', 15, 4, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(50, 13, 'Jalebi', 49, 1, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(51, 13, 'Samosa', 15, 4, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(52, 13, 'Jalebi', 49, 1, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(53, 13, 'Samosa', 15, 4, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(54, 13, 'Jalebi', 49, 1, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(55, 13, 'Samosa', 15, 4, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(56, 13, 'Jalebi', 49, 1, 109, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(57, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(58, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(59, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(60, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(61, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(62, 13, 'Jalebi', 49, 3, 973, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(63, 13, 'Samosa', 15, 2, 973, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(64, 13, 'Biryani', 100, 4, 973, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(65, 13, 'Butter Chicken', 99, 4, 973, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(66, 13, 'Samosa', 15, 1, 76, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(67, 13, 'Jalebi', 49, 1, 76, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(68, 13, 'Naan', 12, 1, 76, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(69, 13, 'Samosa', 15, 1, 15, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(70, 13, 'Jalebi', 49, 1, 49, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(71, 13, 'Jalebi', 49, 1, 49, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(72, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(73, 13, 'Naan', 12, 1, 12, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(74, 13, 'Samosa', 15, 3, 217, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(75, 13, 'Jalebi', 49, 2, 217, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(76, 13, 'Naan', 12, 2, 217, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(77, 13, 'Paneer Bhurji', 50, 1, 217, 'Jethalal Gada', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', '', '0000-00-00 00:00:00', '0'),
(78, 16, '', 0, 0, 143, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(79, 16, '', 0, 0, 143, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(80, 16, '', 0, 0, 711, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(81, 16, '', 0, 0, 760, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(82, 16, '', 0, 0, 760, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(83, 16, '', 0, 0, 750, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(84, 16, '', 0, 0, 762, 'debika', 'hhhh', 'bbbbbb@gmail.com', '0', '0000-00-00 00:00:00', 'Pending'),
(672, 16, '', 0, 0, 822, 'debika', 'hhhh', 'bbbbbb@gmail.com', '0', '0000-00-00 00:00:00', 'Pending'),
(673, 16, '', 0, 0, 1176, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(674, 16, '', 0, 0, 1296, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(675, 17, '', 0, 0, 98, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(676, 17, '', 0, 0, 219, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(677, 17, '', 0, 0, 219, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(678, 16, '', 0, 0, 1296, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(679, 16, '', 0, 0, 429, 'debika', 'hhhh', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(680, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(681, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(682, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(683, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(684, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(685, 16, '', 0, 0, 1113, 'debika', 'huugrf', 'bbbbbb@gmail.com', 'cod', '0000-00-00 00:00:00', 'Pending'),
(686, 16, '', 0, 0, 2658, 'debika', 'nbcg', 'bbbbbb@gmail.com', 'cod', '2024-11-30 08:25:29', 'Pending'),
(687, 16, '', 0, 0, 2838, 'debika', 'nbcg', 'bbbbbb@gmail.com', 'cod', '2024-11-30 10:54:43', 'Pending'),
(690, 16, '', 0, 0, 2898, 'debika', 'nbcg', 'bbbbbb@gmail.com', 'cod', '2024-12-02 05:29:20', 'Pending'),
(691, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 05:38:06', 'Pending'),
(692, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 05:41:27', 'Pending'),
(693, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 05:43:46', 'Pending'),
(694, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 05:49:02', 'Pending'),
(695, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 06:02:01', 'Pending'),
(696, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 07:30:24', 'Pending'),
(697, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 07:35:03', 'Pending'),
(698, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 07:36:51', 'Pending'),
(699, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 07:44:23', 'Pending'),
(700, 17, '', 0, 0, 190, 'shinchan', 'njgtjknhv', 'yoo@gmail.com', 'cod', '2024-12-02 15:37:09', 'Pending'),
(701, 16, '', 0, 0, 2966, 'debika', 'nbcg', 'bbbbbb@gmail.com', 'cod', '2024-12-06 03:08:56', 'Pending'),
(702, 16, '', 0, 0, 2751, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-06 03:49:05', 'Pending'),
(703, 16, '', 0, 0, 2751, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-06 03:59:12', 'Pending'),
(704, 16, '', 0, 0, 2751, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-06 04:00:40', 'Pending'),
(705, 16, '', 0, 0, 2751, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-06 06:06:18', 'Pending'),
(706, 16, '', 0, 0, 150, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-06 06:11:41', 'Pending'),
(707, 19, '', 0, 0, 2450, 'amritash', 'xyz', 'amri@gmail.com', 'cod', '2024-12-06 06:26:36', 'Pending'),
(708, 16, '', 0, 0, 0, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-08 13:59:26', 'Pending'),
(709, 16, '', 0, 0, 0, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-08 14:07:58', 'Pending'),
(710, 16, '', 0, 0, 840, 'debika', 'bbbbb', 'bbbbbb@gmail.com', 'cod', '2024-12-13 08:08:18', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `Id` int(100) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qty` int(100) NOT NULL,
  `total` decimal(19,0) NOT NULL,
  `orderId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`itemName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`Id`, `itemName`, `price`, `qty`, `total`, `orderId`) VALUES
(78, 'Jalebi', 49, 2, 98, 1),
(78, 'Samosa', 15, 3, 45, 2),
(79, 'Jalebi', 49, 2, 98, 3),
(79, 'Samosa', 15, 3, 45, 4),
(80, 'Jalebi', 49, 11, 539, 5),
(80, 'Samosa', 15, 4, 60, 6),
(80, 'Fish', 100, 1, 100, 7),
(80, 'Naan', 12, 1, 12, 8),
(81, 'Jalebi', 49, 12, 588, 9),
(81, 'Samosa', 15, 4, 60, 10),
(81, 'Fish', 100, 1, 100, 11),
(81, 'Naan', 12, 1, 12, 12),
(82, 'Jalebi', 49, 12, 588, 13),
(82, 'Samosa', 15, 4, 60, 14),
(82, 'Fish', 100, 1, 100, 15),
(82, 'Naan', 12, 1, 12, 16),
(83, 'Jalebi', 49, 12, 588, 17),
(83, 'Fish', 100, 1, 100, 18),
(83, 'Naan', 12, 1, 12, 19),
(83, 'Paneer Bhurji', 50, 1, 50, 20),
(84, 'Jalebi', 49, 12, 588, 21),
(84, 'Fish', 100, 1, 100, 22),
(84, 'Naan', 12, 2, 24, 23),
(84, 'Paneer Bhurji', 50, 1, 50, 24),
(672, 'Jalebi', 49, 12, 588, 25),
(672, 'Fish', 100, 1, 100, 26),
(672, 'Naan', 12, 2, 24, 27),
(672, 'Paneer Bhurji', 50, 1, 50, 28),
(672, 'Pulav', 60, 1, 60, 29),
(673, 'Jalebi', 49, 18, 882, 30),
(673, 'Naan', 12, 2, 24, 31),
(673, 'Paneer Bhurji', 50, 3, 150, 32),
(673, 'Pulav', 60, 2, 120, 33),
(674, 'Jalebi', 49, 18, 882, 34),
(674, 'Naan', 12, 2, 24, 35),
(674, 'Paneer Bhurji', 50, 3, 150, 36),
(674, 'Pulav', 60, 4, 240, 37),
(675, 'Jalebi', 49, 2, 98, 38),
(676, 'Jalebi', 49, 3, 147, 39),
(676, 'Pulav', 60, 1, 60, 40),
(676, 'Naan', 12, 1, 12, 41),
(677, 'Jalebi', 49, 3, 147, 42),
(677, 'Pulav', 60, 1, 60, 43),
(677, 'Naan', 12, 1, 12, 44),
(678, 'Jalebi', 49, 18, 882, 45),
(678, 'Naan', 12, 2, 24, 46),
(678, 'Paneer Bhurji', 50, 3, 150, 47),
(678, 'Pulav', 60, 4, 240, 48),
(679, 'Naan', 12, 2, 24, 49),
(679, 'Paneer Bhurji', 50, 3, 150, 50),
(679, 'Pulav', 60, 4, 240, 51),
(679, 'Samosa', 15, 1, 15, 52),
(680, 'Fishfry', 100, 3, 300, 53),
(680, 'Butter Chicken', 99, 4, 396, 54),
(680, 'Naan', 12, 1, 12, 55),
(680, 'Masala Dosa', 55, 1, 55, 56),
(680, 'Chicken Salad', 350, 1, 350, 57),
(681, 'Fishfry', 100, 3, 300, 58),
(681, 'Butter Chicken', 99, 4, 396, 59),
(681, 'Naan', 12, 1, 12, 60),
(681, 'Masala Dosa', 55, 1, 55, 61),
(681, 'Chicken Salad', 350, 1, 350, 62),
(682, 'Fishfry', 100, 3, 300, 63),
(682, 'Butter Chicken', 99, 4, 396, 64),
(682, 'Naan', 12, 1, 12, 65),
(682, 'Masala Dosa', 55, 1, 55, 66),
(682, 'Chicken Salad', 350, 1, 350, 67),
(683, 'Fishfry', 100, 3, 300, 68),
(683, 'Butter Chicken', 99, 4, 396, 69),
(683, 'Naan', 12, 1, 12, 70),
(683, 'Masala Dosa', 55, 1, 55, 71),
(683, 'Chicken Salad', 350, 1, 350, 72),
(684, 'Fishfry', 100, 3, 300, 73),
(684, 'Butter Chicken', 99, 4, 396, 74),
(684, 'Naan', 12, 1, 12, 75),
(684, 'Masala Dosa', 55, 1, 55, 76),
(684, 'Chicken Salad', 350, 1, 350, 77),
(685, 'Fishfry', 100, 3, 300, 78),
(685, 'Butter Chicken', 99, 4, 396, 79),
(685, 'Naan', 12, 1, 12, 80),
(685, 'Masala Dosa', 55, 1, 55, 81),
(685, 'Chicken Salad', 350, 1, 350, 82),
(686, 'Fishfry', 100, 3, 300, 83),
(686, 'Butter Chicken', 99, 4, 396, 84),
(686, 'Naan', 12, 1, 12, 85),
(686, 'Chicken Salad', 350, 3, 1050, 86),
(686, 'Chicken Sandwich', 180, 5, 900, 87),
(687, 'Fishfry', 120, 3, 360, 88),
(687, 'Butter Chicken', 99, 4, 396, 89),
(687, 'Naan', 12, 1, 12, 90),
(687, 'Chicken Salad', 350, 3, 1050, 91),
(687, 'Chicken Sandwich', 180, 5, 900, 92),
(687, 'Pineapple juice', 120, 1, 120, 93),
(0, 'Butter Chicken', 99, 4, 396, 690),
(0, 'Chicken Salad', 350, 3, 1050, 690),
(0, 'Chicken Sandwich', 180, 5, 900, 690),
(0, 'Fishfry', 120, 3, 360, 690),
(0, 'Naan', 12, 1, 12, 690),
(0, 'Pineapple juice', 120, 1, 120, 690),
(0, 'Pulav', 60, 1, 60, 690),
(0, 'Black coffe', 60, 1, 60, 691),
(0, 'Pancake', 130, 1, 130, 691),
(0, 'Black coffe', 60, 1, 60, 692),
(0, 'Pancake', 130, 1, 130, 692),
(0, 'Black coffe', 60, 1, 60, 693),
(0, 'Pancake', 130, 1, 130, 693),
(0, 'Black coffe', 60, 1, 60, 694),
(0, 'Pancake', 130, 1, 130, 694),
(0, 'Black coffe', 60, 1, 60, 695),
(0, 'Pancake', 130, 1, 130, 695),
(0, 'Black coffe', 60, 1, 60, 696),
(0, 'Pancake', 130, 1, 130, 696),
(0, 'Black coffe', 60, 1, 60, 697),
(0, 'Pancake', 130, 1, 130, 697),
(0, 'Black coffe', 60, 1, 60, 698),
(0, 'Pancake', 130, 1, 130, 698),
(0, 'Black coffe', 60, 1, 60, 699),
(0, 'Pancake', 130, 1, 130, 699),
(0, 'Black coffe', 60, 1, 60, 700),
(0, 'Pancake', 130, 1, 130, 700),
(0, 'Butter Chicken', 99, 4, 396, 701),
(0, 'Chicken Salad', 350, 3, 1050, 701),
(0, 'Chicken Sandwich', 180, 5, 900, 701),
(0, 'Fishfry', 120, 3, 360, 701),
(0, 'Masala Dosa', 55, 1, 55, 701),
(0, 'Naan', 25, 1, 25, 701),
(0, 'Pineapple juice', 120, 1, 120, 701),
(0, 'Pulav', 60, 1, 60, 701),
(0, 'Butter Chicken', 99, 4, 396, 702),
(0, 'Chicken Salad', 350, 3, 1050, 702),
(0, 'Chicken Sandwich', 180, 5, 900, 702),
(0, 'Masala Dosa', 55, 1, 55, 702),
(0, 'Palak Paneer', 170, 1, 170, 702),
(0, 'Pineapple juice', 120, 1, 120, 702),
(0, 'Pulav', 60, 1, 60, 702),
(0, 'Butter Chicken', 99, 4, 396, 703),
(0, 'Chicken Salad', 350, 3, 1050, 703),
(0, 'Chicken Sandwich', 180, 5, 900, 703),
(0, 'Masala Dosa', 55, 1, 55, 703),
(0, 'Palak Paneer', 170, 1, 170, 703),
(0, 'Pineapple juice', 120, 1, 120, 703),
(0, 'Pulav', 60, 1, 60, 703),
(0, 'Butter Chicken', 99, 4, 396, 704),
(0, 'Chicken Salad', 350, 3, 1050, 704),
(0, 'Chicken Sandwich', 180, 5, 900, 704),
(0, 'Masala Dosa', 55, 1, 55, 704),
(0, 'Palak Paneer', 170, 1, 170, 704),
(0, 'Pineapple juice', 120, 1, 120, 704),
(0, 'Pulav', 60, 1, 60, 704),
(0, 'Butter Chicken', 99, 4, 396, 705),
(0, 'Chicken Salad', 350, 3, 1050, 705),
(0, 'Chicken Sandwich', 180, 5, 900, 705),
(0, 'Masala Dosa', 55, 1, 55, 705),
(0, 'Palak Paneer', 170, 1, 170, 705),
(0, 'Pineapple juice', 120, 1, 120, 705),
(0, 'Pulav', 60, 1, 60, 705),
(0, 'Cold coffe', 150, 1, 150, 706),
(0, 'Chicken Salad', 350, 7, 2450, 707),
(0, 'Chicken Noodles', 90, 1, 90, 710),
(0, 'Chicken Tikka Kebab', 250, 3, 750, 710);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(19) NOT NULL,
  `name` varchar(28) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(444) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `userId` int(100) NOT NULL,
  `orderId` int(100) NOT NULL,
  `rating` int(100) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `userId`, `orderId`, `rating`, `review`, `created_at`) VALUES
(1, 16, 680, 4, 'bdj', '2024-11-29 08:05:22'),
(2, 16, 682, 2, 'jgj', '2024-11-29 08:42:08'),
(3, 16, 686, 5, 'very good', '2024-11-30 08:25:57'),
(4, 17, 700, 4, 'gfh', '2024-12-02 15:37:22'),
(5, 16, 702, 3, 'nnnn', '2024-12-06 03:49:46'),
(6, 16, 705, 4, 'yes', '2024-12-06 06:07:15'),
(7, 19, 707, 4, 'ni\r\nce', '2024-12-06 06:27:15'),
(8, 16, 709, 4, 'jjj', '2024-12-08 14:08:20'),
(9, 16, 710, 3, 'good', '2024-12-13 08:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `cpassword` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `mobile`, `address`, `email`, `password`, `cpassword`) VALUES
(1, 'Nitish Nagar', '9874651230', 'Shivaji Road, Thane(W), Thane - 400601', 'nitish@gmail.com', 'nitishfood@123', 'nitishfood@123'),
(2, 'Nilesh Kawar', '9988776655', 'Plot-15, Sector-4, Sanpada, Navi Mumbai - 400028', 'nilesh@gmail.com', 'nileshfood-456', 'nileshfood-456'),
(3, 'Gajodhar Singh', '9988776543', 'No Chill Nagar, Plot No. 20, Ghodbunder Rd, Thane(W)-400069', 'gajodhar@gmail.com', 'gajju@42069', 'gajju@42069'),
(4, 'Bheem', '1213141516', 'Dholakpur Housing Society, Kasarvadavli, Thane(W)-400036', 'bheem@gmail.com', 'bheem_000', 'bheem_000'),
(5, 'Sherlock Holmes', '9988554433', '221-B, Baker Street, Navi Mumbai - 400078', 'sherlock@yahoo.com', 'sherlock-221', 'sherlock-221'),
(6, 'Ganesh Gaitonde', '9988770420', 'Plot no.6, Gopalmath, Panvel, Navi Mumbai - 400110', 'kukkoo@gmail.com', 'bhagwan@123', 'bhagwan@123'),
(12, 'Nil', '9988776540', 'rgaraea ragre', 'aaa@g.c', '123', '123'),
(13, 'Jethalal Gada', '987456321', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya@gmail.com', 'jethiya@123', 'jethiya@123'),
(14, 'Jethalal Gada', '987456321', 'Flat No. 100, B wing Gokuldhan Soceity, Powder Gully, Goregoan Mumbai, 400005', 'jethiya1@gmail.com', 'jethiya@123', 'jethiya@123'),
(15, 'debika', '7953087432', 'bvthnk', 'bhgefhhn@gmail.com', 'mmmm', 'mmmm'),
(16, 'Arijit Guria', '1234567890', 'bbbbb', 'bbbbbb@gmail.com', 'mmmm', 'mmmm'),
(17, 'shinchan', '7709432111', 'njgtjknhv', 'yoo@gmail.com', '12345', '12345'),
(18, 'fff', '4444444444', 'ggg', 'ggg@gmail.com', '6666', '6666'),
(19, 'amritash', '7076445701', 'xyz', 'amri@gmail.com', '1234', '1234');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
