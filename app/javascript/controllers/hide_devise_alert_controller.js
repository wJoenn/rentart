import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-devise-alert"
export default class extends Controller {
  static targets = ["alert"];

  connect() {
    if (this.element) {
      setTimeout(() => {
        this.hideAlert();
      }, 3000);
    }
  }

  hideAlert() {
    this.element.style.display = "none";
  }
}
