setTimeout(function() {
  // This displays the requested image in the background
  let dogImageEl = document.querySelectorAll("#dog_page");
  dogImageEl.forEach(function(element) {
    let imageLink = element.getAttribute("data-image-link");
    element.style.backgroundImage = "url('" + imageLink + "')";
  });

  // This displays the star ratings of the characteristics
  var starRatingElements = document.querySelectorAll(".star-rating");
  starRatingElements.forEach(function(element) {
    var rating = parseInt(element.getAttribute("data-rating"));
    var stars = "★".repeat(rating);
    element.innerHTML = stars;
  });
}, 100);


