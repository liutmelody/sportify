//
//  TennisCourt.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-20.
//

import SwiftUI
import MapKit


struct TennisCourt: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
