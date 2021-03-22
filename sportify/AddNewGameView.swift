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
    var gameTypes = ["Singles", "Doubles", "Mixed Doubles"]
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Book")) {
          TextField("Court", text: $viewModel.gameEvent.court)
            Picker("Select game type: ", selection: $viewModel.gameEvent.gameType){
                ForEach(gameTypes, id: \.self){
                    Text($0)
                }
            }
//          TextField("Game Type", text: $viewModel.gameEvent.gameType)
//        TextField("Date", value: $viewModel.gameEvent.time, formatter: DateFormatter())
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
