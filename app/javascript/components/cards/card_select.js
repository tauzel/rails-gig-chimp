import { linkClickSelector } from "@rails/ujs";

const initCardSelect = (cardDiv) => {
  // -----------------------------------------------------------------------------
  // SELECTING CARDS LOGICS
  // Nota bene: consider replacing w/ specific Stimulus NPM logics

  // 0. Define event variables
  const createBtn = document.querySelector("#create-btn");
  const createBtnBaseUrl = '/gigs/new?';

  // 1. toggle CSS class on the card
  // (used to build students array)
  cardDiv.classList.toggle("card-clicked");

  // 2. Build Array of selected students id
  const selectedStudents = document.querySelectorAll(".card-clicked");
  let studentsId = [];
  selectedStudents.forEach((student) => {
    studentsId.push(student.dataset["studentId"]);
  })

  // 3. Update Create Btn's embedded url w/ selected students id
  // rebuild url with studentsId
  let createBtnUrl = createBtnBaseUrl;
  if (studentsId) {
    studentsId.forEach(id => createBtnUrl += `student_id[]=${id}&`);
    // remove ending '&' from url
    createBtnUrl = createBtnUrl.slice(0, -1);
  }
  // modify url sitting in the create button
  createBtn.href = createBtnUrl;

  // 4. Modify counter in header
  if (studentsId.length > 0) {
    document.querySelector("#counter").innerText = `(${studentsId.length})`;
  } else {
    document.querySelector("#counter").innerText = ``;
  }
}

export { initCardSelect };
