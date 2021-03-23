//
//  AddNewGameView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-21.
//

import SwiftUI

struct AddNewGameView: View {
  @Environment(\.presentationMode) private var presentationMode 
  @StateObject var viewModel = GameEventViewModel()
    var gameTypes = ["Tennis Singles", "Tennis Doubles", "Tennis Mixed Doubles"]
    var bpcCourts = ["Baby Point Club, Court 1", "Baby Point Club, Court 2"]
    var difficultyLevel = ["Beginner", "Intermediate", "Advanced", "Expert", "Any"]
  
  var body: some View {
    NavigationView {
      Form {
        Section() {
            Picker("Select court: ", selection: $viewModel.gameEvent.court){
                ForEach(bpcCourts, id: \.self){
                    Text($0)
                }
            }
                Picker("Select game type: ", selection: $viewModel.gameEvent.gameType){
                ForEach(gameTypes, id: \.self){
                    Text($0)
                }
            }
            Picker("Select desired skill level of player(s): ", selection: $viewModel.gameEvent.difficultyLevel){
            ForEach(difficultyLevel, id: \.self){
                Text($0)
            }
        }
        DatePicker("Select date and time: ", selection: $viewModel.gameEvent.startTime, displayedComponents: [.date, .hourAndMinute])
        }


      }
      .navigationBarTitle("New Game", displayMode: .inline)
      .navigationBarItems(
        leading:
          Button(action: { self.handleCancelTapped() }) {
            Text("Cancel")
          },
        trailing:
          Button(action: { self.handleDoneTapped() }) {
            Text("Done")
          }
          .disabled(!viewModel.modified)
        )
    }
  }
  
  func handleCancelTapped() {
    dismiss()
  }
  
  func handleDoneTapped() {
    self.viewModel.handleDoneTapped()
    dismiss()
  }
  
  func dismiss() {
    self.presentationMode.wrappedValue.dismiss()
  }
}

struct AddNewGameView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGameView()
    }
}
