<html lang="en">
<head>
	<title>Update Product</title>
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
				

                

                <span class="login100-form-title p-b-37">
                <?php if($_SESSION["jcode"] != null and $_SESSION["new"] == 1){ echo "New product jcode: ".$_SESSION['jcode']."<br>"; } ?>Update Product
                </span>
                
                <div class="wrap-input100 validate-input m-b-20" >
					<input  type="text" name="jcode" placeholder="Jcode">
                    
					<span class="focus-input100"></span>
				</div>

                
				<div class="wrap-input100 validate-input m-b-25">
					<input type="submit" class="login100-form-btn" name="updateproduct" value="Update Product">
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
            $_SESSION["jcode"]=null;
            $_SESSION["new"]=null;

        }
        
        else if (isset($_POST["updateproduct"])) {  
        

            require_once('mysqli_connect.php');
            
            $_query = "CALL mercury.SelectJCode('".$_POST['jcode']."');"; 
            $_response = mysqli_query($dbc, $_query);
            $_row = mysqli_fetch_array($_response);

            
            if($_response){    
                $_SESSION["jcode"]=  $_POST["jcode"];

                session_start();
                $_SESSION["product_id"] = $_row["id"];

                if($_row['cut_fabric_id']=="1"){

                    header("Location:updateCutFabric.php");
                }
                else if($_row['sew_fabric_id']=="1"){

                     header("Location:updateSewFabric.php");
                }
                else if($_row['quilt_fabric_id']=="1"){

                     header("Location:updateQuiltFabric.php");
                }
                else if($_row['cut_hb_id']=="1"){

                     header("Location:updateCutHardboard.php");
                }
                else if($_row['strip_cut_hb_id']=="1"){

                     header("Location:updateStripCutHardboard.php");
                }
                else if($_row['l_cut_hb_id']=="1"){

                     header("Location:updateLCutHardboard.php");
                }
                else if($_row['drill_hb_id']=="1"){

                     header("Location:updateDrillHardboard.php");
                }
                else if($_row['casing_id']=="1"){

                     header("Location:updateCasing.php");
                }
                else if($_row['frame_cut_id']=="1"){

                     header("Location:updateFrameCut.php");
                }
                else if($_row['rubber_pile_id']=="1"){

                     header("Location:updateRubberPile.php");
                }
                else if($_row['whitening_sponge_id']=="1"){

                     header("Location:updateWhiteningSponge.php");
                }
                else if($_row['wrapping_cb_id']=="1"){

                     header("Location:updateWrappingCardboard.php");
                }    
                else if($_row['dressing_fabric_id']=="1"){

                     header("Location:updateDressingFabric.php");
                }                                                                                        
                else if($_row['furnish_fabric_id']=="1"){

                     header("Location:updateFurnishFabric.php");
                }            
                else if($_row['package_id']=="1"){

                     header("Location:updatePackage.php");
                }            
            }
        }
    }
?>
        

</body>
</html>






































    




















    
