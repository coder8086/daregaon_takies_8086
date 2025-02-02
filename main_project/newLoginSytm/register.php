<?php
include '../db.php';

// Get POST data
$user = $_POST['username'];
$email = $_POST['email'];
$pass = $_POST['password'];

// Check if user or email already exists
$sql = "SELECT * FROM users WHERE username=? OR email=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $user, $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo "<script>alert('Username or Email already exists.'); window.location.href='register.html';</script>";
} else {
    // Insert new user
    $sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $user, $email, $pass);
    
    if ($stmt->execute()) {
        echo "<script>alert('Registration successful.'); window.location.href='login.html';</script>";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$stmt->close();
$conn->close();
?>
