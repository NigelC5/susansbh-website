<?php
session_start();
include('./db_connect.php');

if ($_POST['action'] == 'login') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // Query to check login credentials
    $query = $conn->prepare("SELECT id, password FROM users WHERE email = ?");
    $query->bind_param('s', $username);
    $query->execute();
    $result = $query->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['password'])) {
            $_SESSION['login_id'] = $user['id']; // Store the login id in the session
            echo 1; // Login successful
        } else {
            echo 0; // Incorrect password
        }
    } else {
        echo 0; // No user found
    }
}
?>
