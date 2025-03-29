<?php

header('Content-Type: application/json');


session_start();


if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    echo json_encode([
        'loggedIn' => true,
        'user' => [
            'id' => $_SESSION['user_id'],
            'email' => $_SESSION['user_email']
        ]
    ]);
} else {
    echo json_encode(['loggedIn' => false]);
}
?>

