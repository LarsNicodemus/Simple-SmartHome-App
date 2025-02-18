//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var text = ""
    @Published var textViewShown = false
    @Published var textTwo = ""
    @Published var roomViewShown = true
    @Published var listView = true
    @Published var smartDevices: [SmartDevice] = []
    @Published var selectedDeviceType: DeviceType = .light
    @Published var selectViewType: ViewSelection = .list
    @Published var showingPopover: Bool = false
        
    func addDevice(_ text: String, _ type: DeviceType) {
        let newDevice = SmartDevice(name: text, type: type)
        smartDevices.append(newDevice)
    }
    func deleteDevice(_ device: SmartDevice) {
        if let index = smartDevices.firstIndex(where: { $0.id == device.id }) {
            smartDevices.remove(at: index)
        }
    }
}
