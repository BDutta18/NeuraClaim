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

$insurance_id = isset($_GET['id']) ? sanitize_input($_GET['id']) : '';

if (empty($insurance_id) || !preg_match('/^INS\d{8}$/', $insurance_id)) {
    echo json_encode(['error' => 'Invalid Insurance ID format. It should be INS followed by 8 digits.']);
    exit;
}

try {
    $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $stmt = $conn->prepare("SELECT * FROM insurance_records WHERE insurance_id = :insurance_id");
    $stmt->bindParam(':insurance_id', $insurance_id);
    $stmt->execute();
    
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($result) {
        echo json_encode($result);
    } else {
        echo json_encode(['error' => 'No insurance record found with the provided ID.']);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => 'Database error. Please try again later.']);
    error_log("Database Error: " . $e->getMessage());
}
?>
