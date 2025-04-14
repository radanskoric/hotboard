import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "cancel-button"

  connect() {
    this.send("connect", {title: this.bridgeElement.title})
  }

  disconnect() {
    this.send("disconnect")
  }
}
