import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form-price"
export default class extends Controller {
  static values = { price: Number }
  static targets = ["startDate", "endDate", "price", "field", "days"]

  connect() {
    console.log("a");
    console.log(this.priceValue);
  }

  enabledEndDateField() {
    this.endDateTarget.value = ""
    this.endDateTarget.min = new Date(new Date(this.startDateTarget.value).valueOf() + 86400000).toISOString().split('T')[0]
    this.endDateTarget.disabled = false
  }

  updatePrice() {
    const days = Math.floor(((new Date(this.endDateTarget.value)) - (new Date(this.startDateTarget.value))) / 86400000)
    const price = (this.priceValue).toFixed(2)

    this.daysTarget.innerText = ""
    this.fieldTarget.innerText = ""

    if (days * price > 0) {
      this.priceTarget.value = (days * price).toFixed(2)
      this.daysTarget.innerText = days
      this.fieldTarget.innerText = `${(days * price).toFixed(2)}€`
    }
  }
}
