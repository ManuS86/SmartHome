//
//  Room.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 11.10.24.
//

import SwiftUI

struct Room: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var smartDevices: [SmartDevice] = []
    var imageString: String
    var image: Image {
        if let data = Data(base64Encoded: imageString) {
          if let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
          } else {
            Image(imageString)
          }
        } else {
          Image(imageString)
        }
      }
}
