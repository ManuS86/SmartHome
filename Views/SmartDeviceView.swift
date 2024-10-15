//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var device: SmartDevice
    @State var inputText: String = ""
    
    var body: some View {
        HStack {
            if (device.isLocked == true && device.type == .lock) || (device.isOn == false && device.type == .light) || (device.temperature != 0 && device.type == .thermostat) {
                Image(systemName: device.type.image)
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
            } else {
                Image(systemName: device.type.image2)
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
            }
            
            if device.type == .light {
                Toggle(device.name, isOn: $device.isOn)
                    .tint(.blue)
            }
            
            if device.type == .thermostat {
                HStack(spacing: 0) {
                    Text(device.name)
                    Spacer()
                    TextField(inputText, text: $inputText)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: 22)
                        .padding(.trailing, 2)
                        .onChange(of: inputText) { oldValue, newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                inputText = filtered
                            } else {
                                inputText = String(format: "%.0f", device.temperature)
                            }
                            device.temperature = Double(newValue) ?? 0
                        }
                    Text("°C")
                        .font(.caption)
                        .frame(maxHeight: 16, alignment: .top)
                        .padding(.trailing, 8)
                    Stepper("", value: $device.temperature, in: 0...30, onEditingChanged: { bool in
                        inputText = String(format: "%.0f", device.temperature)
                    })
                    .frame(maxWidth: 96)
                }
            }
            
            if device.type == .lock {
                Text(device.name)
                Spacer()
                if device.isLocked {
                    Button("Locked", action: { device.isLocked = false })
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                }
                if !device.isLocked {
                    Button("Unlocked", action: { device.isLocked = true })
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .onAppear {
            inputText = String(format: "%.0f", device.temperature)
        }

    }
}

#Preview {
   SmartDeviceView(device:.constant(
    SmartDevice(name: "Living room", type: .thermostat)
   ))
}
