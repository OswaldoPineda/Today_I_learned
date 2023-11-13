// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "clipboard";
import "controllers";
import "trix"
import "@rails/actiontext"


import ClipboardJS from 'clipboard';
var copyButtons = document.querySelectorAll('[id="copyPathButton"]');

copyButtons.forEach(function(copyButton) {
  var clipboard = new ClipboardJS(copyButton);

  clipboard.on('success', function(e) {
    var cardContainer = e.trigger.closest('.card-container');
    showAlert('Post URL copied to clipboard!', cardContainer);
    e.clearSelection();
  });

  clipboard.on('error', function(e) {
    showAlert('Error copying path to clipboard. Please try again.');
  });

  copyButton.addEventListener('click', function(event) {
    event.preventDefault();
  });
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
