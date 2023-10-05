//
//  AutoSlidersView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/03/01.
//

import SwiftUI

struct AutoSlidersView: View {
    
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
      @State private var selection = 0
      
      ///  images with these names are placed  in my assets
   
      let images = ["h1","h2","h3","h4","h5"]
    
    
    var body: some View {
        
        
       
            VStack{
            
           
           
            NavigationView {
                
                
                NavigationLink(destination: RegistrationView()){
                    
                    Text("GET STARTED")
                        .foregroundColor(.white)
                        .frame(maxWidth:340, maxHeight: 50)
                        .font(.system(size: 13))
                        .background(Color.green)
                        .cornerRadius(30)
                    
                    
                }
                
                   
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                      
                    }
                }
           
        }
    
}

struct AutoSlidersView_Previews: PreviewProvider {
    static var previews: some View {
        AutoSlidersView()
    }
}
