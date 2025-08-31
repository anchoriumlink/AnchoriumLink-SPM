//
//  testingthesdkApp.swift
//  testingthesdk
//
//  Created by Syed M Ali kazmi on 07/07/2025.
//

import SwiftUI
import FirebaseCore

@main
struct testingthesdkApp: App {
    init() {
            FirebaseApp.configure()
            print("✅ Firebase initialized (SwiftUI lifecycle)")
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
