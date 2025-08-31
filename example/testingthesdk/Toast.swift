//
//  Toast.swift
//  testingthesdk
//
//  Created by Syed M Ali kazmi on 26/08/2025.
//

import UIKit
import Toast_Swift

struct Toast {
    static func show(_ message: String,
                     duration: TimeInterval = 2.0,
                     position: ToastPosition = .bottom) {
        if let window = UIApplication.keyWindow {
            window.makeToast(message,
                             duration: duration,
                             position: position)
        }
    }
}

