fetch('../DaregaonTakies 3.0/loginSytm/login.php')
.then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    return response.json();
  })
.then(data => {
	 console.log('Response Data:', data);
					document.getElementById('user').innerHTML=data.msg;
					setTimeout(() => {
            window.location.href = "../index.html"; // Redirect to another page if needed
        }, 1000);
		
			  }
	  ).catch(error => {
					console.error('Error by user:',error);
});

