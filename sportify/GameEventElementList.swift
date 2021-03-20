//
//  GameEventElementList.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//




import SwiftUI

struct GameEventElementList: View {
    
    var body: some View {
//        List(gameEvents, id: \.court) { gameEvent in
//                GameEventElement(gameEvent: gameEvent)
//                }
        VStack{
        ForEach (gameEvents, id: \.id){ gameEvent in
                GameEventElement(gameEvent: gameEvent)
                }
        }
//        .frame(minWidth:0,
//    maxWidth: .infinity,
//    minHeight: 0,
//    maxHeight: .infinity,
//    alignment: .topLeading)
    }
}

struct GameEventElementList_Previews: PreviewProvider {
    static var previews: some View {
        GameEventElementList()
    }
}
