  const commentBox = document.getElementById('commentBox');
    const postHolder= document.getElementById('main-content');
  const comment = document.getElementById('show-comment');
const sendButton = document.getElementById('send_btn')
const inputComment =document.getElementById('inputText');
const chatHolder =document.getElementById('chat_seg_holder');


let set_user;
let set_post;

function addComment(user,post){
   set_user=user;
   set_post=post;
   postHolder.style.display="none";
    commentBox.style.display="block";
   
  fetchComment(set_user,post);
   //displayComment(user,post);
}

function closeComment(){

    postHolder.style.display="block";
    commentBox.style.display="none";
    
}
function sendComment(){
	
const str_comment = inputComment.value;
   
   if(!str_comment == ''){
		insertComment(str_comment);
		displayComment(str_comment);
      inputComment.value = '';
	}
}

function insertComment(insert_str){
	
   const data={"userId":set_user,"postId":set_post,"chat":insert_str}
   
   fetch('./comment/insertComment.php',{
   method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
   } )
   .then(response =>{
      
      return response.json();
      
   })
   .then(data =>{
      
      console.log('inserting reply',data);
      
     // displayComment(data.php_user,data.php_post,data.php_chat);
   })
   .catch(error=>{
      console.log(error);
   });
}

function fetchComment(fetchUser,fetchPost){
          // Data to send
            const data = { user:fetchUser, post:fetchPost };

            // Send the data to PHP
            fetch('./comment/fetch_comment.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => {
              return response.json();
               
            })
            .then(data => {
				
				chatHolder.innerHTML='';
				
				data.forEach(phpData => {
					
					const str_show = `
					<h5>${phpData.username}</h5>
					<h6>${phpData.comment}</h6>`;
					
					
				   
				   const chat_str = document.createElement('div');
    chat_str.classList.add('fetched_chat_seg');
   chat_str.innerHTML=`${str_show}`;
   chatHolder.appendChild(chat_str);

					
				});
                
               
            })
            .catch(error => {
                console.error('Error:', error);
            });
        
}

function displayComment(str){
	
    const chat_str = document.createElement('div');
    chat_str.classList.add('chat_seg');
   chat_str.innerHTML=`${str}`;
   chatHolder.appendChild(chat_str);
}
