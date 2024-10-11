//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 10.10.24.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var device: SmartDevice
    @State private var isAnimating = false

    var onDelete: () -> Void
    var body: some View {
        let imagetype =
        if device.type == DeviceType.light { if device.isOn {
            "lightbulb.max.fill"
        } else
                {
                    "lightbulb.fill"
                }
            } else if device.type == DeviceType.thermostat {
                "thermometer.high"
            } else if device.type == DeviceType.sound { if device.isOn{
                "waveform"
            } else
                {
                    "homepod.fill"
                }
            } else if device.type == DeviceType.powerOutlet {
                "poweroutlet.type.c.square.fill"
            } else { if device.isLocked{ "lock.open.fill"} else {"lock.fill"} }
        
        let lightDisplay =
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                        .symbolEffect(.bounce, value: device.isOn)
                        .frame(width: 20, height: 20)
                        .foregroundColor(device.isOn ? .yellow : .primary)
                        
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
        
        let powerOutletDisplay =
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                        .frame(width: 20, height: 20)
                        .symbolEffect(.bounce, value: device.isOn)
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
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                        .symbolEffect(.bounce, value: device.isLocked)
                        .frame(width: 20, height: 20)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .bold()
                            .font(.caption)
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Button {
                    device.isLocked.toggle()
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        isAnimating = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            isAnimating = false
                        }
                    }
                } label: {
                    Image(systemName: imagetype)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 8)
                        .foregroundStyle(device.isLocked ? .orange : .red)
                        .scaleEffect(isAnimating ? 1.5 : 1.0)
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

        let temperatureDisplay =
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(device.temperature <= 10.0 ? .blue :
                                            device.temperature <= 25.0 ? .orange : .red)
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
        
        let musicDisplay =
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: imagetype)
                        .foregroundStyle(LinearGradient(
                            colors: [.black,.black, .orange, .orange, .orange],
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .symbolEffect(.variableColor, isActive: device.isOn)
                        .frame(width: 20, height: 20)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .bold()
                            .font(.caption)
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if device.isOn
                {
                    VStack{
                        Slider(value: $device.volume, in: 0...100, step: 1) {
                            EmptyView()
                        } minimumValueLabel: {
                            Text("0")
                                .font(.caption)
                        } maximumValueLabel: {
                            Text("100")
                                .font(.caption)
                        }
                        .tint(.orange)
                        .frame(width: 150)
                        Text("vol. \(Int(device.volume))%")
                            .font(.caption)
                    }
                }
                Toggle(isOn: $device.isOn) {
                }
                .tint(.orange)
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
        case .thermostat:
            temperatureDisplay
        case .sound:
            musicDisplay
        case .powerOutlet:
            powerOutletDisplay
        }

    }

}

#Preview {
    SmartDeviceView(
        device: .constant(
            MOCKDEVICE1),
        onDelete: { print("gelöscht") })
    SmartDeviceView(
        device: .constant(MOCKDEVICE4),
        onDelete: { print("gelöscht") })
    SmartDeviceView(
        device: .constant(
            MOCKDEVICE7),
        onDelete: { print("gelöscht") })
    SmartDeviceView(
        device: .constant(
            MOCKDEVICE10),
        onDelete: { print("gelöscht") })
    SmartDeviceView(
        device: .constant(
            MOCKDEVICE13),
        onDelete: { print("gelöscht") })
}
