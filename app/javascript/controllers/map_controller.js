import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    lat: Number,
    lng: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.lngValue, this.latValue ])
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.lngValue, this.latValue ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 })
  }
}
