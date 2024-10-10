//
//  DeviceGridView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

import SwiftUI

struct DeviceGridView: View {
    var device: SmartDevice
    var onDelete: () -> Void
    var body: some View {
            
        Text(device.name)
            .frame(width: 100,height: 100)
            .background(.orange)
            .clipShape(.circle)
            .bold()
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
    DeviceGridView(device: SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light), onDelete: {print("gelöscht")})
}
