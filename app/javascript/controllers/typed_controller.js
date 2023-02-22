import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    console.log("hello")
    var options = {
      strings: ["Rent art.", "Rentart."],
      typeSpeed: 500,
      backSpeed: 200,
      loop: false
    }

    var typed = new Typed(this.element, options);
  }
}
