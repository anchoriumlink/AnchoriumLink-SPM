import SwiftUI
import UIKit
import ARKit
import anchoriumlinkframework

public struct AnchoriumLinkView: UIViewControllerRepresentable {
    @Binding public var viewController: FilamentArViewController?
    private let clientId: String
    private let clientSecret: String
    
    public init(viewController: Binding<FilamentArViewController?>,
                clientId: String,
                clientSecret: String) {
        self._viewController = viewController
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        let container = UIViewController()
        
        FilamentArViewController.initialize(clientId: clientId,
                                            clientSecret: clientSecret) { vc, error in
            DispatchQueue.main.async {
                    if let vc = vc {
                        container.addChild(vc)
                        vc.view.frame = container.view.bounds
                        container.view.addSubview(vc.view)
                        vc.didMove(toParent: container)
                        self.viewController = vc
                        print("✅ SDK initialized successfully")
                    } else if let nsError = error as NSError? {
                        print("❌ SDK initialization failed")
                        print("Domain: \(nsError.domain)")
                        print("Code: \(nsError.code)")
                        print("UserInfo: \(nsError.userInfo)")
                    } else {
                        print("❌ SDK initialization failed with unknown error")
                    }
                }
        }
        
        return container
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Nothing to update
    }
}


