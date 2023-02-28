import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["address", "map"]

  connect() {
    console.log("z")
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })

    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => {
      this.#setInputValue(event)
      this.#fetchCoords(event)
      this.mapTarget.remove()
    })
    this.geocoder.on("clear", () => this.#clearInputValue())

    // this.#addMap()
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #fetchCoords(event) {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${event.result["place_name"]}.json?access_token=${this.apiKeyValue}`
    fetch(url)
      .then(res => res.json())
      .then(data => this.#addMap(data.features[0].center))
  }


  #addMap(coords) {
    const html = `<div style="width: 100%; height: 800px; transform: scale(1.1); margin-top: -30px; border-radius: 20px; z-index: -10;"
    data-controller="map"
    data-map-lat-value="${coords[1]}"
    data-map-lng-value="${coords[0]}"
    data-map-api-key-value="${this.apiKeyValue}"
    data-address-autocomplete-target="map"></div>`
    this.addressTarget.insertAdjacentHTML("afterend", html);
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
