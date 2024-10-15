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
    @Binding var selectedRoom: Room
    @Binding var smartDevices: [SmartDevice]
    @Binding var rooms: [Room]
    
    init(smartDevices: Binding<[SmartDevice]>, rooms: Binding<[Room]>) {
        self._smartDevices = smartDevices
        self._rooms = rooms
        if let room = rooms.first {
            self._selectedRoom = room
        } else {
            self._selectedRoom = Binding(get: { Room(name: "Kitchen", imageString: "Kitchen") }, set: { _ in })
        }
    }
    
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
            let device = SmartDevice(name: inputText, type: selectedDeviceType)
            selectedRoom.smartDevices.append(device)
            smartDevices.append(device)
        }) {
            Text("Add")
                .frame(width: 200)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}
