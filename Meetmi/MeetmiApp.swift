//
//  MeetmiApp.swift
//  Meetmi
//
//  Created by Dale Banda on 2023/10/03.
//

import SwiftUI
import Firebase

@main
struct MeetmiApp: App {
    
    init() {
           FirebaseApp.configure()
       }
    
    
    var body: some Scene {
        
        WindowGroup {
            
       ContentView()
            
       //  RegistrationView()
            
        }
    }
}
