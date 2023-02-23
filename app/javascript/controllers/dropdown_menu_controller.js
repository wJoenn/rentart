import { Controller } from "@hotwired/stimulus";

<<<<<<< HEAD
=======
console.log("Hello again")

>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
export default class extends Controller {
  static targets = ["menu", "button", "options"]

  connect() {
<<<<<<< HEAD

    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) || (event.target != this.optionsTarget )) {
        this.menuTarget.classList.add('hidden');
      }
    })
=======
    console.log("hello from clicking anywhere")
    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) && (event.target != this.optionsTarget)) {
        this.menuTarget.classList.add('hidden')
      }
    })
    window.addEventListener("keyup", event => {
      if (event.key === "Escape") this.menuTarget.classList.add('hidden')
    })
>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
  }

  toggleMenu() {
    this.menuTarget.classList.toggle('hidden')
<<<<<<< HEAD
=======
    console.log("hi")
>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
  }
}
