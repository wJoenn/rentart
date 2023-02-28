import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-selector"
export default class extends Controller {
  connect() {
    console.log("something else");
  }

  static targets = ["field", "form"]

  fillField(event) {
    const category = event.target.dataset.name
    this.fieldTarget.value = category
    this.formTarget.submit()
  }
}
