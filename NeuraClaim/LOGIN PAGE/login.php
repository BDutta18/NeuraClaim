<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');


$db_host = 'localhost';
$db_user = 'root';
$db_pass = ''; 
$db_name = 'insurance_db';

function sanitize_input($data) {
    return htmlspecialchars(strip_tags(trim($data)));
}


$email = isset($_POST['email']) ? sanitize_input($_POST['email']) : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';


if (empty($email) || empty($password)) {
    echo json_encode(['success' => false, 'message' => 'Email and password are required']);
    exit;
}

try {
    
    $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
   
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = :email LIMIT 1");
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user) {
        
        if ($password === $user['password']) {
          
            session_start();
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_email'] = $user['email'];
       
            echo json_encode([
                'success' => true, 
                'message' => 'Login successful',
                'redirect' => ''
            ]);
        } else {
         
            echo json_encode(['success' => false, 'message' => 'Invalid email or password']);
        }
    } else {
      
        echo json_encode(['success' => false, 'message' => 'Invalid email or password']);
    }
} catch (PDOException $e) {
   
    echo json_encode(['success' => false, 'message' => 'Login failed. Please try again later.']);
    error_log("Login Error: " . $e->getMessage());
}
?>

