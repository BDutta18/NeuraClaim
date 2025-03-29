<?php

$db_host = 'localhost';
$db_user = 'root'; 
$db_pass = ''; 

try {
    
    $conn = new PDO("mysql:host=$db_host", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    
    $sql = file_get_contents('setup_database.sql');
    
    
    $conn->exec($sql);
    
    echo "Database setup completed successfully!";
} catch (PDOException $e) {
    echo "Database setup failed: " . $e->getMessage();
}
?>
