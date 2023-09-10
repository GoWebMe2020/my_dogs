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
      console.log(response.data[0])
      const jsonData = response.data[0]

      const dogType = document.getElementById('dog_type').textContent = jsonData.name
      const dogImage = document.getElementById('dog_image').src = jsonData.image_link
      document.getElementById('dog-description').textContent = `
        Good with Children: ${jsonData.good_with_children}
        Good with Other Dogs: ${jsonData.good_with_other_dogs}
        Shedding: ${jsonData.shedding}
        Grooming: ${jsonData.grooming}
        Drooling: ${jsonData.drooling}
        Coat Length: ${jsonData.coat_length}
        Good with Strangers: ${jsonData.good_with_strangers}
        Playfulness: ${jsonData.playfulness}
        Protectiveness: ${jsonData.protectiveness}
        Trainability: ${jsonData.trainability}
        Energy: ${jsonData.energy}
        Barking: ${jsonData.barking}
        Min Life Expectancy: ${jsonData.min_life_expectancy}
        Max Life Expectancy: ${jsonData.max_life_expectancy}
        Max Height Male: ${jsonData.max_height_male} inches
        Max Height Female: ${jsonData.max_height_female} inches
        Max Weight Male: ${jsonData.max_weight_male} pounds
        Max Weight Female: ${jsonData.max_weight_female} pounds
        Min Height Male: ${jsonData.min_height_male} inches
        Min Height Female: ${jsonData.min_height_female} inches
        Min Weight Male: ${jsonData.min_weight_male} pounds
        Min Weight Female: ${jsonData.min_weight_female} pounds
      `;
    })
    .catch((error) => {
      console.error(error);
    });
};
