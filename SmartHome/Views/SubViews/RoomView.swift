//
//  RoomView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @State private var selectedRoom = Room(name: "Kitchen", imageString: "Room")
    @Binding var previewOn: Bool
    @Binding var rooms: [Room]
    
    var body: some View {
        VStack {
            HStack {
                Picker("Room Selection", selection: $selectedRoom) {
                    ForEach(rooms, id: \.self) { room in
                        Text(room.name).tag(room)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                
                Image(systemName: "xmark")
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .padding(.top)
                    .padding(.horizontal)
                    .onTapGesture {
                        previewOn = false
                    }
            }
            
            Grid {
                GridRow {
                    HStack {
                        ForEach(selectedRoom.smartDevices) { device in
                            if device.type == .light {
                                VStack {
                                    if device.isOn {
                                        Image(systemName: device.type.image2)
                                            .imageScale(.large)
                                    } else {
                                        Image(systemName: device.type.image)
                                            .imageScale(.large)
                                    }
                                    Text(device.name)
                                        .font(.caption)
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack(spacing: 0) {
                        ForEach(selectedRoom.smartDevices) { device in
                            if device.type == .ac {
                                VStack {
                                    HStack {
                                        if device.temperature > 0 {
                                            Image(systemName: device.type.image)
                                                .imageScale(.large)
                                                .padding(.trailing, 8)
                                            Text(String(format: "%.0f", device.temperature))
                                                .font(.title2)
                                                .padding(.trailing, 2)
                                            Text("°C")
                                                .font(.caption)
                                                .frame(maxHeight: 20, alignment: .top)
                                        } else {
                                            Image(systemName: device.type.image2)
                                                .imageScale(.large)
                                                .padding(.trailing, 8)
                                            Text(String(format: "%.0f", device.temperature))
                                                .font(.title2)
                                                .padding(.trailing, 2)
                                            Text("°C")
                                                .font(.caption)
                                                .frame(maxHeight: 20, alignment: .top)
                                        }
                                    }
                                    Text(device.name)
                                        .font(.caption)
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                    .padding(.top)
                }
                
                GridRow {
                    HStack(spacing: 0) {
                        ForEach(selectedRoom.smartDevices) { device in
                            if device.type == .thermostat {
                                VStack {
                                    HStack {
                                        if device.temperature > 0 {
                                            Image(systemName: device.type.image)
                                                .imageScale(.large)
                                                .padding(.trailing, 8)
                                            Text(String(format: "%.0f", device.temperature))
                                                .font(.title2)
                                                .padding(.trailing, 2)
                                            Text("°C")
                                                .font(.caption)
                                                .frame(maxHeight: 20, alignment: .top)
                                        } else {
                                            Image(systemName: device.type.image2)
                                                .imageScale(.large)
                                                .padding(.trailing, 8)
                                            Text(String(format: "%.0f", device.temperature))
                                                .font(.title2)
                                                .padding(.trailing, 2)
                                            Text("°C")
                                                .font(.caption)
                                                .frame(maxHeight: 20, alignment: .top)
                                        }
                                    }
                                    Text(device.name)
                                        .font(.caption)
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }.padding()
                    
                    
                    HStack {
                        ForEach(selectedRoom.smartDevices) { device in
                            if device.type == .lock {
                                VStack {
                                    if device.isLocked {
                                        Image(systemName: device.type.image)
                                            .imageScale(.large)
                                    } else {
                                        Image(systemName: device.type.image2)
                                            .imageScale(.large)
                                    }
                                    Text(device.name)
                                        .font(.caption)
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }.padding(.horizontal)
                        .padding(.bottom)
                }
            }
        }.frame(maxWidth: .infinity)
            .background(Image(selectedRoom.imageString))
            .cornerRadius(12)
            .shadow(radius: 2, x: 1, y: 1)
    }
}

#Preview {
    RoomView(
        previewOn: .constant(true),
        rooms: .constant([Room(name: "Kitchen", imageString: "Room")])
    )
}
