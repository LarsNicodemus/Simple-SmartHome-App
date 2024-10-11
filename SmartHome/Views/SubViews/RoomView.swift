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
                .shadow(color: .orange,radius: 2,y: 2)
            
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
                
                
                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
                                        ForEach(devices.filter { $0.type == .light }) { device in
                                            VStack {
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
                                    .padding(.horizontal, 16)
                                }
                                .padding(.top, -85)
                                .frame(height: 80)
                

                
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack (spacing: 20){
                        ForEach(devices.filter { $0.type == .thermostat }) { device in
                            VStack {
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
                                    .tint(Gradient(colors: [.blue, .orange, .orange, .red, .red]))
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, -45)
                .frame(height: 80)
                Spacer()
                ScrollView(.horizontal){
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
                    .padding(.horizontal, 16)
                }
                
                
                
            }
            
            .frame(maxHeight: 300)
            
            
        }
        
    }
}


struct BackgroundView: View {
    var body: some View {
        Image("Room")
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: 300)
            .cornerRadius(10)
        
    }
}


#Preview {
    RoomView(isShown: .constant(false),devices: [
        MOCKDEVICE1,
        MOCKDEVICE2,
        MOCKDEVICE3,
        MOCKDEVICE4,
        MOCKDEVICE5,
        MOCKDEVICE6,
        MOCKDEVICE7,
        MOCKDEVICE8,
        MOCKDEVICE9,
        
    ])
}





