//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

import SwiftUI

struct DeviceListView: View {
    
    var device: SmartDevice
    var onDelete: () -> Void
    var body: some View {
        
        HStack {
            Text("|")
            Text(device.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(device.type.rawValue)
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text("|")
        }
        
        .padding(.vertical, 8)
        .contextMenu {
                    Button(role: .destructive) {
                        onDelete()
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
    }
}


#Preview {
    DeviceListView(device: MOCKDEVICE1, onDelete: {print("gelöscht")})
}
