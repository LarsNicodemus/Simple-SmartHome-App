//
//  HomeView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    @State private var selection = 1
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        GeometryReader { _ in
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                        Spacer()
                        ForEach(ViewSelection.allCases) { view in
                            Button(view.rawValue, systemImage: view.symbolName)
                            {
                                selection = view.selection
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(selection == view.selection ? .orange : .gray)
                            .tag(view)
                        }

                    }
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
                        Button {
                            homeVM.addDevice(
                                homeVM.text, homeVM.selectedDeviceType)
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                        .bold()
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                    }
                }
                .padding(.horizontal)

            }
        }
        .frame(height: 90)
        .task {
            homeVM.smartDevices.append(contentsOf: mockDevices)
        }
        switch selection {
        case 1:
            ScrollView {

                ForEach($homeVM.smartDevices) { $index in
                    SmartDeviceView(device: $index) {
                        homeVM.deleteDevice(index)
                    }
                }
            }
            .padding(.horizontal)
        case 2:
            let Indices = Array(
                stride(from: 0, to: homeVM.smartDevices.count, by: 1))
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Indices, id: \.self) { index in
                        SmartDeviceGridView(device: $homeVM.smartDevices[index], onDelete: {
                            homeVM.deleteDevice(homeVM.smartDevices[index])
                        })
                    }
                }
            }
            .padding(.horizontal)
        case 3:
            VStack {
                Spacer()
                SmartDeviceRoomView(homeVM: homeVM)
                Spacer()
            }
        default:
            Text("keine Anzeige")
        }

    }
}

#Preview {
    HomeView()
}
