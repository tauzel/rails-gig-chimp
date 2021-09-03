import { linkClickSelector } from "@rails/ujs";

import { initCardSelect } from './cards/card_select';
import { initModalShow } from './cards/card_modal';

const initCardsFeatures = () => {

  // Overall container to listen to
  const cardsParent = document.querySelector(".card-container");

  // Launching event listener
  cardsParent.addEventListener('click', (event) => {
    event.preventDefault();

    // Target card
    const cardDiv = event.target.closest(".card-product");
    console.log(cardDiv)

    // Target card inner link variable
    // --- null if clicked on rest of the card
    const cardInnerLinks = event.target.closest(".card-inner-links");

    if (cardInnerLinks) {
      initModalShow();
    } else {
      initCardSelect(cardDiv);
    }
  })
}


export { initCardsFeatures };
