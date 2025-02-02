function likePost(myLikes){
 // Select all elements with the class 'clickable'
    const clickableElements = document.querySelectorAll('.likes');

    // Add an onclick event listener to each element
    clickableElements.forEach((element, index) => {
      element.addEventListener('click', () => {
        alert(`You clicked on element ${index + 1}!`);
      });
    });
}