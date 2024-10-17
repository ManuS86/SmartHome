//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 10.10.24.
//

import SwiftUI

struct DeviceView: View {
    @State var inputText: String = ""
    @Binding var smartDevice: SmartDevice
    
    var body: some View {
        HStack(spacing: 0) {
            if (smartDevice.isLocked == true && smartDevice.type == .lock) || (smartDevice.isOn == false && smartDevice.type == .light) || (smartDevice.temperature != 0 && (smartDevice.type == .thermostat || smartDevice.type == .ac)) {
                Image(systemName: smartDevice.type.image)
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                    .onTapGesture {
                        if (smartDevice.isLocked == true && smartDevice.type == .lock) || (smartDevice.isOn == false && smartDevice.type == .light) || (smartDevice.temperature != 0 && (smartDevice.type == .thermostat || smartDevice.type == .ac)) {
                            smartDevice.isLocked.toggle()
                            smartDevice.isOn.toggle()
                            smartDevice.temperature = 0.0
                            inputText = String(format: "%.0f", smartDevice.temperature)
                        }
                    }
            } else {
                Image(systemName: smartDevice.type.image2)
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                    .onTapGesture {
                        if (smartDevice.isLocked == false && smartDevice.type == .lock) || (smartDevice.isOn == true && smartDevice.type == .light) || (smartDevice.temperature == 0 && (smartDevice.type == .thermostat || smartDevice.type == .ac)) {
                            smartDevice.isLocked.toggle()
                            smartDevice.isOn.toggle()
                            smartDevice.temperature = 20.0
                            inputText = String(format: "%.0f", smartDevice.temperature)
                        }
                    }
            }
            
            if smartDevice.type == .light {
                Toggle(smartDevice.name, isOn: $smartDevice.isOn)
                    .tint(.blue)
            }
            
            if smartDevice.type == .ac {
                HStack(spacing: 0) {
                    Text(smartDevice.name)
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
                                inputText = String(format: "%.0f", smartDevice.temperature)
                            }
                            smartDevice.temperature = Double(newValue) ?? 0
                        }
                    Text("°C")
                        .font(.caption)
                        .frame(maxHeight: 16, alignment: .top)
                        .padding(.trailing, 8)
                    Stepper("", value: $smartDevice.temperature, in: 0...30, onEditingChanged: { bool in
                        inputText = String(format: "%.0f", smartDevice.temperature)
                    })
                    .frame(maxWidth: 96)
                }
            }
            
            if smartDevice.type == .thermostat {
                HStack(spacing: 0) {
                    Text(smartDevice.name)
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
                                inputText = String(format: "%.0f", smartDevice.temperature)
                            }
                            smartDevice.temperature = Double(newValue) ?? 0
                        }
                    Text("°C")
                        .font(.caption)
                        .frame(maxHeight: 16, alignment: .top)
                        .padding(.trailing, 8)
                    Stepper("", value: $smartDevice.temperature, in: 0...30, onEditingChanged: { bool in
                        inputText = String(format: "%.0f", smartDevice.temperature)
                    })
                    .frame(maxWidth: 96)
                }
            }
            
            if smartDevice.type == .lock {
                HStack(spacing: 0) {
                    Text(smartDevice.name)
                    Spacer()
                    if smartDevice.isLocked {
                        Button(action: { smartDevice.isLocked = false }) {
                            Text("Locked")
                                .frame(width: 72)
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(.red)
                    }
                    if !smartDevice.isLocked {
                        Button(action: { smartDevice.isLocked = true }) {
                            Text("Unlocked")
                                .frame(width: 72)
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                    }
                }
            }
        }.padding(.vertical)
        .frame(maxWidth: .infinity)
        .onAppear {
            inputText = String(format: "%.0f", smartDevice.temperature)
        }
    }
}

#Preview {
   DeviceView(smartDevice:.constant(
    SmartDevice(name: "Living room", type: .lock)
   ))
}
