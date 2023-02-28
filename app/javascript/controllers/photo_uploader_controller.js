import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-uploader"
export default class extends Controller {
  static targets = ["files"]

  addFile(event) {
    const originalInput = event.target
    const originalParent = originalInput.parentNode

    this.filesTarget.append(originalInput)

    const newInput = originalInput.cloneNode()

    newInput.value = ""

    originalParent.append(newInput)
  }
}
