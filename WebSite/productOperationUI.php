<html lang="en">
<head>
	<title>Product Menu</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
<?php
    session_start();
    if($_SESSION["user"] != 1){
        header("Location:login.php");
    }
    
?>

    <!--
	<div class="container-login100" style="background-image: url('images/bg-04.png');">
    -->
	<div class="container-login100" >
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				
                <!--
                <span class="login100-form-title p-b-37">
					Web User Sign In
				</span>
                -->
                
                
                
                
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="addproduct" value="Add Product">
				</div>

                <div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="updateproduct" value="Update Product">
				</div>
                
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="logout" value="Logout">
				</div>


                
           
			</form>

			
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

    
    
    
<?php

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        if (isset($_POST['logout'])) {
            header('Location:login.php');   

        }
    
        else if (isset($_POST['addproduct'])) {
            header('Location:addProduct.php');
        
        }
        
        else if (isset($_POST['updateproduct'])) {
            header('Location:updateProduct.php');

        }
    }

?>
        
    
    
    
    
    
    
    
    
    
</body>
</html>