//
//  AddDeviceView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct AddDeviceView: View {
    @State private var inputText = ""
    @State private var selectedDeviceType = DeviceType.light
    @State private var selectedRoom = Room(name: "Kitchen", imageString: "Room")
    @Binding var smartDevices: [SmartDevice]
    @Binding var rooms: [Room]
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Picker("Room Selection", selection: $selectedRoom) {
                    ForEach(rooms, id: \.self) { room in
                            Text(room.name).tag(room)
                    }
                }
                
                Spacer()
                Picker("Device Type", selection: $selectedDeviceType) {
                    ForEach(DeviceType.allCases) { deviceType in
                        HStack {
                            Text(deviceType.rawValue)
                            Image(systemName: deviceType.image)
                        }.tag(deviceType)
                    }
                }
            }
            
            TextField("Enter device name", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
        }
        
        Button(action: {
            selectedRoom.smartDevices.append(SmartDevice(name: inputText, type: selectedDeviceType))
            smartDevices.append(SmartDevice(name: inputText, type: selectedDeviceType))
        }) {
            Text("Add")
                .frame(width: 200)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}
