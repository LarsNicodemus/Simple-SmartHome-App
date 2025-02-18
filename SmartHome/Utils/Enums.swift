//
//  Enums.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 08.10.24.
//

enum DeviceType: String, Identifiable, CaseIterable {
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

enum PopupSelection: String, Identifiable, CaseIterable {
    case newDevice = "Gerät hinzufügen"
    case newRoom = "Raum hinzufügen"
    case newScene = "Situation hinzufügen"

    var id: String { rawValue }

    var symbolName1: String {
        switch self {
        case .newDevice:
            return "link.badge.plus"
        case .newRoom:
            return "rectangle.badge.plus"
        case .newScene:
            return "hourglass.badge.plus"

        }
    }

}

enum ViewSelection: String, Identifiable, CaseIterable {
    case list = "Liste"
    case grid = "Raster"
    case room = "Raum"

    var id: String { rawValue }

    var symbolName: String {
        switch self {
        case .list:
            return "checklist.unchecked"
        case .grid:
            return "square.grid.2x2"
        case .room:
            return "play.house.fill"

        }
    }
    
    var selection: Int {
        switch self {
        case .list:
            return 1
        case .grid:
            return 2
        case .room:
            return 3

        }
    }

}
