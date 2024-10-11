import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["draggable", "dropzone"]

  dropzoneTargetConnected(element) {
    element.addEventListener("dragover", (event) => event.preventDefault())
    element.addEventListener("drop", this.drop)
  }

  start(_event) {
    console.log("Started dragging")
  }

  drop = () => {
    console.log("DROPPED") // We'll implement this later.
  }
}
