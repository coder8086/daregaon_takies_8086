fetch('./newLoginSytm/user.php')
.then(res => {
	
	
	return res.json();
	
	})
.then(data => {
	         const str = `${data.username}`;
	        const user = str.toString().substring(0,2).toUpperCase();
	      const myuser = document.getElementById('username_id');
	myuser.textContent = user;
	
	
})
.catch(error => {
	
	
	console.log("Error msg:",error);
	});
	
	