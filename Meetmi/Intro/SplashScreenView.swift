//
//  SplashScreenView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/01/25.
//

import SwiftUI
import CoreData

struct SplashScreenView: View {
    
    @State private var loggedIn = false
    
    let login = RegistrationView()
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
    
    @State private var isActive = false
    
    var body: some View {
        
        NavigationView {
            
                    VStack(alignment: .center) {
                        
                        Image("logo")
                        
                        NavigationLink(destination: login,
                                       isActive: $isActive,
                                       label: { SplashScreenView()})
                    }
                    //.background(color)
                    .onAppear(perform: {
                        
                      
                        if isLogin {
                            
                            self.gotoLoginScreen(time: 2.5)
                            
                        }else {
                            
                            self.gotoLoginScreen(time: 2.5)
                        }
                        
                   
                    })
            

            
        }
                .navigationBarHidden(true)
                .accentColor(.white)
                .navigationViewStyle(StackNavigationViewStyle())

  
      
    }
    
    func gotoLoginScreen(time: Double) {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
                self.isActive = true
            }
        }
    
    func gotoMainHomeScreen(time: Double) {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
                self.isActive = false
            }
        }
}



struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}


