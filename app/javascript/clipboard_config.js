import ClipboardJS from 'clipboard';

document.addEventListener('DOMContentLoaded', function() {
  var clipboard = new ClipboardJS('#copyPathButton');

  clipboard.on('success', function(e) {
    var cardContainer = e.trigger.closest('.card-container');
    showAlert('Post URL copied to clipboard!', cardContainer);
    e.clearSelection();
  });

  clipboard.on('error', function(e) {
    showAlert('error', 'Error copying path to clipboard. Please try again.');
  });

  function showAlert(message, container) {
    var alertDiv = document.createElement('div');
    alertDiv.textContent = message;
    alertDiv.classList.add('alert-clipboard');

    container.appendChild(alertDiv);

    setTimeout(function() {
      alertDiv.remove();
    }, 2000);
  }

  document.getElementById('copyPathButton').addEventListener('click', function(event) {
    event.preventDefault();
  });
});
