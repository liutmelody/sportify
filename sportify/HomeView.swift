//
//  HomeView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-18.
//

import SwiftUI
import MapKit


fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct FoodContentImageView: View {

    var imageName: String

    var body: some View {
        Image(imageName).resizable().frame(width: 200, height: 200, alignment: .center).scaledToFit()
    }
}

struct JoinGameButton : View {

    @Binding var showing: Bool
    //var title: String
    var hideAll: ()->()

    var body: some View {
        Button(action: {
            self.hideAll()
            self.showing.toggle()
        }) {
            Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 6.30.35 PM")).resizable().aspectRatio(contentMode: .fit)

        }
    }
}

struct HomeView<Content: View>: View {
    @Binding var isOpen: Bool
    @State var sportifyimage = "CheeseBurger"
    @State var showingPopup = false
    
    let popupColor = Color(.green)
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65708680258352, longitude: -79.49430929323823), span: MKCoordinateSpan(latitudeDelta: 0.0012, longitudeDelta: 0.0012))

    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            self.isOpen.toggle()
        }
    }
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }

    var body: some View {
        let hideAll = {
            self.showingPopup = false
        }
        return NavigationView{
        ZStack{
        Map(coordinateRegion: $region).ignoresSafeArea(.all, edges: .all)
            ZStack{
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                NavigationLink(destination: CreateNewGameView()){
                Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 6.35.52 PM")).resizable().aspectRatio(contentMode: .fit)
                }

//                ScrollView{
//                JoinGameButton(showing: $showingPopup, hideAll: hideAll)
                GameEventElementList()
                //Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 6.38.08 PM")).resizable().aspectRatio(contentMode: .fit)
//                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.white)
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }
            }
        }
            
    }.edgesIgnoringSafeArea(.all).popup(isPresented: $showingPopup, type: .`default`, closeOnTap: false) {
            createPopup()}
        
    }
    func createPopup() -> some View {
        VStack {
            Button(action: {
                self.showingPopup = false
            }){
                Color.clear.overlay(Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 9.11.15 PM")).resizable()
                .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: ContentMode.fit), alignment: .topTrailing)
            }

            Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 8.52.41 PM")).resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 330, height: 330)


        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        .frame(width: 370, height: 350)
        .background(Color(.white))
        .cornerRadius(5.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.20), radius: 50)
    }

    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(false), maxHeight: 1200) {
            Rectangle().fill(Color.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

