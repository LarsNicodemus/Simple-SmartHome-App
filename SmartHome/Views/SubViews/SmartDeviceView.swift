//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 10.10.24.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var device: SmartDevice
    var onDelete: () -> Void
    var body: some View {
        let imagetype = if device.type == DeviceType.light {"lightbulb.fill"} else if device.type == DeviceType.thermostat {"thermometer.high"} else {"lock.fill"}
        let lockImage = if device.isLocked {"lock.fill"} else {"lock.open.fill"}
        let lightDisplay =
        HStack{
            HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .bold()
                            .font(.caption)
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                }
                        .frame(maxWidth: .infinity, alignment: .leading)
            Toggle(isOn: $device.isOn) {
            }
        }
        .tint(.orange)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .contextMenu {
                    Button(role: .destructive) {
                        onDelete()
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
        
        let lockDisplay =
        HStack{
            HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .bold()
                            .font(.caption)
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                }
                        .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: lockImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.horizontal, 8)
                .foregroundStyle(device.isLocked ? .orange : .red)
            
        }
        .tint(.orange)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .contextMenu {
                    Button(role: .destructive) {
                        onDelete()
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
        
        let temperatureDisplay =
        HStack{
            HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .bold()
                            .font(.caption)
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                Spacer().frame(width: 16)
                Text("\(device.temperature.description) °C")
                    .font(.caption)
                }
                        .frame(maxWidth: .infinity, alignment: .leading)
            
            Slider(value: $device.temperature, in: 0...45, step: 0.5) {
                EmptyView()
            } minimumValueLabel: {
                Text("0.0")
                    .font(.caption)
            } maximumValueLabel: {
                Text("45.0")
                    .font(.caption)
            }
            .tint(.orange)
            .frame(width: 150)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .contextMenu {
                    Button(role: .destructive) {
                        onDelete()
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
        
        
        
            switch device.type {
            case .light:
                lightDisplay
            case .lock:
                lockDisplay
            case . thermostat:
                temperatureDisplay
            }
        
    }
    
}


#Preview {
    SmartDeviceView(device: .constant(SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light)), onDelete: {print("gelöscht")})
    SmartDeviceView(device: .constant(SmartDevice(name: "Haustür", type: DeviceType.lock)), onDelete: {print("gelöscht")})
    SmartDeviceView(device: .constant(SmartDevice(name: "Schlafzimmer", type: DeviceType.thermostat)), onDelete: {print("gelöscht")})
}


