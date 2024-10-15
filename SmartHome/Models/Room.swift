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
        Image(imageString)
    }
}
