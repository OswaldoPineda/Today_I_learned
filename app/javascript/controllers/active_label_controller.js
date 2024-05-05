import ApplicationController from 'controllers/application_controller';

export default class extends ApplicationController {
  connect() {
    this.updateActiveClass()
  }

  updateActiveClass() {
    const id = location.search.split('=')[1]
    const element = document.getElementById(id)
    const elementToUpdate = element !== null ? element : document.getElementById('default');
    
    elementToUpdate.classList.replace('badge-secondary', 'badge-main');
  }
}
