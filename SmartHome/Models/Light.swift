//
//  Light.swift
//  SmartHome
//
//  Created by Emanuel Sutor on 07.10.24.
//

import SwiftUI

struct Light: View {
    @Binding var text: String
    @Binding var lightOn: Bool
    
    var body: some View {
        Toggle(text, isOn: $lightOn)
    }
}

#Preview {

}
