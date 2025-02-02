

document.addEventListener('click', function(event) {
      const searchInput = document.getElementById('search-box');
const webTitle = document.getElementById('website_title');
const leftDiv = document.querySelector('.left-div');
const middleDiv = document.querySelector('.middel-div');
const searchIcon = document.getElementById('searchIcon');

    
    if (event.target.id === 'searchIcon' || event.target.id === 'search-box') {
        webTitle.style.display ='none';
        leftDiv.style.flex='20%';
        middleDiv.style.flex='60%';
        searchInput.style.display='block';
         searchIcon.style.display='none';
        // alert("Found");
          console.log('Special button was clicked!');
      } else {
          webTitle.style.display ='block';
          leftDiv.style.flex='60%';
        middleDiv.style.flex='20%';
       searchInput.style.display='none';
        searchIcon.style.display='block';
       
         // alert("not found");
        console.log('You clicked somewhere else on the page.');
      }
    });

