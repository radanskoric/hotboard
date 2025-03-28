package com.masterhotwire.hotboard.components

import android.util.Log
import android.view.Gravity
import android.view.ViewGroup
import androidx.appcompat.widget.Toolbar
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.ui.platform.ComposeView
import dev.hotwire.core.bridge.BridgeComponent
import dev.hotwire.core.bridge.BridgeDelegate
import dev.hotwire.core.bridge.Message
import dev.hotwire.navigation.destinations.HotwireDestination
import dev.hotwire.navigation.fragments.HotwireFragment
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

class SubmitButtonComponent(
    name: String,
    private val bridgeDelegate: BridgeDelegate<HotwireDestination>
) : BridgeComponent<HotwireDestination>(name, bridgeDelegate) {
    private val buttonId = 1
    private val fragment: HotwireFragment
        get() = bridgeDelegate.destination.fragment as HotwireFragment

    override fun onReceive(message: Message) {
        // Handle incoming messages based on the message `event`.
        when (message.event) {
            "connect" -> addButton(message)
            "disconnect" -> removeButton()
            else -> Log.w(
                "ButtonComponent",
                "Unknown event for message: $message"
            )
        }
    }

    private fun addButton(message: Message) {
        // Deserialize the data payload we sent
        // from the submit button controller
        val data = message.data<MessageData>() ?: return

        // Create the view which will render the button
        val button = ComposeView(fragment.requireContext()).apply {
            id = buttonId
            setContent {
                Button(
                    onClick = { replyTo("connect") }
                ) {
                    Text(data.title)
                }
            }
        }
        // Create a layout that will put the button on
        // the right side of the toolbar
        val layoutParams = Toolbar.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        ).apply { gravity = Gravity.END } // END pushes it to the right side

        // Fetch the toolbar
        val toolbar = fragment.toolbarForNavigation()
        // Add the new button
        toolbar?.addView(button, layoutParams)
    }

    private fun removeButton() {
        val toolbar = fragment.toolbarForNavigation()
        val button = toolbar?.findViewById<ComposeView>(buttonId)
        toolbar?.removeView(button)
    }

    // Use kotlinx.serialization annotations to define a serializable
    // data class that represents the incoming message.data json.
    @Serializable
    data class MessageData(
        @SerialName("title") val title: String
    )
}
