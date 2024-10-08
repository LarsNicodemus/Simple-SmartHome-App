//
//  DeviceGridView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

import SwiftUI

struct DeviceGridView: View {
    var device: SmartDevice = SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light)
    var body: some View {
            
        Text(device.name)
            .frame(width: 100,height: 100)
            .background(.orange)
            .clipShape(.circle)
            .bold()
                
            }
        }

#Preview {
    DeviceGridView()
}
