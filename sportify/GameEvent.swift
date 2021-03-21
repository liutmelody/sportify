//
//  GameEvent.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import Foundation
import SwiftUI
import CoreLocation


//TODO: change to class 

struct GameEvent { // may need Hashable, Codable, Identifiable

    let id = UUID()
    var time: Date
    var court: String //TODO -> convert to address type
    //TODO: need gender for game type?
    var gameType: String // singles, doubles, mixed doubles
    // TODO ////////////// var playerLevel: String 
    @State var players = [Player]()

    //@State var isAttending: Bool
    @State var playerList = [String]()
    
//    init(time: Date, court: String, gameType: String){
//        self.time = time
//        self.court = court
//        self.gameType = gameType
//    }
    

}
