<?php
// Database connection
session_start();
include '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $video = $_FILES['video'];
    $fileType = $_POST['postType'];
    	$userId=$_SESSION['myUserId'];
	
    // File upload path
    $uploadDir = "../uploadedVideo/";
    $filePath = $uploadDir . basename($video['name']);

    // Move uploaded file
    if (move_uploaded_file($video['tmp_name'], $filePath)) {
        // Save file info to database
        $stmt = $conn->prepare("INSERT INTO post (user_id,title,video_path,post_type) VALUES (?,?,?, ?)");
        $stmt->bind_param("isss", $userId,$title, $filePath,$fileType);

        if ($stmt->execute()) {
            echo "File uploaded and data saved successfully.";
        } else {
            echo "Database error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Error uploading file.";
    }
}

$conn->close();
?>