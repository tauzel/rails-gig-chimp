import { linkClickSelector } from "@rails/ujs";

const initCardSelect = (cardDiv) => {
  // -----------------------------------------------------------------------------
  // SELECTING CARDS LOGICS
  // Nota bene: consider replacing w/ specific Stimulus NPM logics

  // 0. Define event variables
  const createBtn = document.querySelector("#create-btn");

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
  // Build url with studentsId
  let urlSuffix = '';
  if (studentsId) {
    studentsId.forEach(id => urlSuffix += `student_id[]=${id}&`);
    // remove ending '&' from url
    urlSuffix = urlSuffix.slice(0, -1);
  }
  // modify url sitting in the create button
  if (createBtn) {
    // if user on Home or Students page, modify url in create btn
    createBtn.href = `/gigs/new?${urlSuffix}`;
  } else {
    // if user on Gigs/New modify current url
    let currentUrl = window.location.href;
    // if current url already has students -- add url suffix with '&'
    if (currentUrl.includes('?') && currentUrl.includes('student_id')) {
      currentUrl += `&${urlSuffix}`
    } else if (currentUrl.includes('?')) {
      currentUrl += urlSuffix
    } else {
      currentUrl += `?${urlSuffix}`
    }
  }

  // 4. Modify counter in header
  if (studentsId.length > 0) {
    document.querySelector("#counter").innerText = `(${studentsId.length})`;
  } else {
    document.querySelector("#counter").innerText = ``;
  }
}

export { initCardSelect };
