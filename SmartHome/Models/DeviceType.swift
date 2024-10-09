//
//  DeviceType.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 08.10.24.
//

import Foundation
import SwiftUICore

enum DeviceType: String, CaseIterable, Identifiable {
    case light = "Light"
    case thermostat = "Thermostat"
    case lock = "Lock"
    
    var id: String { rawValue }
    
    var image: String {
        switch self {
        case .light: return "lightbulb"
        case .thermostat: return "thermometer"
        case .lock: return "lock.fill"
        }
    }
}
