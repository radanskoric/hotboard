import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "submit-button"

  connect() {
    this.send("connect", {title: this.bridgeElement.title}, () => {
      this.bridgeElement.click()
    })
  }

  disconnect() {
    this.send("disconnect")
  }
}
