import HotwireNative
import UIKit

final class SubmitButtonComponent: BridgeComponent {
    override class var name: String { "submit-button" }

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
        let item = UIBarButtonItem(title: data.title)
        viewController.navigationItem.rightBarButtonItem = item
    }
}

private extension SubmitButtonComponent {
    struct MessageData: Decodable {
        let title: String
    }
}
