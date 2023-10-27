import ApplicationController from 'controllers/application_controller';

export default class extends ApplicationController {
  connect() {
    this.initDropdown();
    this.initFloatingActionButton();
    this.initSelectInput();
  }

  initDropdown() {
    var dropdown = document.querySelectorAll('.dropdown-trigger');
    M.Dropdown.init(dropdown, {});

  }

  initFloatingActionButton() {
    var floatingButton = document.querySelectorAll('.fixed-action-btn');
    M.FloatingActionButton.init(floatingButton, {});
  }

  initSelectInput() {
    var selects = document.querySelectorAll('select');
    M.FormSelect.init(selects, {});
  }
}
