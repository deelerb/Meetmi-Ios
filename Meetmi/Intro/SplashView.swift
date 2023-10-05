//
//  SplashView.swift
//  AwesomeSplash
//
//  Created by Hardik Parmar on 31/08/20.
//
import SwiftUI
import Firebase
import FirebaseMessaging


struct SplashView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    @State var isUser:Bool = false
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
    
  
    @EnvironmentObject private var viewmodel: OnConnectdViewModel
    
  //  @EnvironmentObject private var delegate: AppDelegate
    
  //  @EnvironmentObject private var delegate: AppDelegate
    
  //  @EnvironmentObject private var delegate: AppDelegate
    
      @State var isEditing = false
    
    @State private var hasTimeElapsed = false
    
    let userDefaults = UserDefaults.standard
    
    let defaults = UserDefaults.standard
    

    
   // let isnotii = UserDefaults.standard.string(forKey: "notti")
    
    let uid = Auth.auth().currentUser?.uid
    
    let viewmodeln = OnConnectdViewModel()
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var settings = AppState()
    
    var body: some View {
        
    
        
        VStack {
            // 2.
            if self.isActive {
            
                MainHomeView()
                
                if (isUser) {
                    
                   /*
                 
                    if (AppState.shared.isnoti){
                        
                        //check if its group or one one
                        
                        
                        
                        if(AppState.shared.grupsender != "" ){
                            
                         
                            
                            GroupChatView()
                                .onAppear(){
                                    
                                    let defaults = UserDefaults.standard
                                    
                                defaults.set(AppState.shared.grupsender, forKey: "grupid")
                                    
                                  viewmodel.groupid = AppState.shared.grupsender
                                    
                                }
                            
                        }else {
                            
                            OneOnOneChatView()
                                .onAppear(){
                                    
                              
                                    
                                  viewmodel.otheruser = AppState.shared.otheruser
                                    
                                    
                                }
                            
                            
                        }
                 
                        
                        
                   */
                        
                    }else {
                        
                  MainHomeView()
                        
                        
                        
             //   Text("chec")
                        
                    }
                    
          
                    
           
                }else {
                    
                  SlidingScreenView()
                    
              // Video()
                    
                    
                }
              
                
            } else {
            
                    
                    ZStack(){
                        
                       
                       
                        Image("Registering-1")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                       
                    
                    VStack(){
                        
                        Text("GETTING YOU")
                            .foregroundColor(.white)
                            .font(Font.custom("Roboto-Regular", size: 17))
                        
                        Image("conne")
                            .resizable()
                            .frame(width: 150, height: 150)
                        
                        
                   
                        }
                     
                       
                    }  .navigationBarHidden(true)
                       .navigationBarBackButtonHidden(true)
                       .accentColor(.white)
                
                
              
            }
        }
        .environmentObject(self.appState)
      
        // 5.
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                    
                    let user = Auth.auth().currentUser;
                    
                    if (user == nil) {
                       
                        self.isUser = false
                  
                    }else{
                        
                        self.isUser = true
                        
                      
                    }
                }
            }
            
            //
    
                
         let isnotii = defaults.string(forKey: "notti")
                
            print(isnotii)
       
            
          print("ting" +  AppState.shared.grupsender)
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification, object: nil)) { _ in
            
                    print("App Will Resign")
            let defaults = UserDefaults.standard
            
            let other = defaults.string(forKey: "otheruser")
            
      //      viewmodel.otheruser = other!
            
            
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification, object: nil)) { _ in
                    print("App Will Terminate")
                    
                    let defaults = UserDefaults.standard
                    
                    let other = defaults.string(forKey: "otheruser")
                    
                 //   viewmodel.otheruser = other!
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification,  object: nil)) { _ in
                    
                    
                    print("App Will Enter Foreground nnn")
                    
                    let defaults = UserDefaults.standard
                    
                    let other = defaults.string(forKey: "otheruser")
                    
              //      viewmodel.otheruser = other!
                    
               //   print(viewmodel.otheruser)
                    
                 
                    
                    viewmodel.otheruser = AppState.shared.otheruser
                    
                    print("AppState.shared.otheruser")
                    
               //   viewmodel.isChat = true
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification, object: nil) ) { _ in
                    
                    print("App Did Become Active nnn")
                    
                    let defaults = UserDefaults.standard
                    
                    let other = defaults.string(forKey: "otheruser")
                    
               //     print(Messaging.appDidReceiveMessage(Messaging.))
                    
                    
                    
                 //   viewmodel.otheruser = other!
                    
                  //  print(viewmodel.otheruser)
                    
                    
                }
  
    }
    
    
 
  
   
 
    
}


