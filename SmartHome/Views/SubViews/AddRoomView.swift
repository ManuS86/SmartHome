//
//  AddRoomView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 11.10.24.
//

import SwiftUI
import PhotosUI

struct AddRoomView: View {
    @State private var inputText = ""
    @State private var imageItem: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var imageString: String?
    @Binding var rooms: [Room]
    
    var body: some View {
        HStack {
            TextField("Enter room name", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            PhotosPicker("\(Image(systemName: "camera.fill"))", selection: $imageItem, matching: .images)
        }
        .onChange(of: imageItem) {
            Task {
                if let loaded = try? await imageItem?.loadTransferable(type: Data.self) {
                    imageData = loaded
                    imageString = imageData?.base64EncodedString()
                } else {
                    print("Failed")
                }
            }
        }
        
        Button(action: {
            rooms.append(Room(name: inputText, imageString: imageString ?? ""))
            inputText = ""
        }) {
            Text("Add")
                .frame(width: 200)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}


#Preview {
    AddRoomView(rooms: .constant([
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
