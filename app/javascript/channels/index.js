// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import { linkClickSelector } from "@rails/ujs"

const channels = require.context('.', true, /_channel\.js$/);
channels.keys().forEach(channels);

// -----------------------------------------------------------------------------
// SELECTING CARDS LOGICS
// Nota bene: consider replacing w/ specific Stimulus NPM logics

// 0. Define page variables
const targetContainerId = "#card-container"
const targetBlockClass = ".card-product"
const cardsParent = document.querySelector(targetContainerId);
let studentsId = [];

// 1. Add event listener for 'clicks' on container
cardsParent.addEventListener("click", (event) => {
  event.preventDefault();
  // 1.1. define event listener variables
  const cardDiv = event.target.closest(targetBlockClass);
  const studentId = cardDiv.dataset["studentId"];


  // 1.2. retrieve the student ID and add it to the array
  // if card already clicked, then remove it from array
  if (cardDiv.classList.contains("card-clicked")) {
    studentsId = studentsId.filter(value => value !== studentId);
  } else {
    studentsId.push(studentId);
  }

  // 3. toggle CSS class on the card
  cardDiv.classList.toggle("card-clicked");

  // 4. Modify counter in header
  if (studentsId.length > 0) {
    document.querySelector("#counter").innerText = `(${studentsId.length})`;
  } else {
    document.querySelector("#counter").innerText = ``;
  }
})

$.ajax({
  type: 'GET',
  url: '/gigs/new',
  data: {
    'students_id': studentsId
  }
})
