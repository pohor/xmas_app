document.addEventListener('DOMContentLoaded', function (event) {
  if (document.getElementById('close-alert-flash')) {
    let alertButton = document.getElementById('close-alert-flash');
      alertButton.addEventListener('click',() => {
        alertButton.parentElement.style.display = 'none';
    });
  }
  if (document.getElementById('close-notice-flash')) {
    let noticeButton = document.getElementById('close-notice-flash');
      noticeButton.addEventListener('click',() => {
        noticeButton.parentElement.style.display = 'none';
    });
  }
});
