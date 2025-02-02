<?php
// Database connection settings
include '../db.php';

// Fetch data from orders table
$sql_users = "SELECT * FROM users";
$result_users = $conn->query($sql_users);

// Fetch data from customers table
$sql_post = "SELECT * FROM post ORDER BY post_id DESC";
$result_post = $conn->query($sql_post);

// Fetch data from products table
$sql_tblikes = "SELECT * FROM tblikes";
$result_tblikes = $conn->query($sql_tblikes);

// Combine data from all tables
$data = array();

while ($row_post = $result_post->fetch_assoc()) {
    $user_id = $row_post['user_id'];
    $post_id = $row_post['post_id'];

    // Fetch customer data
    $sql_users = "SELECT * FROM users WHERE user_id = '$user_id'";
    $result_users = $conn->query($sql_users);
    $row_users = $result_users->fetch_assoc();
	
	

    // Fetch product data
    $sql_tblikes = "SELECT COUNT(user_likes) AS num_likes FROM tblikes WHERE post_id = '$post_id'";
    $result_tblikes = $conn->query($sql_tblikes);
    $row_tblikes = $result_tblikes->fetch_assoc();
	
	//like by user
	$sql_userlike = "SELECT COUNT(user_likes) AS user_likes FROM tblikes WHERE user_id = '$user_id'";
    $result_userlike = $conn->query($sql_userlike);
    $row_userlike = $result_userlike->fetch_assoc();

    //comment by user
	$sql_comment = "SELECT COUNT(comment) AS user_comment FROM tbcomment WHERE post_id = '$post_id'";
    $result_comment = $conn->query($sql_comment);
    $row_comment = $result_comment->fetch_assoc();

    
    // Combine data
    $data[] = array(
		'user_id' => $row_users['user_id'],
		'post_id' => $row_post['post_id'],
        'username' => $row_users['username'],
        'title' => $row_post['title'],
        'video_path' => $row_post['video_path'],
		'post_type' => $row_post['post_type'],
        'likes' => $row_tblikes['num_likes'],
		     'comments'=> $row_comment['user_comment']
    );
}

// Convert data to JSON
$json_data = json_encode($data,JSON_PRETTY_PRINT);

// Output JSON data
echo $json_data;

// Close database connection
$conn->close();

error_reporting(0);
?>