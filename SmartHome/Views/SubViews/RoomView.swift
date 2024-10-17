//
//  RoomView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var previewOn: Bool
    @Binding var rooms: [Room]
    @State var currentIndex = 0
        
    var body: some View {
        VStack {
            HStack {
                Picker("Room Selection", selection: $currentIndex) {
                    ForEach(Array(rooms.enumerated()), id: \.element) { index, room in
                        Text(rooms[index].name).tag(index)
                    }
                }
                .background(.white)
                .padding()
                
                Image(systemName: "xmark")
                    .padding(8)
                    .background(.white)
                    .padding(8)
                    .padding(.trailing, 8)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .onTapGesture {
                        previewOn = false
                    }
            }
            
            Grid {
                GridRow {
                    HStack {
                        ForEach(rooms[currentIndex].smartDevices) { device in
                            if device.type == .light {
                                VStack {
                                    if device.isOn {
                                        Image(systemName: device.type.image2)
                                            .imageScale(.large)
                                            .onTapGesture {

                                            }
                                    } else {
                                        Image(systemName: device.type.image)
                                            .imageScale(.large)
                                            .onTapGesture {
                                            }
                                    }
                                        Text(device.name)
                                        .font(.caption)
                                }
                                .padding()
                                .frame(width: 130, height: 80)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }.padding(.trailing, 8)
                    
                    HStack(spacing: 0) {
                        ForEach(rooms[currentIndex].smartDevices) { device in
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
                                .frame(width: 130, height: 80)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                }.padding(.bottom, 8)
                
                GridRow {
                    HStack(spacing: 0) {
                        ForEach(rooms[currentIndex].smartDevices) { device in
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
                                .frame(width: 130, height: 80)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }.padding(.trailing, 8)
                    
                    
                    HStack {
                        ForEach(rooms[currentIndex].smartDevices) { device in
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
                                .frame(width: 130, height: 80)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }.frame(maxWidth: .infinity)
            .background(rooms[currentIndex].image.resizable().scaledToFill())
            .cornerRadius(12)
            .shadow(radius: 2, x: 1, y: 1)
    }
}

#Preview {
    RoomView(
        previewOn: .constant(true),
        rooms: .constant([Room(name: "Kitchen", imageString: "Kitchen")])
    )
}
