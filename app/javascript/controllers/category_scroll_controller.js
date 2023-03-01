import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-scroll"
export default class extends Controller {
  static targets = ["cards"]

  scrollLeft() {
    this.cardsTargets[0].scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' })
  }

  scrollRight() {
    this.cardsTargets[this.cardsTargets.length - 1].scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' })
  }
}
