//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

import Foundation

struct SmartDevice: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var type: DeviceType
    var isOn: Bool = false
    var temperature: Double = 20.0
    var volume: Double = 30.0
    var isLocked: Bool = true
    var musicOn: Bool = false
}
