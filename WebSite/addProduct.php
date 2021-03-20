<html lang="en">
<head>
	<title>Add Product</title>
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
					<input type="submit" class="login100-form-btn" name="createproduct" value="Create New Product">
				</div>
             
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="back" value="Back">
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

    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        if (isset($_POST['back'])) {
            header('Location:productOperationUI.php');  

        }
    
        else if (isset($_POST['createproduct'])) {

            $randomSeed=rand(100000,999999);
            $randomSeedStr = str_split($randomSeed);

            $plusRandom = $randomSeedStr[0]+$randomSeedStr[1]+$randomSeedStr[2]+$randomSeedStr[3]+$randomSeedStr[4]+$randomSeedStr[5];

            $jcode ="J".$randomSeed."".$plusRandom; 

            require_once('mysqli_connect.php');
            $create_query = "CALL mercury.CreateNewCouch('".$jcode."');";
            mysqli_query($dbc, $create_query);
            $_SESSION["jcode"] = $jcode;
            $_SESSION["new"] = 1;
            
            $product_id_query = "CALL mercury.SelectCouch('".$jcode."');";
            $product_id_response = mysqli_query($dbc, $product_id_query);
            $row= mysqli_fetch_array($product_id_response);
            
            $_SESSION["product_id"] = $row["id"];
            header('Location:updateProduct.php');
            exit;
        }
    
    }

    
    
?>
        

</body>
</html>










































    

