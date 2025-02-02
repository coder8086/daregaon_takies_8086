<?php
include 'db.php';

// Fetch posts
$sql = "SELECT users.username,
				post.title,post.video_path,post.post_type ,
				users.user_id,
				post.post_id,
				SUM(tblikes.user_likes)

		FROM users 
		INNER JOIN post ON users.user_id=post.user_id
		";

//$sql = "SELECT user, title, video_path, post_type FROM post";

$result = $conn->query($sql);

$posts = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $posts[] = $row;
    }
}


// Return JSON response
header('Content-Type: application/json');
echo json_encode($posts);

$conn->close();
?>
