//
//  GameEvent.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import Foundation
import SwiftUI
import CoreLocation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

//TODO: change to class 

struct GameEvent: Codable, Identifiable { 
//    let id = UUID()
    @DocumentID var id: String?
    var startTime: Date
    var court: String //TODO -> convert to address type
    //TODO: need gender for game type?
    var gameType: String // singles, doubles, mixed doubles
    // TODO ////////////// var playerLevel: String 
    var players = [Player]()
    

    //@State var isAttending: Bool
//    @State var playerList = [String]()
    
//    init(time: Date, court: String, gameType: String){
//        self.time = time
//        self.court = court
//        self.gameType = gameType
//    }
    

}
