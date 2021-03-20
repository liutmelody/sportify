//
//  TestView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import SwiftUI
import MapKit

struct TestView: View {
    @State private var bottomSheetShown = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65708680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.00125, longitudeDelta: 0.00125))


    var body: some View {
        NavigationView{
        ZStack{
        Map(coordinateRegion: $region).ignoresSafeArea(.all, edges: .all)

        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.6
            ) {
                VStack{
                NavigationLink(destination: CreateNewGameView()){
                Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 6.35.52 PM")).resizable().aspectRatio(contentMode: .fit)
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
