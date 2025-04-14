package com.masterhotwire.hotboard.components

import android.util.Log
import dev.hotwire.core.bridge.BridgeComponent
import dev.hotwire.core.bridge.BridgeDelegate
import dev.hotwire.core.bridge.Message
import dev.hotwire.navigation.destinations.HotwireDestination

class CancelButtonComponent(
    name: String,
    private val bridgeDelegate: BridgeDelegate<HotwireDestination>
) : BridgeComponent<HotwireDestination>(name, bridgeDelegate) {
    override fun onReceive(message: Message) {
        // Button is a noop because Android already has an x button that serves the
        // same purpose. Read more about that in the book.
        when (message.event) {
            "connect" -> { /* noop */ }
            "disconnect" -> { /* noop */ }
            else -> Log.w("CancelButtonComponent", "Unknown event for message: $message")
        }
    }
}
