//
//  ContentView.swift
//  Meetmi
//
//  Created by Dale Banda on 2023/10/03.
//

import SwiftUI
import CoreLocation
import Firebase

struct ContentView: View {
    
    @State private var authID: String?
    
    var body: some View {
        
        VStack{
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                .navigationBarTitle("Map View")
            
        }.onAppear(){
            
            self.authID = Auth.auth().currentUser?.uid
            
            print(authID)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
