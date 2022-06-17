function initMaterialize() {
  function initDropdown() {
    var dropdown = document.querySelectorAll('.dropdown-trigger');
    M.Dropdown.init(dropdown, {});

  }

  function initFloatingActionButton() {
    var floatingButton = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(floatingButton, {});
  }


  document.addEventListener('DOMContentLoaded', function() {
    initDropdown();
    initFloatingActionButton();
  });
};

export default initMaterialize;
