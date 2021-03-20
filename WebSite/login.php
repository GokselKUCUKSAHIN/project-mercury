<html lang="en">
<head>
	<title>Login</title>
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
    <body >

    
    <?php

    session_start();
    $_SESSION["user"] = 0;
    $_SESSION["jcode"]= null;
    
    if(isset($_POST['logout'])){
        $_SESSION["user"] = 0;
    }
    
    ?>


    <!--
	<div class="container-login100" style="background-image: url('images/bg-04.png');">
    -->
	<div class="container-login100" >
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				<span class="login100-form-title p-b-37">
					Web User Sign In
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter username ">
					<input class="input100" type="text" name="username" placeholder="Username">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<input class="input100" type="password" name="password" placeholder="Password">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<input type="submit" class="login100-form-btn" name="login" value="Login">
                </div>

                
				<div class="text-center p-t-57 p-b-20">
					<span class="txt1">
						Not a member?
					</span>
				</div>
                

                
                <!--
				<div class="flex-c p-b-112">
					<a href="#" class="login100-social-item">
						<i class="fa fa-facebook-f"></i>
					</a>

					<a href="#" class="login100-social-item">
						<img src="images/icons/icon-google.png" alt="GOOGLE">
					</a>
				</div>
                -->

				<div class="text-center">
					<a href="createAccountUI.php" class="txt2 hov1">
						Sign Up
					</a>
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

        if (isset($_POST['login'])) {
            $_SESSION["new"] = 0;

            //username empty control and if its not putting it in a var
            if(empty($_POST['username'])){
                 exit;
            }else{
                $username = $_POST['username'];
            }


            //password empty control and if its not putting it in a var
            if(empty($_POST['password'])){
                 exit;
            }else{
                $user_password = $_POST['password'];

            }

        
            require_once('mysqli_connect.php');
            

            $username_query = "SELECT * FROM web_user_table WHERE username = '".$_POST['username']."';";
            $username_response = @mysqli_query($dbc, $username_query);


            //$password_query = "CALL CheckWebPassword('".$_POST['username']."','".$_POST['password']."');";
            //$password_response = @mysqli_query($dbc, $password_query);
            
            $password_query = "SELECT * FROM web_user_table WHERE username='".$_POST['username']."' and password = '".$_POST['password']."' ;";

            $password_response = @mysqli_query($dbc, $password_query);            
            $p_row = mysqli_fetch_array($password_response);
            
            
            //if result is not null goes to product operation UI
            if($p_row["password"]==$_POST["password"] )
            {
                $row = mysqli_fetch_array($username_response);
                
                if($row['username'] == $_POST['username']){
                    
                    header("Location:productOperationUI.php");
                    $_SESSION["user"] = 1;
                
                }else
                {

                    //echo "Invalid account!!";
                    exit;
                }
                
            }else
            {

                //echo "Invalid account!!";
                exit;
            }
            
        
        }
    ?>
    
</body>
</html>