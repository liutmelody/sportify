//
//  ProfileView.swift
//  sportify
//
//  Created by Melody Liu on 2021-03-20.
//

import SwiftUI

struct ProfileView: View  {
    
    @State private var gidNumber : String
    @State private var badgeNumber: String
    @State private var pinNumber: String
    @State private var eiPin: String
    @State private var username: String
    @State var animation = true
    @State private var save = ""
    @State private var showingAlert = false
    
    init() {
        let gidNumber = UserDefaults.standard.string(forKey: "GID Number") ?? ""
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        let badgeNumber = UserDefaults.standard.string(forKey: "Badge Number") ?? ""
        let pinNumber = UserDefaults.standard.string(forKey: "Job Ad Pin") ?? ""
        let eiPin = UserDefaults.standard.string(forKey: "EI Code") ?? ""
        self._gidNumber = State(initialValue: gidNumber)
        self._badgeNumber = State(initialValue: badgeNumber)
        self._pinNumber = State(initialValue: pinNumber)
        self._eiPin = State(initialValue: eiPin)
        self._username = State(initialValue: username)

    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section {
                        TextField("GID Number" , text: $gidNumber)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    Section {
                        TextField("Badge Number", text: $badgeNumber)
                    }
                    Section {
                        TextField("Username", text: $username)
                    }
                    Section {
                        TextField("Job Ad Pin", text: $pinNumber)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    Section {
                        TextField("EI Code", text: $eiPin)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }.navigationBarTitle(Text("Employee Infomation"))
                    .navigationBarItems(trailing :
                        Button (action:
                            {
                                UserDefaults.standard.setValue(self.gidNumber, forKey: "GID Number" )
                                UserDefaults.standard.setValue(self.badgeNumber, forKey: "Badge Number" )
                                UserDefaults.standard.setValue(self.username, forKey: "username" )

                                UserDefaults.standard.setValue(self.pinNumber, forKey: "Job Ad Pin")
                                UserDefaults.standard.setValue(self.eiPin, forKey: "EI Code" )
                                self.showingAlert = true
                        }){
                            Text("Save")
                        }
                )
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Information Has Been Saved"),
                              message: Text("Nice work!!"),
                              dismissButton: .default(Text("Ok")))
                }
                Text("Unifor Local707")
                    .font(.title)
                    .bold()
//                Image("image1")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(20)
//                    .shadow(color: Color.gray, radius: 10)
//                    .scaleEffect(animation ? 0.5 : 1)
//                    .rotation3DEffect(Angle(degrees: animation ? 0 : 360), axis: (x: 0, y: 360, z: 0))
//                    .animation(Animation.easeInOut(duration: 3).delay(0))
//                    .onAppear{ self.animation.toggle() }
//                    .padding(.horizontal, 20)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
