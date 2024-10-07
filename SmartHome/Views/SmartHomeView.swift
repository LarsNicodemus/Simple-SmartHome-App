//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var text = ""
    @State private var textViewShown = false
    @State private var textTwo = ""
    @State private var roomViewShown = true
    var body: some View {
        VStack{
            
            HeaderView()
            Spacer().frame(height: 30)
            ScrollView {
                HStack{
                    TextField("Schreib etwas...", text: $text)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                    
                    Button{
                        textViewShown.toggle()
                    }label: {
                        Text("Hinzufügen").foregroundColor(.white).fontWeight(.semibold)
                            
                    }
                    .padding()
                    .background(.orange)
                    .clipShape(.rect)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                
                Spacer().frame(height: 16)
                Text(textViewShown ? text : textTwo)
                    .bold()
                    .font(.system(size: 20))
                
                if roomViewShown {
                    RoomView(isShown: $roomViewShown)
                        .padding(16)
                }
                Toggle(isOn: $roomViewShown){
                    Text("Raumvorschau anzeigen")
                }
                .tint(.orange)
                .padding(.horizontal, 16)
            }
            
        }
        
    }
}

#Preview {
    SmartHomeView()
}
