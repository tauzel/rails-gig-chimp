import { linkClickSelector } from "@rails/ujs";

const initModalShow = () => {

  const modalTitle = document.querySelector(".modal-title");
  const modalBody = document.querySelector(".modal-body");
  console.log(document)
  console.log(modalBody)

  // TODO -- convert to ES6 w/ Rails-Ajax lecture guidelines
  $('#cardModalStudentShow').on('show.bs.modal', function (event) {
    // NOTA BENE: Bootstrap modal uses ES5 syntax
    const button = $(event.relatedTarget) // Button that triggered the modal
    const studentId = button.data('studentId') // Extract info from data-* attributes
    const urlStudentShow = `students/${studentId}` // Build url w/ data-attributes
    // Extract students/:id inner HTML w/ Ajax
    $.ajax({
        url: urlStudentShow,
        dataType: "html",
        success: function(data) {
          // hack from https://stackoverflow.com/questions/18938180/how-to-get-the-html-of-a-div-on-another-page-with-jquery-ajax/18938994
          modalBody.innerHTML = $(data).find('.js-student-body')[0].innerHTML;
          modalTitle.innerText = $(data).find('.title')[0].innerText
        },
        error: function(e) {
          alert('Error: ' + e);
        }
    });
  });
};

export { initModalShow };
