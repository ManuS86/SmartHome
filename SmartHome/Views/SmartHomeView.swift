//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var previewOn = true
    @State private var smartDevices = [
        SmartDevice(name: "Kitchen", type: .light),
        SmartDevice(name: "Living room", type: .ac),
        SmartDevice(name: "Main door", type: .lock),
        SmartDevice(name: "Bed room", type: .thermostat)
    ]
    @State private var rooms = [
        Room(
            name: "Kitchen",
            smartDevices: [
            SmartDevice(name: "Kitchen", type: .light),
            SmartDevice(name: "Living room", type: .ac),
            SmartDevice(name: "Main door", type: .lock),
            SmartDevice(name: "Bed room", type: .thermostat)
        ],
             imageString: "Room")
    ]
    
    var body: some View {
        VStack {
            Text("My Home")
                .font(.title)
                .bold()
            
            AddDeviceView(smartDevices: $smartDevices, rooms: $rooms)
            DeviceListView(smartDevices: $smartDevices)
            
            VStack {
                if previewOn {
                    RoomView(previewOn: $previewOn, rooms: $rooms)
                }
                
                Toggle("Display room preview", isOn: $previewOn)
                    .tint(.blue)
                    .padding(8)
            }.frame(maxWidth: .infinity)
            
            AddRoomView(smartDevices: $smartDevices, rooms: $rooms)
        }.padding()
    }
}

#Preview {
    SmartHomeView()
}
