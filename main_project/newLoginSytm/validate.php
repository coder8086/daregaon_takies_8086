<?php
session_start();
include '../db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password']; // Basic hashing, use better methods like bcrypt for production.

    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
		$_SESSION['user']=$username;
    			//Getting user id
	$sql_private = "SELECT user_id FROM users WHERE username='$username'";
	$result_private = $conn->query($sql_private);
	$row_private = $result_private->fetch_assoc();
	$user_private = $row_private['user_id'];
	$_SESSION['myUserId']=$user_private;
		
        echo json_encode(['mystatus' => 'success', 'message' => 'Login successful']);
    } else {
        echo json_encode(['mystatus' => 'error', 'message' => 'Invalid credentials']);
    }
    $conn->close();
}
?>
