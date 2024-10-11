import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["draggable", "dropzone"]

  dropzoneTargetConnected(element) {
    element.addEventListener("dragover", (event) => event.preventDefault())
    element.addEventListener("drop", this.drop)
  }

  start(event) {
    // We store the url to which we'll have to submit the state change.
    event.dataTransfer.setData(
      "changeStateUrl",
      event.currentTarget.dataset.changeStateUrl
    )
  }

  drop = (event) => {
    event.preventDefault()
    // We get the url back out.
    const changeStateUrl = event.dataTransfer.getData("changeStateUrl")
    // And extract the new state from the drop target.
    const state = event.currentTarget.dataset.ticketState

    // Create an invisible turbo-powered link
    const link = document.createElement('a')
    link.setAttribute('href', `${changeStateUrl}?state=${state}`)
    link.setAttribute('data-turbo-method', 'post')
    link.style.display = 'none'
    document.body.appendChild(link)

    // Click the link and remove it from the DOM
    link.click()
    link.remove()
  }
}
