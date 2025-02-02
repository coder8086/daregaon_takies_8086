	function likePost(elem,userid,postid){

			const audio = document.getElementById('sound');
					audio.play();

				elem.style.color="#007bff";
			
		

		let user = { "user":userid,"postData":postid }

		fetch("/likes/likes.php", {
			"method": "POST",
			"headers": {
				"Content-Type":"application/json; charset=utf-8"
			},
			"body": JSON.stringify(user)
		}).then(res => {


			return res.text();
		}).then(data => {

			console.log(data);
	
			
			
		})
		
		elem.removeAttribute('onclick');
	}