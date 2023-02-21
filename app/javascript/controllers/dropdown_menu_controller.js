import { Controller } from "@hotwired/stimulus";
import {enter, leave, toggle} from 'el-transition';

console.log("hello from dropdown controller");

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    // call the enter and leave functions
  }

  toggleMenu() {
    if(this.menuTarget.classList.contains('hidden')) {
        enter(this.menuTarget)
    } else {
        leave(this.menuTarget)
    }
}
}
