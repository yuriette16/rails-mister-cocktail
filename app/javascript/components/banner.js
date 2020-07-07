import Typed from 'typed.js';

const options = {
  strings: ['Tropical loko', 'Mojito', 'Gin fizz', 'Rum'],
  attr: 'placeholder',
  typeSpeed: 60,
  loop: true,
};

const typed = new Typed('#search-cocktail', options);

const displayAllCocktails = () => {
  const arrow = document.querySelector(".arrow");
  arrow.addEventListener("click", () => {
    window.scrollTo(0, window.innerHeight-55);
  });
};


export { displayAllCocktails };
