import { linkClickSelector } from "@rails/ujs";

const initCardSelect = () => {
  // -----------------------------------------------------------------------------
  // SELECTING CARDS LOGICS
  // Nota bene: consider replacing w/ specific Stimulus NPM logics

  // 0. Define page variables
  const cardsParent = document.querySelector("#card-container");
  const createBtn = document.querySelector("#create-btn");
  const targetBlockClass = ".card-product"
  let studentsId = [];
  const createBtnBaseUrl = '/gigs/new?';

  // 1. Add event listener for 'clicks' on container
  cardsParent.addEventListener("click", (event) => {
    event.preventDefault();
    // 2. define event listener variables
    const cardDiv = event.target.closest(targetBlockClass);
    const studentId = cardDiv.dataset["studentId"];


    // 3. retrieve the student ID and add it to the array
    // if card already clicked, then remove it from array
    if (cardDiv.classList.contains("card-clicked")) {
      studentsId = studentsId.filter(value => value !== studentId);
    } else {
      studentsId.push(studentId);
    }

    // 4. Update Create Btn's embedded url w/ selected students id
    // rebuild url with studentsId
    let createBtnUrl = createBtnBaseUrl;
    if (studentsId) {
      studentsId.forEach(id => createBtnUrl += `student_id[]=${id}&`);
      // remove ending '&' from url
      createBtnUrl = createBtnUrl.slice(0, -1);
    }
    // modify url sitting in create button
    createBtn.href = createBtnUrl;

    console.log(createBtnUrl);
    console.log(createBtn);

    // 5. toggle CSS class on the card
    cardDiv.classList.toggle("card-clicked");

    // 6. Modify counter in header
    if (studentsId.length > 0) {
      document.querySelector("#counter").innerText = `(${studentsId.length})`;
    } else {
      document.querySelector("#counter").innerText = ``;
    }
  })
}

export { initCardSelect };
