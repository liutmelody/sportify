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
    public var username =  UserDefaults.standard.string(forKey: "username") as? String ?? "Melody"
        
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
            let uid = UUID().uuidString.replacingOccurrences(of: "-", with: "")
//            let username = "Melody"
            let _ = try db.collection(dbName)
                .document(uid)
                .setData(["id": uid,
                          "court": gameEvent.court,
                          "difficultyLevel": gameEvent.difficultyLevel,
                          "gameType": gameEvent.gameType,
                          "players": [self.username],
                          "startTime": gameEvent.startTime,
                          "endTime": gameEvent.endTime
                            ])
        }
        catch {
          print(error)
        }
      }
    
    func togglePlayerToGameEvent(_ gameEvent: GameEvent, documentID: String, isAttending: Bool, test: Bool = false) {
        let dbName = test ? "TestGameEvents": "GameEvents"

        if let documentID = gameEvent.id {
      do {
        if isAttending{
            try db.collection(dbName).document(documentID).updateData(["players": FieldValue.arrayUnion([self.username])])
        }
        else{
            try db.collection(dbName).document(documentID).updateData(["players": FieldValue.arrayRemove([self.username])])
        }

      }
      catch let error {
        print("Error writing city to Firestore: \(error)")
      }
        }
    }
    
    func isUserAttending(players: String) -> Bool {
        let isAttending = players.contains(self.username) ? true : false
        return isAttending
    }
    

    
    func fetchData(test: Bool = false) {
        let dbName = test ? "TestGameEvents": "GameEvents"

        db.collection(dbName).order(by: "startTime").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents found")
          return
        }

        self.gameEvents = documents.map { queryDocumentSnapshot -> GameEvent in
            let data = queryDocumentSnapshot.data()

            guard let stamp = data["startTime"] as? Timestamp else{
                return GameEvent(startTime: Date(), endTime: Date().addingTimeInterval(5 * 60), court: "", gameType:"", difficultyLevel: "")
            }
          let id = data["id"] as? String ?? "Error"
          let startTime = stamp.dateValue()
          let endTime = startTime.addingTimeInterval(60 * 60)
          let court = data["court"] as? String ?? ""
          let gameType = data["gameType"] as? String ?? ""
          let difficultyLevel = data["difficultyLevel"] as? String ?? "Any"
          let playerName = data["players"] as? [String] ?? [""]
          let players = [Player(name: String(describing: playerName), skillLevel: "test", gender: "test")]

            return GameEvent(id: id, startTime: startTime, endTime: endTime, court: court, gameType: gameType, difficultyLevel: difficultyLevel, players: players)
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

