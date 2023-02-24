import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "button", "options"]

  connect() {
    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) && (event.target != this.optionsTarget)) {
        this.menuTarget.classList.add('height-0')
      }
    })

    window.addEventListener("keyup", event => {
      if (event.key === "Escape") this.menuTarget.classList.add('height-0')
    })
  }

  toggleMenu() {
    this.menuTarget.classList.toggle('height-0')
  }
}
