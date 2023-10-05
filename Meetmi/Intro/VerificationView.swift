//
//  LoginView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/02/25.
//

import SwiftUI



struct VerificationView: View {
    
    @State private var username: String = ""
    
    init(){
        
           UITableView.appearance().backgroundColor = .clear
        
       }
    
    var body: some View {
        
   
        ZStack{
            
            Image("Registering-1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                
                HStack{
                    
                    Image("arrow-down-sign-to-navigate")
                        .offset(x: 40, y: 40)
                    
                    Spacer()
                    
                   
                    
                }
                
               // Spacer()
             
                Image("Path1")
                    .offset(x: 0, y: 40)
                
                
                VStack(spacing: 20){
                    
                    Text("CONNECTD")
                        .font(.system(size: 25))
                        .font(.headline).bold()
                        .foregroundColor(.green)
                    
                    
                    Text("CREATE ACCOUNT")
                        .font(.system(size: 25))
                        .font(.headline).bold()
                        .foregroundColor(.white)
                    
                    
                    Text("Fill in your details below to register and GetConnectd")
                        .font(.system(size: 12))
                        .font(.headline).bold()
                        .foregroundColor(.white)
                    
                    
                   
                }.offset(x: 0, y: 50)
                
             
                Spacer()
            
                //start
                
         
            }
            
            VStack(spacing: 20){
                
                HStack{
                    
                    Image("user")
                    
                    TextField("FullName", text: $username)
                    
                    
                }.padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .frame(maxWidth:340, maxHeight: 50)
                    .offset()
                
                
                HStack{
                    
                    Image("user")
                    
                    TextField("Cell Number", text: $username)
                    
                    
                }.padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .frame(maxWidth:340, maxHeight: 50)
                
                
                HStack{
                    
                    Image("user")
                    
                    TextField("Date Of Birth", text: $username)
                    
                    
                }.padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .frame(maxWidth:340, maxHeight: 50)
                
                
                
                Button(action: {}, label: {
                                    Text("Next")
                                        .foregroundColor(.white)
                                        .frame(maxWidth:340, maxHeight: 50)
                                })
                                .font(.system(size: 13))
                                .background(Color.green)
                                .cornerRadius(30)
                
                
            }.offset(y: 85)
              
       
        }
        
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}

