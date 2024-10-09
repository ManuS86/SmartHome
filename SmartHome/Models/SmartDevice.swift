//
//  Untitled.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 08.10.24.
//

import Foundation
import SwiftUICore

struct SmartDevice: Identifiable {
    let id = UUID()
    var name: String
    var type: DeviceType
    var isOn = false
    var temperature = 20.0
    var isLocked = true
}
