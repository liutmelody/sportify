//
//  ContactDetail.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-17.
//
import SwiftUI

//struct ContactDetail: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}
struct ContactDetail: View {
    @State var showingPopup = true

    var body: some View {
        ZStack {
             Text("Hello, World!")
        }
        .popup(isPresented: $showingPopup, autohideIn: 2) {
            HStack {
                Text("The popup")
            }
            .frame(width: 200, height: 60)
            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
            .cornerRadius(30.0)
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail()
    }
}
