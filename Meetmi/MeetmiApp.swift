//

//

import SwiftUI
import UIKit
import SwiftUI



import Firebase

import UserNotifications

import BackgroundTasks
import AVFoundation
//import GoogleMaps
import FirebaseMessaging

import PushKit






let APIKey = "AIzaSyBItRQ2QYVQf1uUPVe7i-jBY9PDmJBSBIM"


@main
struct MeetmiApp: App {
    

    
    let gcmMessageIDKey = "gcm.message_id"
 
 
    
    @StateObject var viewModel = ViewModel()
    
 //   @State var groupname = ""
    
   
    
 //   @EnvironmentObject var usersettings: UserSettings
    
  //  @EnvironmentObject private var viewmodelm: OnConnectdViewModel

    @StateObject var viewRouter = ViewRouter()
    
 //  @State  var  isFromNotif: Bool = false
    
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
  @StateObject var appState = AppState.shared
    
       var body: some Scene {
           
           
           WindowGroup {
               
               
        
          //    let viewmodel = OnConnectdViewModel()
               
           
       SplashView()
                   .environmentObject(UserSettings())
                       
                       .environmentObject(viewRouter)
                       .environmentObject(self.appState)
                       .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                       .onOpenURL { url in
                           
                           Auth.auth().canHandle(url) // <- just for information purposes
                       }
               
              
           }
          
       }
    
  
    
    init() {
        
    
        let defaults = UserDefaults.standard
           
        defaults.set("false", forKey: "isChat")
        
        defaults.set("false", forKey: "isGrup")
        
      
    
      }
    
   
}

//*** Implement App delegate ***//


class AppDelegate: NSObject, UIApplicationDelegate,  ObservableObject{
    

    var window: UIWindow?
    
    var queue: DispatchQueue = DispatchQueue(label: "get.connectd.ap.appdelegate")
    var voipRegistry: PKPushRegistry?
    
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil ) -> Bool {
      
  
        
        FirebaseApp.configure()
      
   
      let defaults = UserDefaults.standard
      
      Database.database().isPersistenceEnabled = true
        
 
        
        // MARK: SendBirdCall.configure(appId:)
        // See [here](https://github.com/sendbird/quickstart-calls-ios#creating-a-sendbird-application) for the application ID.
        // If you want to sign in with QR code, don't configure your app ID in code.
        
        // Configure your app id here to designate a specific app id for the application.
        // let appId = YOUR_APP_ID
        // SendBirdCall.configure(appId: appId)
        // UserDefaults.standard.designatedAppId = appId

        
        return true
      
      
   
      if (!defaults.bool(forKey: "hasRunBefore")) {
          
        

          // Update the flag indicator
          defaults.set(true, forKey: "hasRunBefore")
          defaults.synchronize() // This forces the app to update userDefaults
          
      
          do { try Auth.auth().signOut() }
          catch { print("already logged out") }

        

      }
    
      
        
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()

        
        getPushNotifications()
      
   //   checkifmyreminder()
      

      
    return true
  }
    

    
 
    
    

  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
  //  print("\(#function)")
      
      
      
 //     print(deviceToken)
      
      print("\(#function)")
      if Auth.auth().canHandle(url) {
        return true
      }
      return false
      
     
   Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
      
  Auth.auth().setAPNSToken(deviceToken, type: .prod)
     

      Messaging.messaging().apnsToken =  deviceToken
      

   
  }
    
    func application(_ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error) {

         //   print("Unable to register for remote notifications: \(error.localizedDescription)")

        }

    
  
    func application(_ application: UIApplication,
    didReceiveRemoteNotification notification: [AnyHashable : Any],
       fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void){
        
        
        
      
  let senderid = notification["sender"] as? String
        
 let grupid = notification["senderid"] as? String
        

        
       
        if (senderid != nil){
            
            AppState.shared.otheruser = senderid!
            AppState.shared.isnoti = true
          
        }
        
  
        if (grupid != nil){
            
            AppState.shared.grupsender = grupid!
            
            AppState.shared.isnoti = true
            
            print("jkkk")
            
        }
  
        
        completionHandler(UIBackgroundFetchResult.newData)
      
        return
    
  }
    
   
  
    func getPushNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.getRegisteredPushNotifications()
            case .authorized:
                DispatchQueue.main.async {
                    
                    UIApplication.shared.registerForRemoteNotifications()
                    
                }
            case .denied:
                
               print("denied")
            // El usuario no ha dado permiso. Quizas se puede mostrar un mensaje recordando porqué se requiere el permiso.
            default:
                break
            }
        }
    }
    
    
    func getRegisteredPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    
                }
            }
        })
    }

    


    
}


extension NotificationCenter: UNUserNotificationCenterDelegate {
    
    
    
}




class AppState: ObservableObject {
    
 static let shared = AppState()
   
  @Published var isnoti = false
  @Published var otheruser = ""
  @Published var grupsender = ""
    
}
