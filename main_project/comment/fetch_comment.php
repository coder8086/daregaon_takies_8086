<?php

include '../db.php';
// Get the raw POST data
$data = file_get_contents("php://input");

// Decode JSON into a PHP array or object
$decodedData = json_decode($data, true);

// Access the data
$name = $decodedData['user'];
$post = $decodedData['post'];

$sql_tbcomment ="SELECT * FROM tbcomment WHERE post_id = '$post'";
$result_tbcomment = $conn->query($sql_tbcomment);
$data = array();

while ($row_tbcomment = $result_tbcomment->fetch_assoc()) {
	$commentor = $row_tbcomment['user_id'];
	
	$sql_commentor = "SELECT * FROM users WHERE user_id='$commentor'";
	$result_tbcommentor = $conn->query($sql_commentor);
	$row_tbcommentor = $result_tbcommentor->fetch_assoc();
	
	$data[] = array(
	"username" => $row_tbcommentor['username'],
	"comment"=> $row_tbcomment['comment']
	);
}

// Do something with the data
echo json_encode($data);

$conn->close();
?>
