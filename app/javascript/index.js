const dogInput = document.getElementById("dog_input");
const dogForm = document.getElementById("dog_form");

dogForm.addEventListener("submit", (event) => {
  event.preventDefault()

  const dogBreed = dogInput.value;
  getDog(dogBreed)
});

const getDog = (dogBreed) => {
  axios
    .get(`https://api.api-ninjas.com/v1/dogs?name=${dogBreed}`, {
      headers: {
        'X-Api-Key': dogsApiKey
      }
    })
    .then((response) => {
      console.log(response.data[0]);
    })
    .catch((error) => {
      console.error(error);
    });
};
