//
//  AppDelegate.swift
//  EkycIproovIOS
//
//  Created by Nguyễn Thanh Bình on 14/7/25.
//

import UIKit
import IDCardReader
import IprLiveness

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupIDCardReader()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func setupIDCardReader() {
        let privateUrl = Bundle.main.url(forResource: "private-key-uat", withExtension: "txt")
        let publicUrl = Bundle.main.url(forResource: "public-key", withExtension: "txt")
        do {
            let privateKey = try String(contentsOf: privateUrl!, encoding: .utf8)
            let publicKey = try String(contentsOf: publicUrl!, encoding: .utf8)
            let appId = "com.pvcb"
            let ekycUrl = "https://ekyc-sandbox.eidas.vn/ekyc"
            IDCardReaderManager.shared.setup(serverUrl: ekycUrl, appId: appId, publicKey: publicKey, privateKey: privateKey)
            IDCardReaderManager.shared.setLocalizeTexts(reading: "Reading")
            IDCardReaderManager.shared.setLocalizeTexts(requestPresentCard: "Vui lòng đưa CCCD vào",
                                                        authenticating: "Đang xác thực",
                                                        reading: "Đang đọc",
                                                        errorReading: "CCCD không hợp lệ. Vui lòng kiểm tra lại.",
                                                        successReading: "Đọc thẻ thành công",
                                                        retry: "Đang thử lại")
//            IprLiveness.Networking.shared.resetDeviceInfo()
            let faceMatchingUrl = "https://ekyc-sandbox.eidas.vn/face-matching"
            IprLivenessManager.setup(appId: appId, url: faceMatchingUrl, publicKey: publicKey, privateKey: privateKey)
//            _ = IprLiveness.Networking.shared.generateDeviceInfor(deviceId: UUID().uuidString)
        } catch {
            print(error)
        }
    }
}

