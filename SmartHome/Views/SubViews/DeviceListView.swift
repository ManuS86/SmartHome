//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct DeviceListView: View {
    @Binding var rooms: [Room]
    
    var body: some View {
        List {
            ForEach($rooms) { room in
                Section(room.wrappedValue.name) {
                    ForEach(room.smartDevices) { device in
                        DeviceView(smartDevice: device)
                    }
                    .onDelete { offset in
                        room.wrappedValue.smartDevices.remove(atOffsets: offset)
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                }
            }
        }
        .listStyle(.plain)
        .padding(.vertical, 8)
    }
}

#Preview {
    DeviceListView(rooms: .constant([
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
    ]))
}
