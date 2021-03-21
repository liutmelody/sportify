//
//  PlayerListView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-20.
//

import SwiftUI

struct PlayerListView: View {
  @ObservedObject var viewModel = PlayerViewModel() // (/1)
  
  var body: some View {
    NavigationView {
        Text(viewModel.players.description)
      List(viewModel.players) { player in // (2)
        VStack(alignment: .leading) {
          Text(player.name)
            .font(.headline)
          Text(player.gender)
            .font(.subheadline)
          Text(player.skillLevel)
            .font(.subheadline)
        }
      }
      .navigationBarTitle("Players")
      .onAppear() { // (3)
        self.viewModel.fetchData()
      }
    }
  }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
