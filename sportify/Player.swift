//
//  Player.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import Foundation
import SwiftUI
import Firebase
//import CodableFirebase

struct Player: Hashable, Codable, Identifiable {
    
    @DocumentID var id: String?
    
//    let id = UUID()
    var name: String
    //var email: String
    var skillLevel: String
    //var neighbourhood: String //TODO
    var gender: String //TODO
    //var availability: list of strings? TODO
    
    //profile picture
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }

}
