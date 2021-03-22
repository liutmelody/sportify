//
//  GameEventElement.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-19.
//

import SwiftUI

var tennisPlayers = [
    Player(name: "Melody", skillLevel: "Beginner", gender: "F"),
    Player(name: "Zaeem", skillLevel: "Intermediate", gender: "M")

]
//var instead of 'let' because gameEvents needs to be mutable
//var gameEvents = [
//    GameEvent(startTime: Timestamp(date: Date()), court: "Baby Point Club, Court 1",  gameType: "Singles", players: [tennisPlayers[0], tennisPlayers[1]]),
//    GameEvent(startTime: Date(timeIntervalSinceReferenceDate: -129456789.0), court: "Baby Point Club, Court 3",  gameType: "Mixed Doubles"),
//    GameEvent(startTime: Date(timeIntervalSinceReferenceDate: -123499789.0), court: "Baby Point Club, Court 2", gameType: "Doubles")
//]

struct GameEventElement: View {
    var gameEvent: GameEvent
    @State var isAttending : Bool = false
    @State var showingPopup = false

//    @State var playerList  = []


    var body: some View {
//        let hideAll = {
//            self.showingPopup = false
//        }

        VStack (alignment: .leading, spacing: 4){
            
            if self.isAttending {
                Text("You're going to this game!")//.padding().background(Color.green)
            }
            Text(gameEvent.startTime, style: .time).fontWeight(.bold).font(.system(size: 14))
            Text(gameEvent.gameType).fontWeight(.bold).font(.system(size: 18))
            Text(gameEvent.court).fontWeight(.bold).foregroundColor(.gray).font(.system(size: 14))
            
            //TODO Text(gameEvent.time, style: .date)
//            Text(gameEvent.playerList.description).fontWeight(.light).font(.system(size: 12))
            Text(gameEvent.players.description).fontWeight(.light).font(.system(size: 12))

//            if !gameEvent.playerList.isEmpty {
//                HStack{
//                    Text("Players: ").fontWeight(.light).font(.system(size: 12))
//                    Text(gameEvent.playerList.description).fontWeight(.light).font(.system(size: 12))}
//            }
            
//            List(gameEvents.identified(by: \.time)) { (gameEvent : Binding<GameEvent>) in
//                Toggle(isOn: gameEvent.isAttending) {
//                    Text(gameEvent.isAttending)
//                }
//            }

            Button(action: {self.isAttending.toggle()})
            {
                Image(self.isAttending == false ? "Join Game Button" : "Edit RSVP Button").resizable().aspectRatio(contentMode: .fit)
            }
            //JoinGameButton(showing: $showingPopup, hideAll: hideAll)

            
        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        .frame(width: 350, height: 200)
        .background(Color(.white))
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.30), radius: 1).frame(width: 350, height: 200)
//        .edgesIgnoringSafeArea(.all).popup(isPresented: $showingPopup, type: .`default`, closeOnTap: false) {
//                createPopup()}
    }
    
    func createPopup() -> some View {
        VStack {
            Button(action: {
                self.showingPopup = false
            }){
                Color.clear.overlay(Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 9.11.15 PM")).resizable()
                .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: ContentMode.fit), alignment: .topTrailing)
            }

            Image(uiImage: #imageLiteral(resourceName: "Screen Shot 2021-03-18 at 8.52.41 PM")).resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 330, height: 330)


        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        .frame(width: 370, height: 350)
        .background(Color(.white))
        .cornerRadius(5.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.20), radius: 5)
    }

}

struct GameEventElement_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        Group {
//            GameEventElement(gameEvent: gameEvents[0])
//            GameEventElement(gameEvent: gameEvents[1])
        }
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
