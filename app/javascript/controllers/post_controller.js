import ApplicationController from './application_controller'
import { marked } from 'marked';

export default class extends ApplicationController {
  static targets = [ "title", "body", "titlePreview", "bodyPreview" ];

  preview() {
    this.titlePreviewTarget.innerHTML = marked.parse(this.titleTarget.value);
    this.bodyPreviewTarget.innerHTML = marked.parse(this.bodyTarget.value);
  }
}
