//
//  HeaderView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                        
                    
                    Spacer()
                    
                    Text("Mein Smart Home")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                                        
                    Spacer()
                }
                Text("Alles unter Kontrolle")
                    .font(.subheadline)
                    .foregroundColor(.orange.opacity(0.8))
                
                .padding(.horizontal)
                
            }
            .padding()
        }
        .frame(height: 90)
        .cornerRadius(5)
    }
}




#Preview {
    HeaderView()
}
