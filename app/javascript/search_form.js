function showSearchForm() {
  const searchForm = document.querySelector('#search_form');
  searchForm.classList.remove('hide_form');
  searchForm.classList.add('display_form');
}

function hideSearchForm() {
  const searchForm = document.querySelector('#search_form');
  searchForm.classList.remove('display_form');
  searchForm.classList.add('hide_form');
}

document.addEventListener('click', function(event) {
  if (event.target.id === 'search_form_btn' || event.target.id === 'search_form_icon') {
    showSearchForm();
  }
});

const closeFormBtn = document.querySelector('#close_form_btn');
closeFormBtn.addEventListener('click', hideSearchForm);
