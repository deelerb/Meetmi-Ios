//

//

import SwiftUI
import Firebase

@main
struct MeetmiApp: App {
    
    @UIApplicationDelegateAdaptor(AppDeletegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            SplashView()
               
        }
    }
}

class AppDeletegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}

