//
//  SplashScreensView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/03/03.
//

import SwiftUI

struct SplashScreensView: View {
    
    @State private var isActive = false
    
        let login = SlidingScreenView()
    
        let color = Color.init("AppBlue")
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
    
    var body: some View {
        
        
        NavigationView {
            
                    VStack(alignment: .center) {
                        
                        Image("logo")
                        
                        NavigationLink(destination: login,
                                       isActive: $isActive,
                                       label: { SplashScreenView()})
                    }
                    .background(color)
                    .onAppear(perform: {
                        
                        
                  
                    })
            
        }
                .navigationBarHidden(true)
                .accentColor(.white)
                .navigationBarTitle("")
                .navigationViewStyle(StackNavigationViewStyle())
                    .navigationBarBackButtonHidden(true)
         
       
        
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



struct SplashScreensView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreensView()
    }
}
