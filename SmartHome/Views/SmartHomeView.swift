//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State private var inputText = ""
    @State private var text = ""
    @State var previewOn = true
    
    var body: some View {
        VStack {
            TextField("Enter appliance name", text: $inputText)
                .padding(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
        
            Button("Add", action: {
                text = inputText
            })
            .padding(12)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            TextView(text: text)
                .padding()
            
            VStack {
                if previewOn {
                    RoomView(previewOn: $previewOn)
                }
                Toggle("Display room preview", isOn: $previewOn)
                    .tint(.blue)
                    .padding(.horizontal)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .padding()
    }
}

struct TextView: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    SmartHomeView()
}
