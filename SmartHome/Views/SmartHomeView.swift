//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var text = ""
    @State private var textViewShown = false
    @State private var textTwo = ""
    @State private var roomViewShown = true
    @State private var listView = true
    @State private var smartDevices = [
        SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light),
        SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light, isOn: true),
        SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light, isOn: true),
        SmartDevice(name: "Heizung", type: DeviceType.thermostat),
        SmartDevice(name: "Heizung", type: DeviceType.thermostat, temperature: 9.0),
        SmartDevice(name: "Heizung", type: DeviceType.thermostat, temperature: 32.1),
        SmartDevice(name: "Haustür", type: DeviceType.lock, isLocked: false),
        SmartDevice(name: "Haustür", type: DeviceType.lock),
        SmartDevice(name: "Haustür", type: DeviceType.lock, isLocked: false),
        
    ]
    @State private var selectedDeviceType: DeviceType = .light
    let rowHeight: CGFloat = 40
    let maxHeight: CGFloat = 400
    
    var body: some View {
        
        VStack(spacing: 0) {
            HeaderView()
                .frame(maxWidth: .infinity)
            
            Spacer().frame(height: 16)
            ScrollView {
                VStack {
                    VStack{
                        HStack {
                            TextField("Bezeichnung eingeben..", text: $text)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 0.2)
                                )
                            VStack {
                                Picker("Select a device", selection: $selectedDeviceType) {
                                    ForEach(DeviceType.allCases) { device in
                                        HStack {
                                            Image(systemName: device.symbolName)
                                            Text(device.rawValue)
                                        }
                                        .tag(device)
                                        
                                    }
                                }
                                
                                .background(.orange)
                                .tint(.white)
                                .cornerRadius(10)
                                .pickerStyle(.menu)
                                
                            }
                            
                            
                            
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        Spacer().frame(height: 16)
                        Button {
                            addDevice(text, selectedDeviceType)
                        } label: {
                            Text("Hinzufügen").foregroundColor(.white).fontWeight(.semibold)
                        }
                        .padding()
                        .background(.orange)
                        .clipShape(.rect)
                        .cornerRadius(10)
                    }
                    Spacer().frame(height: 16)
                    Toggle(isOn: $listView) {
                        Text(listView ? "List" : "Grid")
                    }
                    .tint(.orange)
                    .padding(.horizontal, 16)
                    Spacer().frame(height: 16)
                    if listView{
                        ForEach($smartDevices){ $index in
                            SmartDeviceView(device: $index){
                                deleteDevice(index)
                            }
                            .padding(.horizontal, 16)
                        }
                    } else {
                        
                        Grid {
                            ForEach(Array(stride(from: 0, to: smartDevices.count, by: 3)), id: \.self) { index in
                                GridRow {
                                    ForEach(index..<min(index + 3, smartDevices.count), id: \.self) { subIndex in
                                        DeviceGridView(device: smartDevices[subIndex]){
                                            deleteDevice(smartDevices[subIndex])
                                        }
                                        .padding(.horizontal, 16)
                                    }
                                }
                            }
                        }
                    }
                        
                    Spacer().frame(height: 16)
                    
                    if roomViewShown {
                        RoomView(isShown: $roomViewShown, devices: smartDevices)
                            .padding(.horizontal, 16)
                        
                    }
                    Spacer().frame(height: 16)
                    Toggle(isOn: $roomViewShown) {
                        Text("Raumvorschau anzeigen")
                    }
                    .tint(.orange)
                    .padding(.horizontal, 16)
                    Spacer().frame(height: 16)
                    
                    
                    
                }
                
            }
            
        }
    }
    func addDevice (_ text: String,_ type: DeviceType){
        let newDevice = SmartDevice(name: text, type: type)
        smartDevices.append(newDevice)
    }
    private func deleteDevice(_ device: SmartDevice) {
        if let index = smartDevices.firstIndex(where: { $0.id == device.id }) {
            smartDevices.remove(at: index)
        }
    }
    
}

#Preview {
    SmartHomeView()
}
