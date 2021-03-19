////
////  MapViewSwift.swift
////  sportify
////
////  Created by Melody Liu on 2021-03-18.
////
//
//import SwiftUI
//import MapKit
//import Drawer
//
//struct MapView: View {
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65708680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.0012, longitudeDelta: 0.0012))
//
//    var body: some View {
//        ZStack{
//        Map(coordinateRegion: $region).ignoresSafeArea(.all, edges: .all)
//
//            Drawer(heights: ){
//            Color.red
//        }.rest(at: .constant([0, 0]))
//        }
//    }
//}
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
