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
        SmartDevice(name: "Kitchen", type: .light),
        SmartDevice(name: "Living room", type: .ac),
        SmartDevice(name: "Main door", type: .lock),
        SmartDevice(name: "Bed room", type: .thermostat)
    ]
    
    var body: some View {
        VStack {
            Text("My Home")
                .font(.title)
                .bold()
            
            AddDeviceView(smartDevices: $smartDevices, inputText: $inputText, selectedDeviceType: $selectedDeviceType)
            DeviceListView(smartDevices: $smartDevices)
            
            VStack {
                if previewOn {
                    RoomView(previewOn: $previewOn, devices: $smartDevices)
                }
                
                Toggle("Display room preview", isOn: $previewOn)
                    .tint(.blue)
                    .padding(.horizontal, 8)
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
