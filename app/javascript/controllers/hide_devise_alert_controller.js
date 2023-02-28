import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-devise-alert"
export default class extends Controller {
  connect() {
    if (this.element) {
      this.#showAlert()
      setTimeout(() => {
        this.#hideAlert();
      }, 3000);
    }
  }

  #hideAlert() {
    this.element.style.maxHeight = "0px";
    this.element.style.padding = "0px 20px"
    this.element.style.opacity = "0";
  }

  #showAlert() {
    this.element.style.maxHeight = "80px";
    this.element.style.padding = "20px"
    this.element.style.opacity = "1";
  }
}
