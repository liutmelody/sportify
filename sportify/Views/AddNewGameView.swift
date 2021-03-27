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
    var difficultyLevel = ["Beginner", "Intermediate", "Advanced", "Expert"]
  
  var body: some View {
    NavigationView {

      Form {
        Section() {
            VStack(alignment: .leading){
                Spacer().frame(height:10)
                Text("Court").font(.body)
                Spacer().frame(height:7)
                Picker(selection: $viewModel.gameEvent.court, label:Text("Select where you want to play").font(.subheadline).foregroundColor(Color.init(UIColor.darkGray))){
                ForEach(bpcCourts, id: \.self){
                    Text($0).font(.subheadline).font(.system(size: 11))
                    
                }
                }

//            .pickerStyle(WheelPickerStyle())
//            .frame(height: 80)
//            .clipped()
//            .transformEffect(.init(scaleX: 1, y: 0.9))

            Spacer().frame(height:10)

            }
            
            VStack(alignment: .leading){
                Spacer().frame(height:10)
                Text("Game Type").font(.body)
                Spacer().frame(height:7)
                Picker(selection: $viewModel.gameEvent.gameType, label:Text("Select which type of game you wish to play ").font(.subheadline).foregroundColor(Color.init(UIColor.darkGray))){
                ForEach(gameTypes, id: \.self){
                    Text($0).font(.subheadline).font(.system(size: 11))

                }
            }
                
            Spacer().frame(height:10)

            }
            VStack(alignment: .leading){
                Spacer().frame(height:10)
                Text("Player Skill Level").font(.body)
                Spacer().frame(height:7)
               
                Picker(selection: $viewModel.gameEvent.difficultyLevel, label: Text("Select the skill level of players you want to play with").font(.subheadline).foregroundColor(Color.init(UIColor.darkGray))){
            ForEach(difficultyLevel, id: \.self){
                Text($0).font(.subheadline).font(.system(size: 11))
            }
        }//.pickerStyle(SegmentedPickerStyle())
                
                Spacer().frame(height:10)

            }
            
            VStack(alignment: .leading){
                Spacer().frame(height:10)
            Text("Date and Time: ").font(.body)
            Spacer().frame(height:9)
                Text("Select a date and time for your game").font(.subheadline).foregroundColor(Color.init(UIColor.darkGray))
            DatePicker("Select start date and time: ", selection: $viewModel.gameEvent.startTime, in:Date()..., displayedComponents: [.date, .hourAndMinute]).datePickerStyle(GraphicalDatePickerStyle())
            }
//        DatePicker("Select end time: ", selection: $viewModel.gameEvent.endTime, displayedComponents: [ .hourAndMinute])
        }

      }//.labelsHidden()
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
