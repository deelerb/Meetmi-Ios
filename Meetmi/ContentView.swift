//
//  ContentView.swift
//  Meetmi
//
//  Created by Dale Banda on 2023/10/03.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var body: some View {
        
        MapView(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                        .navigationBarTitle("Map View")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
