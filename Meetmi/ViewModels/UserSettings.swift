//
//  UserSettings.swift
//  Connectd
//
//  Created by Creative Sanctum on 2022/03/14.
//

import Foundation


class UserSettings: ObservableObject {
    
    @Published var fullphone: String = ""
    @Published var verificationID: String = ""
    @Published var fullname: String = ""
    @Published var birthDate: Date = Date.now
    @Published var countrycode: String = "Code"
    @Published var userid: String = ""
    @Published var othernme: String = ""
    @Published var rec: String = ""
    @Published var send: String = ""
    
   
    
    @Published var url: String = ""
    
    @Published var gifurl: String = ""
    
    @Published var searchterm: String = ""
    
    init(){
        
     //  print(gifs)
    }
}
