import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    const options = {
      strings: ["R", "Rent art", "Rentart^500."],
      typeSpeed: 100,
      backSpeed: 50,
      loop: false,
      showCursor: false
    }

    new Typed(this.element, options)
  }
}
