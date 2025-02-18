//
//  SmartDeviceGridView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 20.11.24.
//
import SwiftUI

struct SmartDeviceGridView: View {
    @Binding var device: SmartDevice
    @State private var isAnimating = false

    var onDelete: () -> Void
    var body: some View {
        let imagetype =
            switch (device.type, device.isOn, device.isLocked) {
            case (.light, true, _): "lightbulb.max.fill"
            case (.light, false, _): "lightbulb.fill"
            case (.thermostat, _, _): "thermometer.high"
            case (.sound, true, _): "waveform"
            case (.sound, false, _): "homepod.fill"
            case (.powerOutlet, _, _): "poweroutlet.type.c.square.fill"
            case (_, _, true): "lock.open.fill"
            case (_, _, false): "lock.fill"
            }

        let lightDisplay =
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("\(device.name)")
                            .font(.system(size: 20, weight: .semibold))
                            .bold()
                            .padding(.trailing)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: imagetype)
                        .resizable()
                        .scaledToFit()
                        .symbolEffect(.bounce, value: device.isOn)
                        .foregroundColor(device.isOn ? .yellow : .primary)
                }
                .frame(height: 100)
                Spacer()
                HStack {

                    VStack(alignment: .leading, spacing: 2) {

                        Text("\(device.type.rawValue)")
                            .font(.caption)
                    }
                    Toggle(isOn: $device.isOn) {

                    }
                }

            }
            .frame(width: 150, height: 150)
            .tint(.orange)
            .padding()
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
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("\(device.name)")
                            .font(.system(size: 20, weight: .semibold))
                            .bold()
                            .padding(.trailing)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: imagetype)
                        .resizable()
                        .scaledToFit()
                        .symbolEffect(.bounce, value: device.isOn)
                        .foregroundColor(device.isOn ? .orange : .primary)
                }
                .frame(height: 70)
                Spacer()
                HStack {
                    Text("\(device.type.rawValue)")
                        .font(.caption)
                    Toggle(isOn: $device.isOn) {
                    }
                }
            }
            .frame(width: 150, height: 150)
            .tint(.orange)
            .padding()

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

            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("\(device.name)")
                            .font(.system(size: 20, weight: .semibold))
                            .bold()
                            .padding(.trailing)
                        Spacer()
                    }
                }
                .frame(height: 70)
                Spacer()
                HStack {
                    VStack {
                        Spacer()
                        Text("\(device.type.rawValue)")
                            .font(.caption)
                            .padding(.bottom, 16)

                    }
                    Spacer()
                    Button {
                        device.isLocked.toggle()
                        withAnimation(
                            .spring(response: 0.3, dampingFraction: 0.3)
                        ) {
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
                            .foregroundStyle(device.isLocked ? .orange : .red)
                            .scaleEffect(isAnimating ? 1.5 : 1.0)
                    }
                }
                .padding(.bottom, 8)

            }
            .frame(width: 150, height: 150)
            .tint(.orange)
            .padding()

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
            VStack(alignment: .leading) {

                HStack {
                    VStack {
                        Text("\(device.name)")
                            .font(.system(size: 20, weight: .semibold))
                            .bold()
                            .padding(.trailing)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: imagetype)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(
                            device.temperature <= 10.0
                                ? .blue
                                : device.temperature <= 25.0 ? .orange : .red)
                }
                .frame(height: 70)
                Spacer()
                HStack {
                    Text("\(device.type.rawValue)")
                        .font(.caption)
                    Spacer()
                    Text("\(device.temperature.description) °C")
                        .font(.caption)
                }
                .padding(.bottom)
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
                .frame(width: 160)
            }

            .frame(width: 150, height: 150)
            .padding()

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
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(device.name)")
                            .font(.system(size: 20, weight: .semibold))
                            .bold()
                            .padding(.trailing)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: imagetype)
                        .resizable()
                        .scaledToFit()

                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .black, .black, .orange, .orange, .orange,
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .symbolEffect(.variableColor, isActive: device.isOn)
                        
                   
                }
                .frame(height: 70)
                Spacer()
                if device.isOn {
                    VStack {

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

                    }
                    .padding(.bottom, 8)
                }
                
                HStack {
                    Text("\(device.type.rawValue)")
                        .font(.caption)
                    Spacer()
                    Text("vol. \(Int(device.volume))%")
                        .font(.caption)
                    Spacer()
                    Toggle(isOn: $device.isOn) {
                    }
                    .tint(.orange)
                }

            }
            .frame(width: 150, height: 150)

            .padding()

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
    SmartDeviceGridView(
        device: .constant(
            MOCKDEVICE4),
        onDelete: { print("gelöscht") })
    SmartDeviceGridView(
        device: .constant(
            MOCKDEVICE7),
        onDelete: { print("gelöscht") })
    SmartDeviceGridView(
        device: .constant(
            MOCKDEVICE10),
        onDelete: { print("gelöscht") })
    SmartDeviceGridView(
        device: .constant(
            MOCKDEVICE13),
        onDelete: { print("gelöscht") })
}
