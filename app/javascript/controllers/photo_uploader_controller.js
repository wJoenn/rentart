import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-uploader"
export default class extends Controller {
  static targets = ["files", "subfiles"]

  connect() {
    const children = [...this.filesTarget.children]
    this.first = children.find(e => e.classList.contains("selected-file"))
  }

  addFile(event) {
    const originalInput = event.target
    const originalParent = originalInput.parentNode
    const files = [...originalInput.files]

    files.forEach(file => this.#showPicture(file, originalInput))

    const newInput = originalInput.cloneNode()
    newInput.value = ""
    originalParent.append(newInput)
  }

  #showPicture(file, originalInput) {
    const url = URL.createObjectURL(file)
    const selectedFile = document.createElement("div")
    selectedFile.className = "selected-file"
    selectedFile.style.cssText = `background-image: url(${url});`
    selectedFile.append(originalInput)

    if (this.first != false) {
      this.filesTarget.insertBefore(selectedFile, this.subfilesTarget)
      this.first = false
    } else {
      this.subfilesTarget.append(selectedFile)
    }
  }
}
