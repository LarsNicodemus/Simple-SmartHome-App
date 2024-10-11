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
    case sound = "Musik"
    case powerOutlet = "Steckdose"
    
    var id: String { rawValue }
    
    var symbolName: String {
        switch self {
        case .light:
            return "lightbulb.fill"
        case .thermostat:
            return "thermometer"
        case .lock:
            return "lock.fill"
        case .sound:
            return "homepod.fill"
        case .powerOutlet:
            return "poweroutlet.type.c.square.fill"
        }
    }
}

