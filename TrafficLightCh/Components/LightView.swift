//
//  LightView.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let onLight: Bool
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .opacity(onLight ? 1 : 0.3)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

#Preview {
    LightView(color: .red, onLight: true)
}
