//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct DeviceListView: View {
    @Binding var smartDevices: [SmartDevice]
    
    var body: some View {
        List {
            Section("Lights") {
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .light {
                        SmartDeviceView(smartDevice: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            
            Section("Air Conditioners") {
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .ac {
                        SmartDeviceView(smartDevice: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            
            Section("Heaters") {
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .thermostat {
                        SmartDeviceView(smartDevice: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            
            Section("Locks") {
                ForEach($smartDevices) { device in
                    if device.wrappedValue.type == .lock {
                        SmartDeviceView(smartDevice: device)
                    }
                }
                .onDelete(perform: removeItem)
                .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
        }
        .listStyle(.plain)
        .padding(.vertical, 8)
    }
    
    func removeItem(indexSet: IndexSet) {
        smartDevices.remove(atOffsets: indexSet)
    }
}

#Preview {
    DeviceListView(smartDevices: .constant([
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Living room light", type: .ac),
        SmartDevice(name: "Radiator", type: .thermostat),
        SmartDevice(name: "Main door", type: .lock)
    ]))
}
