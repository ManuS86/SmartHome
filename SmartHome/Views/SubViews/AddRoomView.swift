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
    @State private var imageString: String?
    @Binding var smartDevices: [SmartDevice]
    @Binding var rooms: [Room]
    
    var body: some View {
        HStack {
            TextField("Enter room name", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            PhotosPicker("\(Image(systemName: "photo"))", selection: $imageItem, matching: .images)
        }
        
        Button(action: { rooms.append(Room(name: inputText, imageString: imageString?.description ?? "")) }) {
            Text("Add")
                .frame(width: 200)
        }
        .buttonStyle(BorderedProminentButtonStyle())
    }
}


#Preview {
    AddRoomView(
        smartDevices: .constant([
        SmartDevice(name: "Main door", type: .lock)
    ]),
        rooms: .constant([Room(name: "Kitchen", imageString: "Room")])
    )
}
