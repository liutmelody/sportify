//
//  NeighbourhoodView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-27.
//

import SwiftUI
import MapKit


struct NeighbourhoodView: View {
    @State private var bottomSheetShown = false
    @State private var BPCregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65435680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.0095, longitudeDelta: 0.0095))
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{

            Map(coordinateRegion: $BPCregion).ignoresSafeArea(.all, edges: .all)
                NavigationLink(destination: TestView().navigationBarHidden(true))
                {Text(".")
            Map(coordinateRegion: $BPCregion, annotationItems: courts) { place in
            MapAnnotation(coordinate: place.coordinate)
            {
                ZStack{
                    Image(uiImage: #imageLiteral(resourceName: "Tennis Map Icon")).resizable().frame(width: 100, height: 58)
                }
            }
            }
        }.ignoresSafeArea(.all)

        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.5
            ) {
                VStack{
                    Text("Explore Baby Point Neighbourhood")
                        .fontWeight(.bold)
                        .font(.system(size: 29))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 15)
                    Spacer().frame(height:10)
                    Text("Tap a point of interest to get started.")
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 15)

                }

            }
        }.edgesIgnoringSafeArea(.all)
        }
    }
        
}
}


struct NeighbourhoodView_Previews: PreviewProvider {
    static var previews: some View {
        NeighbourhoodView()
    }
}
