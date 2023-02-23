import { Controller } from "@hotwired/stimulus";

<<<<<<< HEAD
<<<<<<< HEAD
=======
console.log("Hello again")

>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
=======
>>>>>>> 7af607946f3184a559de502b89321545a1e0700d
export default class extends Controller {
  static targets = ["menu", "button", "options"]

  connect() {
<<<<<<< HEAD
<<<<<<< HEAD

    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) || (event.target != this.optionsTarget )) {
        this.menuTarget.classList.add('hidden');
      }
    })
=======
    console.log("hello from clicking anywhere")
=======
>>>>>>> 7af607946f3184a559de502b89321545a1e0700d
    window.addEventListener("click", event => {
      if ((event.target != this.buttonTarget) && (event.target != this.optionsTarget)) {
        this.menuTarget.classList.add('hidden')
      }
    })
    window.addEventListener("keyup", event => {
      if (event.key === "Escape") this.menuTarget.classList.add('hidden')
    })
<<<<<<< HEAD
>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
=======
>>>>>>> 7af607946f3184a559de502b89321545a1e0700d
  }

  toggleMenu() {
    this.menuTarget.classList.toggle('hidden')
<<<<<<< HEAD
<<<<<<< HEAD
=======
    console.log("hi")
>>>>>>> 73d72e66e9395bed939441340a36914af9b7a32d
=======
>>>>>>> 7af607946f3184a559de502b89321545a1e0700d
  }
}
