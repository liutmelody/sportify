//
//  ContentView.swift
//  sportify
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{

        VStack(spacing: 50) {
            Image(uiImage: #imageLiteral(resourceName: "Group 45"))
            Image(uiImage: #imageLiteral(resourceName: "Sportify"))
            Image(uiImage: #imageLiteral(resourceName: "Play sports with your neighbors"))
                NavigationLink(destination: NeighbourhoodView().navigationBarHidden(true)
                ) {
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Rectangle 13"))
                Image(uiImage: #imageLiteral(resourceName: "Group 55"))
            }.navigationBarTitle(Text("Get started"))
            .navigationBarHidden(true)
                }
        }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
