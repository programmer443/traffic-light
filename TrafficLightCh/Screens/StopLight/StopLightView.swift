//
//  StopLightView.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import SwiftUI

struct StopLightView: View {
    @ObservedObject var viewModel: StopLightView.ViewModel
    
    init(viewModel:  StopLightView.ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Traffic Light Signal")
                .font(.title)            
            
            Spacer()
            
            LightView(color: .red, onLight: viewModel.currentLight == .red)
            LightView(color: .yellow, onLight: viewModel.currentLight == .yellow)
            LightView(color: .green, onLight: viewModel.currentLight == .green)
            
            Spacer()
            
            Button {
                viewModel.restartTrafficLight()
            } label: {
                Text("Restart")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .frame(width: 100, height: 40)
            .background(Color.orange)
            .cornerRadius(20)
            
        } .onAppear {
            viewModel.startTrafficLight()
        }
        .onDisappear {
            viewModel.stopTrafficLight()
        }
    }
}
