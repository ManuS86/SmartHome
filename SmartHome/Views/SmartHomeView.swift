//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var previewOn = true
    @State private var rooms = [
        Room(
            name: "Kitchen",
            smartDevices: [
                SmartDevice(name: "Main", type: .light),
                SmartDevice(name: "AC", type: .ac),
                SmartDevice(name: "Terrace", type: .lock),
                SmartDevice(name: "Heater", type: .thermostat)
            ],
            imageString: "Kitchen"),
        Room(name: "Mobile", smartDevices: [], imageString: "")
    ]
    
    var body: some View {
        VStack {
            Text("My Home")
                .font(.title)
                .bold()
            
            AddDeviceView(rooms: $rooms)
            DeviceListView(rooms: $rooms)
            
            VStack {
                if previewOn {
                    RoomView(previewOn: $previewOn, rooms: $rooms)
                }
                
                Toggle("Display room preview", isOn: $previewOn)
                    .tint(.blue)
                    .padding(8)
            }.frame(maxWidth: .infinity)
            
            AddRoomView(rooms: $rooms)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    SmartHomeView()
}
