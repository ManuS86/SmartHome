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
        SmartDevice(name: "Living room", type: .light),
        SmartDevice(name: "Main door", type: .lock),
        SmartDevice(name: "Bed room", type: .thermostat)
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
                    .frame(width: 240)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            
            List {
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .light {
                        SmartDeviceView(device: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2))
                
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .thermostat {
                        SmartDeviceView(device: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2))
                
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .lock {
                        SmartDeviceView(device: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2))
            }
            .listStyle(.plain)
            
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
    
    func removeItem(indexSet: IndexSet) {
        smartDevices.remove(atOffsets: indexSet)
    }
}

#Preview {
    SmartHomeView()
}
