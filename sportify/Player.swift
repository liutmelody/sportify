//
//  Player.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Player: Hashable, Codable, Identifiable {
//struct Player: Hashable, Identifiable {
    
    @DocumentID var id: String?
//    var id: String = UUID().uuidString
    
//    let id = UUID()
    var name: String
    //var email: String
    var skillLevel: String
    //var neighbourhood: String //TODO
    var gender: String //TODO
    
    //@ServerTimestamp var createdTime: Timestamp?
    //var availability: list of strings? TODO
    
    //profile picture
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}
//
//private var db = Firestore.firestore()
//
//func addPlayer(player: Player) {
//  do {
//    let _ = try db.collection("Players").addDocument(from: tennisPlayers)
//  }
//  catch {
//    print(error)
//  }
//}
