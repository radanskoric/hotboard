import HotwireNative
import UIKit

final class CancelButtonComponent: BridgeComponent {
    override class var name: String { "cancel-button" }

    override func onReceive(message: Message) {
        guard let viewController else { return }
        guard let data: MessageData = message.data() else { return }
        addButton(using: data, to: viewController)
    }

    private var viewController: UIViewController? {
        delegate?.destination as? UIViewController
    }

    private func addButton(
        using data: MessageData,
        to viewController: UIViewController
    ) {
        let action = UIAction { _ in
            viewController.dismiss(animated: true)
        }
        let item = UIBarButtonItem(title: data.title, primaryAction: action)
        viewController.navigationItem.leftBarButtonItem = item
    }
}

private extension CancelButtonComponent {
    struct MessageData: Decodable {
        let title: String
    }
}
