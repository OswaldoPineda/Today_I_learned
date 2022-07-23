function initMaterialize() {
  function initDropdown() {
    var dropdown = document.querySelectorAll('.dropdown-trigger');
    M.Dropdown.init(dropdown, {});

  }

  function initFloatingActionButton() {
    var floatingButton = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(floatingButton, {});
  }

  function initSelectInput() {
    var selects = document.querySelectorAll('select');
    M.FormSelect.init(selects, {});
  }


  document.addEventListener('DOMContentLoaded', function() {
    initDropdown();
    initFloatingActionButton();
    initSelectInput();
  });
};

export default initMaterialize;
