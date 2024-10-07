//
//  RoomView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var isShown: Bool
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            Image(.room)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
                .shadow(color: .orange, radius: 5, x: 0, y: 5)
            Button(){
                isShown.toggle()
            } label: {
                Text("x")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
            }
            .padding()
        }
        
    }
}

#Preview {
    RoomView(isShown: .constant(false))
}
