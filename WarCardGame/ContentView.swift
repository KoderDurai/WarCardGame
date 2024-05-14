//
//  ContentView.swift
//  WarCardGame
//
//  Created by Karthikeyan Duraivel on 14/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var card_1:String = "back"
    @State var card_2:String = "back"
    @State var player_score:Int = 0
    @State var cpu_score:Int = 0
    @State var card_1_blur:Int = 0
    @State var card_2_blur:Int = 0

    var body: some View {
        
        ZStack {
            Image("background-plain")
            VStack(alignment: .center){
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        card_1_blur = blur_card(current_blur: card_1_blur)
                        
                    } label: {
                        Image(card_1).blur(radius: Double(card_1_blur))
                    }
                    Spacer()
                    Button {
                        card_2_blur = blur_card(current_blur: card_2_blur)
                    } label: {
                        Image(card_2).blur(radius: Double(card_2_blur))
                    }

                    Spacer()
                }
                Spacer()
                Button {
                    deal()
                } label: {Image("button")}
                Spacer()
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(player_score))
                            .font(.title)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpu_score))
                            .font(.title)
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }.padding(.vertical, 60)
            VStack{
                Spacer(minLength: 770)
                Button {
                    card_1 = "back"
                    card_2 = "back"
                    player_score = 0
                    cpu_score = 0
                    card_1_blur = 0
                    card_2_blur = 0
                    
                } label: {
                    Image(systemName: "eraser")
                        .resizable()
                        .foregroundColor(Color.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .frame(width: 25.0, height: 25.0)
                }
                Spacer()
            }
        }
    }
    
    func deal() {
        print("Deal cards")
        let card_ran_1:Int = (Int.random(in: 2...14))
        
        card_1 = "card" + String(card_ran_1)
        
        let card_ran_2:Int = (Int.random(in: 2...14))
        card_2 = "card" + String(card_ran_2)
    

        if card_ran_1>card_ran_2 {
            player_score += 1
        } else if card_ran_1<card_ran_2 {
            cpu_score += 1
            print("Tie")
        } else {
            print("Tie")
        }
    }
    
    func blur_card(current_blur:Int) -> Int {
        var current_blur:Int = current_blur

        if current_blur == 0  {
            current_blur = 5
        } else {
            current_blur = 0
        }
        
        return current_blur
    }
}

#Preview {
    ContentView()
}
