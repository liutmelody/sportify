//
//  GameEventViewModel.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-21.
//

import Foundation
import Combine
import FirebaseFirestore

class GameEventViewModel: ObservableObject {
    // MARK: - Public properties
      
      @Published var gameEvent: GameEvent
      @Published var gameEvents = [GameEvent]()
      @Published var modified = false

      
      // MARK: - Internal properties
      
      private var cancellables = Set<AnyCancellable>()
      
      // MARK: - Constructors
      
    init(gameEvent: GameEvent = GameEvent(startTime: Date(), endTime: Date().addingTimeInterval(60 * 60), court: "", gameType:"", difficultyLevel: "")) {
        self.gameEvent = gameEvent

        self.$gameEvent
          .dropFirst()
          .sink { [weak self] gameEvent in
            self?.modified = true
          }
          .store(in: &self.cancellables)
      }
      
      // MARK: - Firestore
      
      private var db = Firestore.firestore()
      
    func addGameEvent(_ gameEvent: GameEvent, test: Bool = false) {
        do {

            let dbName = test ? "TestGameEvents": "GameEvents"
            //TODO: ideally, should be a  Player reference
            //eventually,  will have to change to UserDefaults
            let uid = UUID().uuidString
            let username = "Melody"
            let _ = try db.collection(dbName)
                .document(uid)
                .setData(["id":uid,
                          "difficultyLevel": gameEvent.difficultyLevel,
                          "gameType": gameEvent.gameType,
                          "players": [username],
                          "startTime": gameEvent.startTime,
                          "endTime": gameEvent.endTime
                            ])
//            from: gameEvent).updateData(["players":FieldValue.arrayUnion([username]), "id": uid])
        }
        catch {
          print(error)
        }
      }
    
    func togglePlayerToGameEvent(_ gameEvent: GameEvent, documentID: String, isAttending: Bool) {
//        if let documentID = gameEvent.id {
//        let id = documentID as? String ?? ""
        if true {
      do {
//         try db.collection("GameEvents").document( documentID).updateData(["players": FieldValue.arrayUnion(["Melody"])
        
        if isAttending{
            try db.collection("GameEvents").document("SdlowqaRHt5lWBF41guP").setData(["players" : ["Olivia", "Kennedy", "Melody"]], merge:true)
//            try db.collection("GameEvents").whereField("id", isEqualTo: documentID).getDocuments().setData(["players" : ["Olivia", "Kennedy", "Melody"]], merge:true)
        }
        else{ //
            try db.collection("GameEvents").document("SdlowqaRHt5lWBF41guP").setData(["players" : ["Olivia", "Kennedy"]], merge:true)
        }

      }
      catch let error {
        print("Error writing city to Firestore: \(error)")
      }
        }
    }
    

    
    func fetchData() {

        db.collection("GameEvents").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents found")
          return
        }

        self.gameEvents = documents.map { queryDocumentSnapshot -> GameEvent in
          let data = queryDocumentSnapshot.data()
            guard let stamp = data["startTime"] as? Timestamp else{
                return GameEvent(startTime: Date(), endTime: Date().addingTimeInterval(5 * 60), court: "", gameType:"", difficultyLevel: "")
            }
          let startTime = stamp.dateValue()
          let endTime = startTime.addingTimeInterval(60 * 60)
          let court = data["court"] as? String ?? ""
          let gameType = data["gameType"] as? String ?? ""
          let difficultyLevel = data["difficultyLevel"] as? String ?? "Any"
          let playerName = data["players"] as? [String] ?? ["You"]
          let players = [Player(name: String(describing: playerName), skillLevel: "test", gender: "test")]

            return GameEvent(id: .init(), startTime: startTime, endTime: endTime, court: court, gameType: gameType, difficultyLevel: difficultyLevel, players: players)
        }
      }
    }
      
      // MARK: - Model management
      
      func save() {
        addGameEvent(self.gameEvent)
      }
      
      // MARK: - UI handlers
      
      func handleDoneTapped() {
        self.save()
      }
    
}

