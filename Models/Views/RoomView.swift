//
//  RoomView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var previewOn: Bool
    @Binding var devices: [SmartDevice]
    
    var body: some View {
                VStack {
                    Image(systemName: "xmark")
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .padding(.top)
                        .padding(.horizontal)
                        .onTapGesture {
                            previewOn = false
                        }
                    
                    HStack {
                        ForEach(devices) { device in
                            if device.type == .light {
                                if device.isOn {
                                    Image(systemName: "lightbulb.min")
                                        .imageScale(.large)
                                } else {
                                    Image(systemName: "lightbulb")
                                        .imageScale(.large)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        ForEach(devices) { device in
                            if device.type == .thermostat {
                                if device.temperature > 0 {
                                    Image(systemName: "thermometer")
                                        .imageScale(.large)
                                    Text("\(String(format: "%.0f", device.temperature)) °C")
                                } else {
                                    Image(systemName: "thermometer.medium.slash")
                                        .imageScale(.large)
                                    Text("\(String(format: "%.0f", device.temperature)) °C")
                                }
                            }
                        }
                    }
                    .padding()

                    
                    HStack {
                        ForEach(devices) { device in
                            if device.type == .lock {
                                if device.isLocked {
                                    Image(systemName: "lock.fill")
                                        .imageScale(.large)
                                } else {
                                    Image(systemName: "lock.open.fill")
                                        .imageScale(.large)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)

            }
            .frame(maxWidth: .infinity)
            .background()
            .cornerRadius(12)
            .shadow(radius: 2, x: 1, y: 1)
    }
}

#Preview {
    RoomView(previewOn: .constant(true), devices: .constant([
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Radiator", type: .thermostat),
        SmartDevice(name: "Main door", type: .lock)
    ]))
}
