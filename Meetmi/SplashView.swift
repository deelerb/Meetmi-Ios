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
    
  
   
 
    
      @State var isEditing = false
    
    @State private var hasTimeElapsed = false
    
    let userDefaults = UserDefaults.standard
    
    let defaults = UserDefaults.standard
    

    
    let uid = Auth.auth().currentUser?.uid
    
 
    var body: some View {
        
    
        
        VStack {
            // 2.
            if self.isActive {
                
                
                
                if (isUser) {
                    
                    ContentView()
                 
                    
                } else {
                    
                    
                    ZStack(){
                        
                        if(!isUser){
                            
                           PhoneOTPView()
                            
                        }else{
                            
                            
                        Text("Splash screen")
                            
                        }
                   
                        
                        
                    }
                    
                    
                    
                }
            }
        }
       
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
            
       
            
        }
       
               
  
        

    }
    
    
 
  
   
 
    
}


