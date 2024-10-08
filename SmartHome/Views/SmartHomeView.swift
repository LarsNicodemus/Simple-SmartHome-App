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
        SmartDevice(name: "Heizung", type: DeviceType.thermostat),
        SmartDevice(name: "Haustür", type: DeviceType.lock),
        
    ]
    let rowHeight: CGFloat = 40
    let maxHeight: CGFloat = 400
    
    var body: some View {
        
        VStack(spacing: 0) {
            HeaderView()
                .frame(maxWidth: .infinity)
            
            
            ScrollView {
                VStack {
                    HStack {
                        TextField("Schreib etwas...", text: $text)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.2)
                            )
                        
                        Button {
                            addDevice(text, DeviceType.light)
                        } label: {
                            Text("Hinzufügen").foregroundColor(.white).fontWeight(.semibold)
                        }
                        .padding()
                        .background(.orange)
                        .clipShape(.rect)
                        .cornerRadius(10)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    Toggle(isOn: $listView) {
                        Text(listView ? "List" : "Grid")
                    }
                    .tint(.orange)
                    .padding(.horizontal, 16)
                    
                    if listView{
                        ForEach(smartDevices) { device in
                            DeviceListView(device: device)
                        }
                    } else {
                        
                        Grid {
                                    ForEach(Array(stride(from: 0, to: smartDevices.count, by: 3)), id: \.self) { index in
                                        GridRow {
                                            ForEach(index..<min(index + 3, smartDevices.count), id: \.self) { subIndex in
                                                DeviceGridView(device: smartDevices[subIndex])
                                            }
                                        }
                                    }
                                }
                    }
                    
                    
                    if roomViewShown {
                        RoomView(isShown: $roomViewShown)
                            .padding(16)
                    }
                    
                    Toggle(isOn: $roomViewShown) {
                        Text("Raumvorschau anzeigen")
                    }
                    .tint(.orange)
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    func addDevice (_ text: String,_ type: DeviceType){
        let newDevice = SmartDevice(name: text, type: DeviceType.light)
        smartDevices.append(newDevice)
    }
    
}

#Preview {
    SmartHomeView()
}
