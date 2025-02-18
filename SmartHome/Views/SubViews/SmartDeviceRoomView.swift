//
//  SmartDeviceRoomView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct SmartDeviceRoomView: View {
        @State private var minTemp = 0.0
        @State private var maxTemp = 45.0
        @ObservedObject var homeVM: HomeViewModel
        
        
        var body: some View {
            
                VStack {
                    ScrollView(.horizontal) {
                                        HStack(spacing: 20) {
                                            ForEach(homeVM.smartDevices.filter { $0.type == .light }) { device in
                                                
                                                VStack {
                                                    Image(systemName: "lamp.ceiling.fill")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 60, height: 60)
                                                        .foregroundStyle(device.isOn ? .orange : .black)
                                                    Text("\(device.name)")
                                                        .font(.caption)
                                                }
                                                .onTapGesture {
                                                    if let index = homeVM.smartDevices.firstIndex(where: { $0.id == device.id }) {
                                                            homeVM.smartDevices[index].isOn.toggle()
                                                        }
                                                }
                                            }
                                        }
                                        .padding(.horizontal, 16)
                                    }
                    .scrollIndicators(.hidden)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 10)
                                    .frame(height: 80)
                    

                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        HStack (spacing: 20){
                            ForEach(homeVM.smartDevices.filter { $0.type == .thermostat }) { device in
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
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, 16)
                    .padding(.top)
                    .frame(height: 80)
                    Spacer()
                    ScrollView(.horizontal){
                        HStack (spacing: 20){
                            ForEach(homeVM.smartDevices.filter { $0.type == .lock }) { device in
                                let imageName = device.isLocked ? "door.left.hand.closed" : "door.left.hand.open"
                                VStack{
                                    Text("\(device.name)")
                                        .font(.caption)
                                    Image(systemName: imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 80)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, 16)
                    
                    
                }
                .background(
                    BackgroundView2()
                        .shadow(color: .orange,radius: 2,y: 2)
                )
                
                
            
            
        }
    }


    struct BackgroundView2: View {
        var body: some View {
            Image("HomeBG")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
        }
    }


    #Preview {
        SmartDeviceRoomView( homeVM: HomeViewModel())
    }





