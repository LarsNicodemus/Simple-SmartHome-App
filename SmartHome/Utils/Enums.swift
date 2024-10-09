//
//  Enums.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

enum DeviceType: String, CaseIterable, Identifiable {
    case light = "Licht"
    case thermostat = "Heizung"
    case lock = "Schloss"
    
    var id: String { rawValue }
    
    var symbolName: String {
        switch self {
        case .light:
            return "lightbulb.fill"
        case .thermostat:
            return "thermometer"
        case .lock:
            return "lock.fill" 
        }
    }
}

