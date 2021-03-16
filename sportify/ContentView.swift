//
//  ContentView.swift
//  sportify
//
//  Created by Vishaal Chittur on 2021-03-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()

        VStack(spacing: 50) {
            Image(uiImage: #imageLiteral(resourceName: "Group 45"))
            Image(uiImage: #imageLiteral(resourceName: "Sportify"))
            Image(uiImage: #imageLiteral(resourceName: "Play sports with your neighbors"))
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Rectangle 13"))
                Image(uiImage: #imageLiteral(resourceName: "Group 55"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
