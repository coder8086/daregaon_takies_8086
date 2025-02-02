<?php
// Database configuration
session_start();
include '../db.php';

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $image = $_FILES['image'];
	$myimages = $_POST['typeImage'];
	$user_id=$_SESSION['myUserId'];
	
    // Validate file
    if ($image['error'] === 0) {
        $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (in_array($image['type'], $allowedTypes)) {
            $uploadDir = '../uploadedImages/';
            $fileName = uniqid() . '_' . basename($image['name']);
            $filePath = $uploadDir . $fileName;
			
			//get user_id 
			
			$idSql = "SELECT user_id FROM users WHERE username ='$user'";
			$result = $conn->query($idSql);
			
			if($result->num_rows > 0){
				
				$row = $result->fetch_assoc();
				$user_id=$row["user_id"];
				
			}else{}
			

            // Move uploaded file to server directory
            if (move_uploaded_file($image['tmp_name'], $filePath)) {
                // Insert image metadata into database
				
                $sql = "INSERT INTO post (user_id,title, video_path, post_type) VALUES (?, ?,?,?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("isss",$user_id, $title, $filePath, $myimages);

                if ($stmt->execute()) {
                    echo "Image uploaded successfully!";
                } else {
                    echo "Failed to save image metadata: " . $conn->error;
                }
                $stmt->close();
            } else {
                echo "Failed to move uploaded file.";
            }
        } else {
            echo "Invalid file type. Please upload a JPG, PNG, or GIF image.";
        }
    } else {
        echo "Error uploading file.";
    }
}

$conn->close();
?>
