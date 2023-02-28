import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-map"
export default class extends Controller {
  connect() {
    console.log("b")
    this.fieldTarget.addEventListener("change", e => {
      console.log(e.target);
    })
    // fetch("https://api.mapbox.com/geocoding/v5/{endpoint}/{search_text}.json")
  }

  static targets = ["field"]

  updateMap(event) {
    console.log("hey");
    console.log(event.currentTarget.value)
  }
}
