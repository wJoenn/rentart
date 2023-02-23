import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {

    const options = {
      strings: ["Rent art", "Rentart."],
      typeSpeed: 500,
      backSpeed: 200,
      loop: false
    }

    const typed = new Typed(this.element, options);
  }
}
