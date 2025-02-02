document.addEventListener("DOMContentLoaded", () => {
	
	
            const postsContainer = document.getElementById('main-content');
            const searchBox = document.getElementById('search-box-wel');

            // Fetch posts
            async function fetchPosts() {
                const response = await fetch('./fetcher/fetch-private.php');
                const posts = await response.json();
                displayPosts(posts);
                setupSearch(posts);
            }

            // Display posts
            function displayPosts(posts) {
                postsContainer.innerHTML = '';
				
                posts.forEach(post => {
                    
					const postDiv = document.createElement('div');
                    postDiv.classList.add('post');
                    postDiv.innerHTML = `
					
						<div class="upper-div">
	
							<div class="prf-img">
								<img class="photo" src="./images/user.png" alt="user" width="30" height="30">
							</div>
			
								<h3 class="prf-name">${post.username}</h3><br>
						</div>
		
						<div class="hashTag-div">
							<h4>${post.title}</h4>
						</div>
					
					
						${
                            post.post_type === 'myImage'
                                ? `<img src="${post.video_path}" alt="${post.title}" width="100%" height="auto">`
                                : `<video width="100%" controls>
                                      <source src="${post.video_path}" type="video/mp4">
                                      Your browser does not support the video tag.
                                   </video>`
						}
                    
						<div class="hits-shower">
							<h4 class="likes">${post.likes} Likes</h4>
							<h4 class="comment">${post.comments} comment</h4>
						</div>
		
						<div class="icon-container">
						${
							post.like_postids.includes(post.post_id)
							? `<div class="icon" style="color:#007bff">
								<i class="fas fa-thumbs-up"></i>
								<span >Like</span>
							
							</div>`
							: `<div class="icon" onclick="likePost(this,'${post.user_id}','${post.post_id}')">
								<i class="fas fa-thumbs-up"></i>
								<span >Like</span>
							
							</div>`
						}
			
							<div class="icon" onclick="addComment('${post.user_id}','${post.post_id}')">
								<i class="fas fa-comment"></i>
								<span>Comment</span>
							</div>
			
							<div class="icon">
								<i class="fas fa-share"></i>
								<span>Share</span>
							</div>
			
						</div>

					`;
					
                    postsContainer.appendChild(postDiv);
                });
				
            }

            // Setup search functionality
            function setupSearch(posts) {
                searchBox.addEventListener('input', () => {
                    const query = searchBox.value.toLowerCase();
                    const filteredPosts = posts.filter(post => post.title.toLowerCase().includes(query));
                    displayPosts(filteredPosts);
                });
            }

			
			
            fetchPosts();
        }
		
	);