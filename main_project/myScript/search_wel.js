document.addEventListener('click', function(wel){
    const searchIcon2 = document.getElementById('searchIcon-wel');
const searchInput2 = document.getElementById('search-box-wel');
const webTitle2 = document.getElementById('website_title_wel');
const leftDiv2 = document.querySelector('.left-div');
const middleDiv2 = document.querySelector('.middel-div');

    
   // alert("Hi");
    if(wel.target.id === 'searchIcon-wel' || wel.target.id ==='search-box-wel'){
        
       // alert("ok");
        searchIcon2.style.display='none';
        searchInput2.style.display ='block';
        webTitle2.style.display='none';
        leftDiv2.style.flex='20%';
        middleDiv2.style.flex='60%';
    }else{
        searchIcon2.style.display='block';
        searchInput2.style.display ='none';
        webTitle2.style.display='block';
        leftDiv2.style.flex='60%';
        middleDiv2.style.flex='20%';
    }
   
});