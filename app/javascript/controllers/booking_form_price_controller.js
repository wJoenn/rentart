import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form-price"
export default class extends Controller {
  connect() {
    console.log("h");
  }

  static targets = ["startDate", "endDate", "price", "field", "days"]

  enabledEndDateField() {
    this.endDateTarget.min = new Date(new Date(this.startDateTarget.value).valueOf() + 86400000).toISOString().split('T')[0]
    console.log(new Date(new Date(this.startDateTarget.value).valueOf() + 86400000).toISOString().split('T')[0]);
    this.endDateTarget.disabled = false
    console.log(this.endDateTarget);
  }

  updatePrice() {
    const days = Math.floor(((new Date(this.endDateTarget.value)) - (new Date(this.startDateTarget.value))) / 86400000)
    const price = (+this.priceTarget.value).toFixed(2)

    console.log(days);
    this.daysTarget.innerText = ""
    this.fieldTarget.innerText = ""

    if (days * price > 0) {
      this.daysTarget.innerText = days
      this.fieldTarget.innerText = `${(days * price).toFixed(2)}€`
    }
  }
}
