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
]

struct AddGameEventButton: View {
  var action: () -> Void
  var body: some View {
    Button(action: { self.action() }) {
        Image(uiImage: #imageLiteral(resourceName: "Create Game Button"))
            .resizable()
            .cornerRadius(13.0)
            .frame(width: 118, height: 44)
    }
  }
}

struct TestView: View {
    @State private var bottomSheetShown = false
    @State var showAddGameEvent = false
    @ObservedObject var viewModel = GameEventViewModel()

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

        GeometryReader { geometry in
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.8
            ) {
                VStack{
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
//                GameEventElementList()
//                    }
                    VStack{
                          ForEach(viewModel.gameEvents.indices, id: \.self) { index in

                            GameEventElement(gameEvent:  viewModel.gameEvents[index])
                          }
                        }
                    .onAppear() {
                        self.viewModel.fetchData()}
                    }

                }
                
            }
        }.edgesIgnoringSafeArea(.all)
        }.navigationBarItems(leading: AddGameEventButton(){
            self.showAddGameEvent.toggle()
        })
        .sheet(isPresented: self.$showAddGameEvent, content: {
            AddNewGameView()
        })
    }
        
}
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
