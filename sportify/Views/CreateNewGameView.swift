//
//  CreateNewGameView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-17.
//

import SwiftUI
import Firebase
//import FirebaseFirestoreCodable

struct Contact {
    var name:String
    var jobTitle:String
}
struct GameDetail {
    var name:String
    var location:String
}


let contacts = [
    Contact(name: "Date", jobTitle: "Select a date for your game."),
    Contact(name: "Time", jobTitle: "Set a time for your game"),
    Contact(name: "Player Skill Level", jobTitle: "Select the skill levels of players you want to play with")
]
let gameDetails = [

    GameDetail(name: "Court Location", location: "Baby Point Club, Court 1")
]

struct ContactRow : View {
    var contact: Contact

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(contact.name).font(.body)
            Spacer()
            HStack {
                Text(contact.jobTitle).font(.subheadline).foregroundColor(Color.gray)
                Spacer()
            }

        }.padding(7)
    }
}
struct GameDetailRow : View {
    var gamedetail: GameDetail

    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Text(gamedetail.name).font(.body)
            Spacer()
            HStack {
                Text(gamedetail.location).font(.subheadline).foregroundColor(Color("SportifyGreen"))
                Spacer()
            }

        }.padding(7)
    }
}
struct CreateNewGameView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name:"Georgia", size: 20)!]
    }
    var body: some View {

        NavigationView {
            
        List {
            NavigationLink(destination: ContactDetail()){
                GameDetailRow(gamedetail: gameDetails[0])
            }
            NavigationLink(destination: ContactDetail()){
                        ContactRow(contact: contacts[0])
                        }
            NavigationLink(destination: ContactDetail()){
                ContactRow(contact: contacts[1])
            }
            NavigationLink(destination: ContactDetail()){
                ContactRow(contact: contacts[2])
            }
            
        }

        .navigationBarTitle(Text("    Create a new game"), displayMode: .automatic)
    }
}
}

//struct NeighbourhoodView: View {

//var body: some View {
//    NavigationView {
//        VStack {
//            NavigationLink(destination: Text("hi, welcome here")) {
//                Image(uiImage: #imageLiteral(resourceName: "Group 49.png"))
//
//            }
//            .padding(10)
//        }
//        .navigationBarTitle("Title")
//    }
//    .border(Color.gray)
//}
//}
struct CreateNewGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewGameView()
    }
}
