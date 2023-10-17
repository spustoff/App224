//
//  App224App.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_fDtopYdU51FNXJRghqveAN1VGDqbt1")
        Amplitude.instance().initializeApiKey("6b0e8bb336dc0b8aef0ec3fe598dabfd")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App224App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
