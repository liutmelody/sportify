//
//  PlayerViewModel.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-20.
//

import Foundation
import FirebaseFirestore

class PlayerViewModel: ObservableObject {
  @Published var players = [Player]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {

    db.collection("Players").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.players = documents.map { queryDocumentSnapshot -> Player in
        let data = queryDocumentSnapshot.data()
        let name = data["name"] as? String ?? ""
        let gender = data["gender"] as? String ?? ""
        let skillLevel = data["skillLevel"] as? String ?? ""

        return Player(id: .init(), name: name, skillLevel: skillLevel, gender: gender)
      }
    }
  }
}


