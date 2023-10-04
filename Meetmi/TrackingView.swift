//
//  TrackingView.swift
//  Meetmi
//
//  Created by Dale Banda on 2023/10/04.
//

import SwiftUI
import CoreLocation

struct TrackingView: View {
    var body: some View {
        
        MapView(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                        .navigationBarTitle("Map View")
        
    }
}


