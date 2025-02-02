<?php 

session_start();
include '../db.php';
$userId = $_SESSION['myUserId'];

$data = file_get_contents("php://input");

// Decode JSON into a PHP array or object
$decodedData = json_decode($data, true);

// Access the data
$name = $decodedData['userId'];
$post = $decodedData['postId'];
$chat = $decodedData['chat'];

$sql = "INSERT INTO tbcomment (user_id,post_id,comment) VALUES (?,?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iis",$userId,$post,$chat);
			

if($stmt->execute()){
// Do something with the data
echo json_encode(['msg'=> 'comment inserted']);
}else{
	echo json_encode(['msg'=>'faild']);
}

$stmt->close();
$conn->close();
?>
