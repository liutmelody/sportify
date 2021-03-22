//
//  PlayerListView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-20.
//

import SwiftUI

struct PlayerListView: View {
  @ObservedObject var viewModel = PlayerViewModel()
//    @Published var players = viewModel.$players

  
  var body: some View {
    NavigationView {
        //Text(viewModel.players.description)
        VStack {
            List{ForEach(viewModel.players.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                  Text(viewModel.players[index].name)
                    .font(.headline)
                  Text(viewModel.players[index].gender)
                    .font(.subheadline)
                  Text(viewModel.players[index].skillLevel)
                    .font(.subheadline)
                }
            }

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
