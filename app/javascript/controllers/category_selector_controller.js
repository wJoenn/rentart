import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-selector"
export default class extends Controller {
  static targets = ["field", "button", "category"]

  fillField(event) {
    const target = event.currentTarget
    const category = target.dataset.name
    this.fieldTarget.value = category

    this.buttonTarget.disabled = false
    this.buttonTarget.classList.remove("btn-disabled")

    this.#borderCategory(target)
  }

  #borderCategory(target) {
    this.categoryTargets.forEach(e => {
      e.classList.remove("selected")
    })

    target.classList.add("selected")
  }
}
