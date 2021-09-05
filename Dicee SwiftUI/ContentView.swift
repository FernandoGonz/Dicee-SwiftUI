//
//  ContentView.swift
//  Dicee SwiftUI
//
//  Created by Fernando González on 05/09/21.
//

import SwiftUI

struct ContentView: View {
    
    // @State allows us to listen a change on one or more properties
    // @State creates a new ContentView with the new values
    // @State is only for SwiftUI
    @State var leftDiceNumber: Int = 1
    @State var rightDiceNumber: Int = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(diceNumber: self.leftDiceNumber)
                    DiceView(diceNumber: self.rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    // Change ramdomly the number of Dicee
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.leftDiceNumber = Int.random(in: 1...6)
                }, label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                })
                .background(Color.red)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(leftDiceNumber: 1, rightDiceNumber: 1)
            .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}

struct DiceView: View {
    
    let diceNumber: Int
    
    var body: some View {
        Image("dice\(self.diceNumber)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(.all)
    }
}
