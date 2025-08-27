# Anchorium Link iOS SDK

[![Swift Package Index](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fanchoriumlink%2FAnchoriumLink-SPM%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/anchoriumlink/AnchoriumLink-SPM)
[![Swift Package Index](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fanchoriumlink%2FAnchoriumLink-SPM%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/anchoriumlink/AnchoriumLink-SPM)

The **Anchorium Link SDK** makes it easy to integrate **persistent AR anchors** into your iOS apps.  
With Anchorium Link, you can store, share, and resolve anchors across sessions and devices — powered by our cloud-based platform.  

---

## 🚀 Features
- Persistent AR anchors across sessions  
- Share anchors between users and devices  
- Swift Package Manager (SPM) integration  
- Pay-as-you-go credit system  

---

## 📦 Installation (Swift Package Manager)

1. In Xcode, go to  
   **File → Add Packages…**  

2. Enter the repository URL:  

   ```
   https://github.com/anchoriumlink/AnchoriumLink-SPM.git
   ```

3. Choose the latest release version (e.g. `1.0.0`).  

4. Add **AnchoriumLink** to your app target.  

---

## 📝 Requirements
- iOS 13.0+  
- Xcode 15+  
- Swift 5.9+  
- Valid **Anchorium Link API Key**  

---

## 🔑 Getting Started
1. Visit [anchoriumlink.com](https://anchoriumlink.com)  
2. Sign up in the **Developer Portal**  
3. Purchase credits  
4. Get your **API Key** from the dashboard  

---

## ⚡ SDK Initialization
Initialize the SDK in your app startup (e.g. `AppDelegate`):  

```swift
import AnchoriumLink

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        AnchoriumLink.initialize(apiKey: "YOUR_API_KEY")

        return true
    }
}
```

---

## 📖 Basic Usage

### Hosting an Anchor
```swift
let anchor = try AnchoriumLink.hostAnchor(at: transform) 
print("Anchor hosted with ID:", anchor.id)
```

### Resolving an Anchor
```swift
let anchor = try AnchoriumLink.resolveAnchor(withId: "ANCHOR_ID")
print("Anchor resolved at:", anchor.transform)
```

---

## 💳 Credits & Billing
- Each anchor operation consumes credits  
- Credits are purchased at [anchoriumlink.com](https://anchoriumlink.com)  
- The SDK requires valid credits to function  

---

## 📄 License
This SDK is proprietary software owned by **Anchorium Link**.  
By using it, you agree to the terms in the [LICENSE](./LICENSE) file.  

---

## 🤝 Support
For technical support:  
📧 support@anchoriumlink.com  
🌍 [anchoriumlink.com](https://anchoriumlink.com)  
