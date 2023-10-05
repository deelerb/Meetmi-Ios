//
//  SplashView.swift
//  AwesomeSplash
//
//  Created by Hardik Parmar on 31/08/20.
//
import SwiftUI
import Firebase



struct SplashDeleteView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    @State var isUser:Bool = false
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
    
  
    @EnvironmentObject private var viewmodel: OnConnectdViewModel
    
  
    
  
    
    
      @State var isEditing = false
    
    @State private var hasTimeElapsed = false
    
    let userDefaults = UserDefaults.standard
    
    let uid = Auth.auth().currentUser?.uid
    
    var body: some View {
        VStack {
            // 2.
            if (!isUser ) {
            
                SlidingScreenView()
                
                
                
            }
                
             
                
             else {
            
                    
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
        }
    }
    
}

