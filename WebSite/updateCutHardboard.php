<html lang="en">
<head>
	<title>Update Cut Hardboard</title>
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

    
<?php
    session_start();
    require_once("mysqli_connect.php");
    $query ="SELECT * FROM mercury.personnel_table ;";
    $all_personnel_result = @mysqli_query($dbc, $query);
    $query ="SELECT * FROM mercury.machine_table ;";
    $all_machine_result = @mysqli_query($dbc, $query);
?>

    
    
    <!--
	<div class="container-login100" style="background-image: url('images/bg-04.png');">
    -->
	<div class="container-login100" >
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				

                
                
                <span class="login100-form-title p-b-37">
                Cut Hardboard Update Product: <?php echo $_SESSION["jcode"];?>
                </span>
                
                
                <div class="text-left">
						Personnel
				</div>
                
                <div class="login100-form-title p-b-37" data-validate="Select Personnel">
                    <select name="p_id" class="login100-form-btn">
                        <?php while($p1_row = mysqli_fetch_array($all_personnel_result)):;?>
                        <option value="<?php echo $p1_row['id']; ?>"><?php echo             $p1_row['name']." ".$p1_row["surname"] ?></option>
                        <?php endwhile; ?>
                    </select>   
                </div>

                
                <div class="text-left">
						Machine
				</div>
                
                <div class="login100-form-title p-b-37">
                    <select name="m_id" class="login100-form-btn" data-validate="Select Personnel">
                        <?php while($m_row = mysqli_fetch_array($all_machine_result)):;?>
                        <option value="<?php echo $m_row['id']; ?>"><?php echo $m_row['brand']." ".$m_row['name'] ?></option>
                        <?php endwhile; ?>
                    </select>  
                </div>

                
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="update" value="Update Product">
				</div>
             
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="back" value="Back to Menu">
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
        
        if (isset($_POST['back'])) {
            
            header('Location:productOperationUI.php');  
        }
        
        else if (isset($_POST['update'])) {  
        

                
                require_once('mysqli_connect.php');

                $query = "SELECT * FROM mercury.personnel_table WHERE id='".$_POST['p_id']."';";
                $p_response = @mysqli_query($dbc, $query);
                $query = "SELECT * FROM mercury.machine_table WHERE id='".$_POST['m_id']."';";
                $m_response = @mysqli_query($dbc, $query);

                if($p_response and $m_response){

                    
                    require_once('mysqli_connect.php');
                    $cuthb_query = "CALL mercury.UpdateCutHB( ".$_SESSION['product_id']." , ".$_POST['p_id']." , ".$_POST[m_id].") ;";
                    $response = @mysqli_query($dbc, $cuthb_query);
                    echo " p_id: ".$_SESSION['product_id']." , ".$_POST['p_id']." , ".$_POST['m_id'];

                    echo "<p class='success' >Updated </p>";
                    header("Location:updateStripCutHardboard.php");
                    exit;
                }             
            }
        }
?>
     
    
    
</body>
</html>




























