<?php 
	session_start();

	include '../db.php';
	

	if(isset($_POST)){
	
		$data = file_get_contents("php://input");

		$user = json_decode($data,true);

	
	

		$userId = $_SESSION['myUserId'];
		$postId = $user["postData"];
		$myLike = 1;
	
		$sql = "SELECT * FROM tblikes WHERE user_id=? AND post_id=?";
		$stmt = $conn->prepare($sql);
		$stmt->bind_param("ii", $userId, $postId);
		$stmt->execute();
		$result = $stmt->get_result();

		if ($result->num_rows > 0) {
			
			echo "Single like only";
			
		}else{
	
			$sql = "INSERT INTO tblikes (post_id,user_id,user_likes) VALUES (?,?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iii",$postId,$userId,$myLike);

                if ($stmt->execute()) {
					echo $postId;
					echo $userId;
					echo $myLike;
					echo "like insreted sucssesful";
                    //echo json_encode(['result' => 'sucsses']);
                } else {
					//echo json_encode(['result' => 'fail']);
                    echo "Failed to save image metadata: " . $conn->error;
                }
                $stmt->close();
		}

	}

	?>