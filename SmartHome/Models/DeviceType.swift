//
//  DeviceType.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 08.10.24.
//

import Foundation

enum DeviceType: String, CaseIterable, Identifiable {
    case light = "Light"
    case ac = "Air Conditioner"
    case thermostat = "Thermostat"
    case lock = "Lock"
    
    var id: String { rawValue }
    
    var image: String {
        switch self {
        case .light: return "lightbulb"
        case .ac: return "air.conditioner.horizontal.fill"
        case .thermostat: return "thermometer"
        case .lock: return "lock.fill"
        }
    }
    
    var image2: String {
        switch self {
        case .light: return "lightbulb.min"
        case .ac: return "air.conditioner.horizontal"
        case .thermostat: return "thermometer.medium.slash"
        case .lock: return "lock.open.fill"
        }
    }
}
