//
//  RoomView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var isShown: Bool
    @State private var minTemp = 0.0
    @State private var maxTemp = 45.0
    var devices: [SmartDevice]
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isShown.toggle()
                    }) {
                        Text("x")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                }
                
                
                HStack (spacing: 20){
                    ForEach(devices.filter { $0.type == .light }) { device in
                        VStack{
                            Image(systemName: "lamp.ceiling.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(device.isOn ? .orange : .black)
                            Text("\(device.name)")
                                .font(.caption)
                        }
                    }
                }
                
                Spacer()
                HStack (spacing: 20){
                    ForEach(devices.filter { $0.type == .thermostat }) { device in
                        VStack {
                            let imageName = device.temperature <= 10.0 ? "thermometer.low" :
                            device.temperature <= 25.0 ? "thermometer.medium" : "thermometer.high"
                            let temperatureColor: Color = device.temperature <= 10.0 ? .blue :
                            device.temperature <= 25.0 ? .orange : .red
                            Text("\(device.name)")
                                .foregroundColor(temperatureColor)
                                .font(.caption)
                            Gauge(value: device.temperature, in: minTemp...maxTemp){
                                Text("°C")
                                    .foregroundColor(temperatureColor)
                                    .font(.caption)
                            } currentValueLabel: {
                                Text("\(device.temperature.description)")
                                    .foregroundColor(temperatureColor)
                                    .font(.caption)
                            }.gaugeStyle(.accessoryCircular)
                                .tint(Gradient(colors: [.blue, .orange, .red]))
                        }
                    }
                }
                
                Spacer()
                HStack (spacing: 20){
                    ForEach(devices.filter { $0.type == .lock }) { device in
                        let imageName = device.isLocked ? "door.left.hand.closed" : "door.left.hand.open"
                        VStack{
                            Text("\(device.name)")
                                .font(.caption)
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                
            }
            
            .frame(width: .infinity, height: 300)
            
            
        }
    }
}


struct BackgroundView: View {
    var body: some View {
        Image("Room")
            .resizable()
            .frame(width: .infinity, height: 300)
            .clipped()
            .cornerRadius(10)
        
    }
}


#Preview {
    RoomView(isShown: .constant(false),devices: [
        SmartDevice(name: "WZ", type: DeviceType.light),
        SmartDevice(name: "Küche", type: DeviceType.light, isOn: true),
        SmartDevice(name: "Bad", type: DeviceType.light, isOn: true),
        SmartDevice(name: "Wohnzimmer", type: DeviceType.thermostat),
        SmartDevice(name: "Küche", type: DeviceType.thermostat, temperature: 9.0),
        SmartDevice(name: "Schlafzimmer", type: DeviceType.thermostat, temperature: 32.1),
        SmartDevice(name: "Haustür", type: DeviceType.lock, isLocked: false),
        SmartDevice(name: "Balkon", type: DeviceType.lock),
        SmartDevice(name: "Gartenhütte", type: DeviceType.lock, isLocked: false),
        
    ])
}





