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
    
    @DocumentID var id: String?
    
    var name: String
    //var email: String
    var skillLevel: String
    //var neighbourhood: String //TODO
    var gender: String 
    
    //@ServerTimestamp var createdTime: Timestamp?
    //var availability: list of strings? TODO
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case skillLevel
      case gender
    }
    
    //profile picture
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}
