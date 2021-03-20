<?php

    $randomSeed=rand(100000,999999);
    $randomSeedStr = str_split($randomSeed);

    $plusRandom = $randomSeedStr[0]+$randomSeedStr[1]+$randomSeedStr[2]+$randomSeedStr[3]+$randomSeedStr[4]+$randomSeedStr[5];

    $jcode ="J".$randomSeed."".$plusRandom; 

    require_once('mysqli_connect.php');
    $create_query = "CALL mercury.CreateNewCouch('".$jcode."');";
    mysqli_query($dbc, $create_query);
    exit;
    
?>

    
