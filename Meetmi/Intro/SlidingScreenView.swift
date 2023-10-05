//
//  SlidingScreenView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/03/01.
//

import SwiftUI
import Firebase


struct SlidingScreenView: View {
    
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
      @State private var selection = 0
      
    @EnvironmentObject private var viewmodel: OnConnectdViewModel
      
     @State private var isReg = false
   
      let images = ["h1","newpic","h3","h4","tre"]
    
    var body: some View {
        
        if (viewmodel.isReg){
            
            RegistrationView()
            
        }else {
       
   ZStack{
       
      
      
                ZStack{
                    
                    
                      
                          
                          TabView(selection : $selection){
                              
                              
                              
                              ForEach(0..<5){ i in
                                  
                                  
                                  Image("\(images[i])")
                                      .resizable()
                                  //    .frame(height: 200)
                                      .scaledToFill()
                                      .offset(y:-10)
                                     
                                     
                               
                              }

                              
                          }
                          .tabViewStyle(.page)
                        //  .frame(height: 600)
                          .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                          .onReceive(timer, perform: { _ in
                                  
                              withAnimation{
                                //  print("selection is",selection)
                                  selection = selection < 5 ? selection + 1 : 0
                              }
                          })
                } .frame(maxWidth: .infinity, maxHeight: .infinity)
           .edgesIgnoringSafeArea(.all)
                
            
                
                VStack{
                    Image("Path1")
                        .offset(y:50)
                    
                    Text("CONNECT'D")
                        .offset(y:50)
                        .foregroundColor(Color("appgreen"))
                        .font(Font.custom("Roboto-Bold", size: 26))
                        .font(.system(size: 40))
                    
                    Spacer()
                    
                    Text("Connectd is the world first private chat and social media platform that allows you to interact only with users on your contact list")
                        .foregroundColor(Color.white)
                        .font(Font.custom("Roboto-Regular", size: 17))
                        .offset(y:-120)
                        .padding(10)
                        .multilineTextAlignment(.center)
                    
                    
                
                        
                        
                        Text("GET STARTED")
                            .foregroundColor(.white)
                            .frame(maxWidth:340, maxHeight: 50)
                            .font(Font.custom("Roboto-Bold", size: 17))
                            .background(Color("appgreen"))
                            .cornerRadius(30)
                            .onTapGesture {
                                
                                
                                viewmodel.isReg = true
                                
                            
                            }
                            
                   
                 .offset(y:-60)
                    
                    
                       
                    
             
                
                }
   
       
   }.onAppear(){
       
       
       
   //    viewmodel.isstart = false
       
       do { try Auth.auth().signOut() }
       catch { print("already logged out") }
       
   }
            /*
   .navigationBarTitle("")
       .navigationBarHidden(true)
       .navigationBarBackButtonHidden(true)
    //   .offset(x: 0, y: -80)
            
             */
            
        }
            
        
    }
}

struct SlidingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingScreenView()
    }
}
