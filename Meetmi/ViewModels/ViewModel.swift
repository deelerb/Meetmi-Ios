//
//  ViewModel.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/03/16.
//

import Foundation
import Firebase
import SwiftUI



class ViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var isLoadingVerify: Bool = false
    
    @Published var code: String = ""
    
    @Published var otp: String = ""

    @Published var phoneNumber: String = ""
    
    @Published var countryy: String = ""
    
    @State private var cellnumber: String = ""
    
   // @EnvironmentObject var usersettings: UserSettings
    
    @Published var isVerify: Bool = false
    @Published var isVerified: Bool = false
    

    @Published var isError: Bool = false
    @Published var errorMsg: String = ""
 
    
   
}

extension ViewModel {
    
  func sendCode() {
        
       
        
       let fullphone = "+"+code + phoneNumber
        

      
        
      let verificationId = UserDefaults.standard.string(forKey: "verificationId") ?? ""
      
   //
      //    print(fullphone)
      
      
  
          
          PhoneAuthProvider.provider().verifyPhoneNumber(fullphone, uiDelegate: nil) { (verificationId, error) in
              
          //    self.isLoading.toggle()
              
              UserDefaults.standard.set(verificationId, forKey: "verificationId")
              
           //   print(verificationId)
              
         
              
              if error != nil {
                  self.isError.toggle()
                  self.errorMsg = error?.localizedDescription ?? ""
                  return
                  
                  
              }
              
           
                          //  self.isVerify.toggle()
       
          
      }
        
    
      
      
    }
    
    func verifyCode(code: String) {
        
        self.isLoadingVerify.toggle()
        
        let verificationId = UserDefaults.standard.string(forKey: "verificationId") ?? ""
        
    
        
        if (verificationId != nil){
            
            
            print(verificationId)
            
            
           let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
            
            
            
           print("credentials")
            
            
            Auth.auth().signIn(with: credentials) { (authResult, error) in
                
                self.isLoadingVerify.toggle()
                
                if error != nil {
                    self.isError.toggle()
                    self.errorMsg = error?.localizedDescription ?? ""
                    
                    print(self.errorMsg)
                    
                    print("verify error")
                    
                    return
                }
                
             print(authResult ?? "")
                
                print("verify")
                
                self.isVerify.toggle()
                self.isVerified.toggle()
                
                
            }
            
            
            
        }
        
  
        
    
  
         
        
        
    }
}
