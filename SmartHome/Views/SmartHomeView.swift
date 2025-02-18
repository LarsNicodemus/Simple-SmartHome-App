//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @StateObject private var homeVM = HomeViewModel()

    var body: some View {

        ZStack {
            
            VStack(spacing: 0) {
                HeaderView()
                    .frame(maxWidth: .infinity)

                Spacer().frame(height: 16)
                
                ScrollView {
                    
                    VStack {
                        VStack {
                            HStack {
                                TextField("Bezeichnung eingeben..", text: $homeVM.text)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 0.2)
                                    )
                                VStack {
                                    Picker(
                                        "Select a device",
                                        selection: $homeVM.selectedDeviceType
                                    ) {
                                        ForEach(DeviceType.allCases) { device in
                                            HStack {
                                                Image(
                                                    systemName: device
                                                        .symbolName)
                                                Text(device.rawValue).tag(
                                                    device.rawValue)
                                            }
                                            .tag(device)

                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .background(.orange)
                                    .tint(.white)
                                    .cornerRadius(10)

                                }
                            }
                            .padding(.top, 16)
                            Spacer().frame(height: 16)
                            Button {
                                homeVM.addDevice(homeVM.text, homeVM.selectedDeviceType)
                            } label: {
                                Text("Hinzufügen").foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .background(.orange)
                            .clipShape(.rect)
                            .cornerRadius(10)
                        }
                        
                        
                        Spacer().frame(height: 16)
                        Toggle(isOn: $homeVM.listView) {
                            Text(homeVM.listView ? "List" : "Grid")
                        }
                        .tint(.orange)
                        Spacer().frame(height: 16)
                        if homeVM.listView {
                            ForEach($homeVM.smartDevices) { $index in
                                SmartDeviceView(device: $index) {
                                    homeVM.deleteDevice(index)
                                }
                            }
                        } else {

                            Grid {
                                ForEach(
                                    Array(
                                        stride(
                                            from: 0, to: homeVM.smartDevices.count,
                                            by: 3)), id: \.self
                                ) { index in
                                    GridRow {
                                        ForEach(
                                            index..<min(
                                                index + 3, homeVM.smartDevices.count),
                                            id: \.self
                                        ) { subIndex in
                                            DeviceGridView(
                                                device: homeVM.smartDevices[subIndex]
                                            ) {
                                                homeVM.deleteDevice(
                                                    homeVM.smartDevices[subIndex])
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Spacer().frame(height: 16)

                        if homeVM.roomViewShown {
                            RoomView(
                                isShown: $homeVM.roomViewShown, devices: homeVM.smartDevices)

                        }
                        Spacer().frame(height: 16)
                        Toggle(isOn: $homeVM.roomViewShown) {
                            Text("Raumvorschau anzeigen")
                        }
                        .tint(.orange)
                        Spacer().frame(height: 16)

                    }.padding(.horizontal, 16)

                }

            }
//            if showingPopover {
//                PopOverView()
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .offset(x: 70, y: -190)
//            }
            
        }
       
    }

    

}

#Preview {
    SmartHomeView()
}
