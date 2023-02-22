import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    var options = {
      strings: ["Rentart."],
      typeSpeed: 800,
      backSpeed: 200,
      loop: true
    }

    var typed = new Typed(this.element, options);
  }
}
