//
//  SmartHomeQuickAccessButton.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUICore

struct SmartHomeQuickAccessButton: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(text)
                .font(.caption)
        }
        .foregroundColor(.white)
    }
}
