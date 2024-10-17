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
    @Binding var rooms: [Room]
    @State var currentIndex = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Picker("Room Selection", selection: $currentIndex) {
                    ForEach(Array(rooms.enumerated()), id: \.element) { index, room in
                        Text(rooms[index].name).tag(index)
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
            rooms[currentIndex].smartDevices.append(SmartDevice(name: inputText, type: selectedDeviceType))
        }) {
            Text("Add")
                .frame(width: 200)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}
