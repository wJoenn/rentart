import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-uploader"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
  // filesTarget is going to contain the list of input elements we've added
  // files to - in other words, these are the input elements that we're going
  // to submit.
  static targets = ["files"]

  addFile(event) {
    // Grab some references for later
    const originalInput = event.target
    const originalParent = originalInput.parentNode

    // Move the input element that we've added files to, to the list of
    // selected elements
    this.filesTarget.append(originalInput)

    // Create a new blank, input field to use going forward
    const newInput = originalInput.cloneNode()

    // Clear the filelist - some browsers maintain the filelist when cloning,
    // others don't
    newInput.value = ""

    // Add it to the DOM where the original input was
    originalParent.append(newInput)
  }
}
