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
      
    init(gameEvent: GameEvent = GameEvent(startTime: Date(), court: "", gameType:"", difficultyLevel: "")) {
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
      
      func addGameEvent(_ gameEvent: GameEvent) {
        do {
            //TODO: ideally, should be a  Player reference
            //eventually,  will have to change to UserDefaults
          let _ = try db.collection("GameEvents").addDocument(from: gameEvent).updateData(["players":FieldValue.arrayUnion(["Melody"])
            ])
            
        }
        catch {
          print(error)
        }
      }
    
    func addPlayerToGameEvent(_ gameEvent: GameEvent) {
//        if let documentID = gameEvent.id {
      do {
          //TODO: ideally, should be a  Player reference
         try db.collection("GameEvents").document( "SdlowqaRHt5lWBF41guP").updateData(["players":FieldValue.arrayUnion(["Melody"])
          ])
      }
      catch {
        print(error)
      }
//        }
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
                return GameEvent(startTime: Date(), court: "", gameType:"", difficultyLevel: "")
            }
          let startTime = stamp.dateValue() //data["startTime"] as? Date ?? Date()
          let court = data["court"] as? String ?? ""
          let gameType = data["gameType"] as? String ?? ""
          let difficultyLevel = data["difficultyLevel"] as? String ?? "Any"
//            let players = data["players"] as? [Player] ?? [Player(name:"Players not found", skillLevel: "test", gender:"test")]
            let playerName = data["players"] as? [String] ?? ["You"]
            let players = [Player(name: String(describing: playerName), skillLevel: "test", gender:"test")]

            return GameEvent(id: .init(), startTime: startTime, court: court, gameType: gameType, difficultyLevel: difficultyLevel, players: players)
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

