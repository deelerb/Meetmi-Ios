//
//  OtpView.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/02/25.
//

import SwiftUI
import Firebase


struct OtpView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var otp: String = ""
    
    @State private var taskTitle: String = ""
    
    private let ref = Database.database().reference()
    
    @State var currentPage: Page = .page1
    
    @State private var showingAlert = false
    

    
    @State private var showingAlerts = false
    
    
    @State var i = 0
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
  
//    @Binding var tapCount : String
   
    @EnvironmentObject var usersettings: UserSettings
    
   // @Published var isVerified: Bool = false
    
  
  //  @AppStorage("isLoggedIn") var isLogin: Bool = false
    
    func actionOfButton() {
           
       // OtpView.init()
        
     //   print(viewModel.errorMsg)
           
       }
    
    
    init(){
        
           UITableView.appearance().backgroundColor = .clear
        let defaults = UserDefaults.standard
        
       defaults.set("", forKey: "coverpic")
        
        defaults.set("", forKey: "profpic")
        
        defaults.set("", forKey: "searchterm")
        
       
        
  //    print(viewModel.errorMsg)
           
       }
     
   
    var body: some View {
        
       
        
        if (viewModel.isVerified){
            
         
            CreateProfileView()
            
        }else{
            
            ZStack{
                
                Image("Registering-1")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                
                VStack{
                      
                   // Spacer()
                 
                    Image("Path1")
                        .offset(x: 0, y: 60)
                    
                    
                    VStack(spacing: 20){
                        
                        Text("CONNECTD")
                            .font(.system(size: 25))
                            .font(.headline).bold()
                            .foregroundColor(Color("appgreen"))
                        
                        
                        Text("CREATE ACCOUNT")
                            .font(.system(size: 25))
                            .font(.headline).bold()
                            .foregroundColor(.white)
                        
                        
                        Text("Please enter the pin code that was sent via sms to the number you’ve entered")
                            .font(.system(size: 10))
                            .font(.headline).bold()
                            .foregroundColor(.white)
                            .padding(.leading)
                            .multilineTextAlignment(.center)
                        
                        
                       
                    }.offset(x: 0, y: 60)
                    
                 
                    Spacer()
                
                    //start
                    
             
                }
                
                VStack(spacing: 20){
                    
              
                    HStack{
                        
                        Image("lock")
                        
                        TextField("Code", text: $otp)
                            .keyboardType(.decimalPad)
                        
                        
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .frame(maxWidth:340, maxHeight: 50)
                    
                    HStack{
                        
                        Text("Didn’t receive the sms?")
                            .foregroundColor(Color.white)
                            .font(.system(size: 13))
                            .padding(.leading)
                        
                        Button(action: {
                            
                            
                            
                        }, label: {
                                            Text("Resend Sms")
                                                
                                                .foregroundColor(.white)
                                                .frame(maxWidth:100, maxHeight: 30)
                                                .offset(x: 0, y: 0)
                                                .multilineTextAlignment(.center)
                                        })
                                        .font(.system(size: 12))
                                        
                                        .background(Color("AppBlue"))
                                        .cornerRadius(30)
                    }
                    
                 
                  
                        
                           
                           if (showingAlerts){
                               
                               Text("Next")
                                   .foregroundColor(.white)
                                   .frame(maxWidth:340, maxHeight: 50)
                                   .font(Font.custom("Roboto-Bold", size: 17))
                                   .background(Color("appgreen"))
                                   .cornerRadius(30)
                                   .alert(viewModel.errorMsg, isPresented: $showingAlert) {
                                              Button("OK", role: .cancel) { }
                                   }
                                   .onTapGesture{
                                       
                                       viewModel.verifyCode(code: otp)
                                       
                                       if (viewModel.errorMsg == nil){
                                           
                                           
                                       }else{
                                          
                                           showingAlert = true
                                           
                                           DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
                                               
                                              // print(viewModel.errorMsg)
                                               
                                             //  Text(viewModel.errorMsg)
                                               
                                               showingAlerts = true
                                               
                                             //  viewModel.errorMsg == nil
                                               
                                                 }
                                      
                                       }
                                   }
                               
                           }else{
                           
                          
                   
                        Text("NEXT")
                        
                            .foregroundColor(.white)
                            .frame(maxWidth:340, maxHeight: 50)
                            .font(Font.custom("Roboto-Bold", size: 17))
                            .background(Color("appgreen"))
                            .cornerRadius(30)
                          
                            .onTapGesture {
                                
                                
                                
                                viewModel.verifyCode(code: otp)
                                
                              
                                
                                if (viewModel.errorMsg == nil){
                                    
                                    
                                }else{
                                   
                                    showingAlert = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
                                        
                                       // print(viewModel.errorMsg)
                                        
                                      //  Text(viewModel.errorMsg)
                                        
                                        showingAlerts = true
                                        
                                          }
                               
                                }
                                
                                
                           
                       }
                               
                               
                           }
                
                     
                    
              
                    VStack(spacing:10){
                        
                        Text("By registering on this app, you agree to the ")
                            .font(.system(size: 13))
                            .foregroundColor(Color.white)
                        
                       
                       
                        Button(action: {
                            if let url = URL(string: "https://www.getconnectd.app/app-terms-conditions/") {
                               UIApplication.shared.open(url)
                            }
                        }) {
                            Text("Terms, Conditions and End-User License Agreement. ")
                                .font(.system(size: 13))
                                .foregroundColor(Color.blue)
                                .padding(.trailing)
                        }
                  
                    }
                    
                  
                }.offset(y: 85)
                  
           
            }.onAppear {
                
                
        }
            .offset(x: 0, y: 10)
            
            .onTapGesture {
                
                self.hideKeyboard()
            }

            
        }
            

    
        
    }
    
    
    @ViewBuilder
       func chooseDestination() -> some View {
           switch i {
           case 0: HomeView()
           case 1: MainHomeView()
           default: EmptyView()
           }
       }
    
    func verifyotp(){
        
        let phoneNumber = usersettings.fullphone
        
        let currentVerificationId = usersettings.verificationID
     
        let verificationCode = self.otp
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: currentVerificationId, verificationCode: verificationCode)
        
      
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            let authError = error as NSError
            print(authError.description)
            return
          }

          // User has signed in successfully and currentUser object is valid
          let currentUserInstance = Auth.auth().currentUser
            
          let uid = Auth.auth().currentUser?.uid
            
       
            isLogin=true
            
            //create sendbird user
            
           
        
            let json: [String: Any] = ["user_id": uid!, "nickname": "user", "profile_url": "user", "issue_access_token": true ]

                    let jsonData = try? JSONSerialization.data(withJSONObject: json)

                    // create post request
                    let url = URL(string: "https://api-0AF4D958-8622-4AA4-B31D-CC9D9825A0EE.sendbird.com/v3/users/")! //PUT Your URL
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
                    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                    request.setValue("e979a08823fd1033001429ea9c86ae6632573965", forHTTPHeaderField: "Api-Token")
                   
                    request.httpBody = jsonData

                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else {
                            print(error?.localizedDescription ?? "No data")
                            return
                        }
                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                        if let responseJSON = responseJSON as? [String: Any] {
                            
                          //  print(responseJSON) //Code after Successfull POST Request
                            
                           let access_token = responseJSON["access_token"] as! String?
                            
                         //   print(access_token)
                            
                            let rref =  Database.database()
                                .reference()
                                .child("Users/\(uid!)")
                            
                            rref.child("sendbird_user").child("access_token").setValue(access_token)
                        }
                    }

                    task.resume()

           
            }

        
    
            
        }
      
   
    }


struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView()
    }
}
