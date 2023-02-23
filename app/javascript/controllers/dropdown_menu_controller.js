import { Controller } from "@hotwired/stimulus";

console.log("Hello again")

export default class extends Controller {
  static targets = ["menu", "button", "options"]

  connect() {
    console.log("hello from clicking anywhere")
    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) && (event.target != this.optionsTarget)) {
        this.menuTarget.classList.add('hidden')
      }
    })
    window.addEventListener("keyup", event => {
      if (event.key === "Escape") this.menuTarget.classList.add('hidden')
    })
  }

  toggleMenu() {
    this.menuTarget.classList.toggle('hidden')
    console.log("hi")
  }
}
