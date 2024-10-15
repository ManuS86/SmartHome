//
//  AddDeviceView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct AddDeviceView: View {
    @Binding var smartDevices: [SmartDevice]
    @Binding var inputText: String
    @Binding var selectedDeviceType: DeviceType
    
    var body: some View {
        HStack {
            TextField("Enter device name", text: $inputText)
                .padding(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
            
            Picker("Device Type", selection: $selectedDeviceType) {
                ForEach(DeviceType.allCases) { deviceType in
                    HStack {
                        Image(systemName: deviceType.image)
                            .padding(.trailing, 2)
                        Text(deviceType.rawValue)
                    }.tag(deviceType)
                }
            }
        }
        
        Button(action: {
            smartDevices.append(SmartDevice(name: inputText, type: selectedDeviceType))
        }) {
            Text("Add")
                .frame(width: 240)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}
