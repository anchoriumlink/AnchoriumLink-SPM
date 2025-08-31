//
//  Extensions.swift
//  testingthesdk
//
//  Created by Syed M Ali kazmi on 26/08/2025.
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}

extension Bundle {
    var clientId: String {
        return object(forInfoDictionaryKey: "ClientId") as? String ?? ""
    }
    var clientSecret: String {
        return object(forInfoDictionaryKey: "ClientSecret") as? String ?? ""
    }
}
