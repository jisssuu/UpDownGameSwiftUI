//
//  ContentView.swift
//  UpDownGameSwiftUI
//
//  Created by 홍길동 on 2022/07/19.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue : Float = 15
    @State var sliderNowValue : Int = 0
    @State var sliderMinValue : Float = 0
    @State var sliderMaxValue : Float = 30
    @State var gameStatus = false
    @State var gameSuccessed = false
    @State var gameFailed = false
    @State var information = false
    @State var count = 1
    @State var guessNum = Int.random(in: 1...30)
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    information = true
                } label: {
                    Image(systemName: "info.circle")
                        .padding()
                }.alert( isPresented: $information){
                    Alert(title: Text("Introduce developer"),message: Text("Developer is jisssuu"),dismissButton: .default(Text("OK")))
                }
                Spacer()
                Text("UpDownGame !!")
                    .padding()
                    .font(.title)
                Spacer()
                Button {
                    start()
                } label: {
                    Image(systemName: "restart")
                }
                Spacer()
            }
            Text("\(Int(self.sliderValue))")
            HStack {
                Text("\(Int(sliderMinValue))")
                    .padding()
                Slider(value: $sliderValue, in: sliderMinValue ... sliderMaxValue, step: 1)
                    .padding()
                Text("\(Int(sliderMaxValue))")
                    .padding()
            }
            Button {
                sliderNowValue = Int(sliderValue)
                if sliderNowValue == guessNum {
                    gameStatus = true
                    gameSuccessed = true
                }
                else {
                    if sliderNowValue < guessNum {
                        sliderMinValue = Float(sliderNowValue)
                        count += 1
                    }
                    else {
                        sliderMaxValue = Float(sliderNowValue)
                        count += 1
                    }
                    if(count == 5){
                        gameStatus = true
                        gameFailed = true
                    }
                
                }
            } label: {
                Text("button")
                    .padding()
            }.alert(isPresented: $gameStatus) {
                if gameSuccessed == true {
                   return Alert(title: Text("UpDownGame"), message: Text("HIT!"), dismissButton: .default(Text("OK")) )
                }
                else {
                   return Alert(title: Text("UpDownGame"), message: Text("You Lose!"), dismissButton: .default(Text("OK")))
                
                }
            }
            Text("\(count) / 5 ")
        }
    }
    func start(){
        sliderNowValue = 0
        sliderMaxValue = 30
        sliderMinValue = 0
        sliderValue = 15
        let reGuessNumber = Int.random(in: 1...30)
        guessNum = reGuessNumber
        count = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
