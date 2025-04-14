package com.masterhotwire.hotboard

import android.app.Application
import com.masterhotwire.hotboard.components.CancelButtonComponent
import com.masterhotwire.hotboard.components.SubmitButtonComponent
import dev.hotwire.core.bridge.BridgeComponentFactory
import dev.hotwire.core.bridge.KotlinXJsonConverter
import dev.hotwire.core.config.Hotwire
import dev.hotwire.core.turbo.config.PathConfiguration
import dev.hotwire.navigation.config.registerBridgeComponents

class HotboardApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        Hotwire.loadPathConfiguration(
            context = this,
            location = PathConfiguration.Location(
                remoteFileUrl = "${rootURL}/configurations/android_v1.json"
            )
        )

        Hotwire.registerBridgeComponents(
            BridgeComponentFactory("submit-button", ::SubmitButtonComponent),
            BridgeComponentFactory("cancel-button", ::CancelButtonComponent)
        )

        Hotwire.config.jsonConverter = KotlinXJsonConverter()
    }
}
