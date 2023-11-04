import ApplicationController from 'controllers/application_controller';
import { get } from '@rails/request.js';

export default class extends ApplicationController {
  // eslint-disable-next-line no-use-before-define
  static targets = ['container'];

  async connect() {
    const response = await get('/labels');
    let options = {};

    if (response.ok) {
      const data = await response.json;
      data.forEach(label => (options[label.name] = null ));
    }

    const addChip = (_, labelTag) => {
      const labelName = labelTag.textContent.replace('close', '');
      const container = this.containerTarget;
      const tag = "<input type='hidden' name='post[label_name]' value='" + labelName + "' />";
      container.insertAdjacentHTML('beforeend', tag);
    };

    const deleteChip = () => {
      const container = this.containerTarget;
      const containerParent = container.parentElement.firstElementChild;
      const chipToRemove = document.querySelector('div.chip');
      container.removeChild(container.firstElementChild);
      containerParent.removeChild(chipToRemove);
    };

    var elems = document.querySelectorAll('.chips');
    M.Chips.init(elems, {autocompleteOptions: {
        data: options,
      },
      limit: 1,
      minLength: 1,
      placeholder: 'Enter a Label',
      secondaryPlaceholder: ' ',
      onChipAdd: addChip,
      onChipDelete: deleteChip
    });
  }
}
