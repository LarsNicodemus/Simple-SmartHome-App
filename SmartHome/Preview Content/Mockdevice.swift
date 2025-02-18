//
//  Mockdevice.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 11.10.24.
//

var MOCKDEVICE1 = SmartDevice(name: "Mock Lamp 1", type: .light)
var MOCKDEVICE2 = SmartDevice(name: "Mock Lamp 2", type: .light)
var MOCKDEVICE3 = SmartDevice(name: "Mock Lamp 3", type: .light)
var MOCKDEVICE4 = SmartDevice(name: "Mock Lock 1", type: .lock, isLocked: false)
var MOCKDEVICE5 = SmartDevice(name: "Mock Lock 2", type: .lock)
var MOCKDEVICE6 = SmartDevice(name: "Mock Lock 3", type: .lock)
var MOCKDEVICE7 = SmartDevice(name: "Mock Temp 1", type: .thermostat)
var MOCKDEVICE8 = SmartDevice(name: "Mock Temp 2", type: .thermostat)
var MOCKDEVICE9 = SmartDevice(name: "Mock Temp 3", type: .thermostat)
var MOCKDEVICE10 = SmartDevice(name: "Mock Sound 1", type: .sound, isOn: true)
var MOCKDEVICE11 = SmartDevice(name: "Mock Sound 2", type: .sound)
var MOCKDEVICE12 = SmartDevice(name: "Mock Sound 3", type: .sound)
var MOCKDEVICE13 = SmartDevice(name: "Mock Power 1", type: .powerOutlet, isOn: true)
var MOCKDEVICE14 = SmartDevice(name: "Mock Power 2", type: .powerOutlet)
var MOCKDEVICE15 = SmartDevice(name: "Mock Power 3", type: .powerOutlet)


var mockDevices = [
    SmartDevice(name: "Wohnzimmerlicht", type: DeviceType.light),
    SmartDevice(
        name: "Wohnzimmerlicht", type: DeviceType.light, isOn: true),
    SmartDevice(
        name: "Wohnzimmerlicht", type: DeviceType.light, isOn: true),
    SmartDevice(name: "Heizung", type: DeviceType.thermostat),
    SmartDevice(
        name: "Heizung", type: DeviceType.thermostat, temperature: 9.0),
    SmartDevice(
        name: "Heizung", type: DeviceType.thermostat, temperature: 32.1),
    SmartDevice(name: "Haustür", type: DeviceType.lock, isLocked: false),
    SmartDevice(name: "Haustür", type: DeviceType.lock),
    SmartDevice(name: "Haustür", type: DeviceType.lock, isLocked: false),

]
