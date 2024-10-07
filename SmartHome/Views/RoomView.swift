//
//  RoomView.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var previewOn: Bool
    
    var body: some View {
                VStack {
                    Image(systemName: "xmark")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding()
                        .onTapGesture {
                            previewOn = false
                        }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background()
            .cornerRadius(12)
            .shadow(radius: 2, x: 1, y: 1)
    }
}

#Preview {
    RoomView(previewOn: .constant(true))
}
