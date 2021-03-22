//
//  GameEventElementList.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import SwiftUI

struct GameEventElementList: View {
    @ObservedObject var viewModel = GameEventViewModel()
    
    var body: some View {

        VStack{
              ForEach(viewModel.gameEvents.indices, id: \.self) { index in

                GameEventElement(gameEvent:  viewModel.gameEvents[index])
              }
            }
        .onAppear() {
            self.viewModel.fetchData()}

    }
}

struct GameEventElementList_Previews: PreviewProvider {
    static var previews: some View {
        GameEventElementList()
    }
}
