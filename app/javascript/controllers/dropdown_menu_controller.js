import { Controller } from "@hotwired/stimulus";
import {enter, leave, toggle} from 'el-transition';

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
  }

  toggleMenu() {
    if(this.menuTarget.classList.contains('hidden')) {
      enter(this.menuTarget)
    } else {
      leave(this.menuTarget)
    }
  }
}
