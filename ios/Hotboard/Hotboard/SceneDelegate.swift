import HotwireNative
import UIKit

let rootURL = URL(string: "http://localhost:3000/")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let navigator = Navigator(configuration: Navigator.Configuration(
        name: "main",
        startLocation: rootURL
    ))

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        window?.rootViewController = navigator.rootViewController
        navigator.start()
    }
}
