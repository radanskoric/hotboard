import HotwireNative
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Hotwire.config.pathConfiguration.matchQueryStrings = false
        Hotwire.loadPathConfiguration(from: [
            .server(baseURL.appending(path: "configurations/ios_v1.json"))
        ])
        
        return true
    }
}
