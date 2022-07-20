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
    @State var gameFailed = false
    @State var count = 1
    let guessNum = Int.random(in: 1...30)
    var body: some View {
        VStack {
            
            Text("UpDownGame !!")
                .padding()
                .font(.title)
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
                        gameFailed = true
                    }
                
                }
            } label: {
                Text("button")
                    .padding()
            }.alert(isPresented: $gameStatus) {
                Alert(title: Text("UpDownGame"), message: Text("HIT!"), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $gameFailed) {
                Alert(title: Text("UpDownGame"), message: Text("You Lose!"), dismissButton: .default(Text("OK")))
            }
            Text("Your guess number is \(sliderNowValue)")
            Text("Your min number is \(Int(sliderMinValue))")
            Text("Your max number is \(Int(sliderMaxValue))")
            Text("\(count) / 5 ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
