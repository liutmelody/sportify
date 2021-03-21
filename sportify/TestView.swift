//
//  TestView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import SwiftUI
import MapKit

let courts = [
    TennisCourt(name: "Baby Point Club, Court 1", latitude: 43.65685680258352, longitude: -79.49430929323823),
//    Place(name: "Tower of London", latitude: 51.508052, longitude: -0.076035),
//    Place(name: "Big Ben", latitude: 51.500710, longitude: -0.124617)
]

struct TestView: View {
    @State private var bottomSheetShown = false
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65708680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.00125, longitudeDelta: 0.00125))
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65635680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.0013, longitudeDelta: 0.0013))


    var body: some View {
        NavigationView{
        ZStack{
            Map(coordinateRegion: $region).ignoresSafeArea(.all, edges: .all)
            Map(coordinateRegion: $region, annotationItems: courts) { place in
            MapAnnotation(coordinate: place.coordinate) {
                ZStack{
                    Image(uiImage: #imageLiteral(resourceName: "MapAnnotation")).resizable().frame(width: 45, height: 58)
                }
            }

        }.ignoresSafeArea(.all)
//        ZStack(alignment: .top){
//            Color.clear
//            Image(uiImage: #imageLiteral(resourceName: "Create Game Button")).resizable()
//                .cornerRadius(10.0)
//                .frame(width: 100, height: 40)
//        }.frame(maxWidth: .infinity, maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.all)

        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.8
            ) {
                VStack{
//                NavigationLink(destination: CreateNewGameView()){
//                Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 6.35.52 PM")).resizable().aspectRatio(contentMode: .fit)
//                }
                    Text("1. Baby Point Tennis Courts")
                        .baselineOffset(10.0)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 15)
                    
                    Spacer()
                    VStack {
                        GridViewHeader()
                    }
                    ScrollView{
                GameEventElementList()
                    }

                }
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
    }
}
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
