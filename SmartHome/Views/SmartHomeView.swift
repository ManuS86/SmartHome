//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var inputText = ""
    @State private var previewOn = true
    @State private var selectedDeviceType = DeviceType.light
    @State private var smartDevices = [
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Radiator", type: .thermostat),
        SmartDevice(name: "Main door", type: .lock)
    ]
    
    var body: some View {
        VStack {
            Text("My Home")
                .font(.title)
                .bold()
            
            HStack {
                TextField("Enter device name", text: $inputText)
                    .padding(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 8)
                
                Picker("Device Type", selection: $selectedDeviceType) {
                    ForEach(DeviceType.allCases) { deviceType in
                        Image(systemName: deviceType.image).tag(deviceType)
                    }
                }
            }
            
            Button(action: {
                smartDevices.append(SmartDevice(name: inputText, type: selectedDeviceType))
            }) {
                Text("Add")
                    .frame(width: 250)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            
            VStack {
                ForEach(smartDevices) { device in
                    HStack {
                        Text(device.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: device.type.image)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical)
                
            VStack {
                if previewOn {
                    RoomView(previewOn: $previewOn, devices: $smartDevices)
                }
                
                Toggle("Display room preview", isOn: $previewOn)
                    .tint(.blue)
                    .padding(.horizontal)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

#Preview {
    SmartHomeView()
}
