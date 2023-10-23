//
//  ContentView.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            TabView {
                StopLightView(viewModel: StopLightView.ViewModel(viewContext: viewContext))
                    .tabItem {
                        Label("Traffic Light", systemImage: "light.max")
                    }
                LightHistoryView()
                    .tabItem {
                        Label("Traffic History", systemImage: "list.bullet.rectangle")
                    }
            }
        }

    }
}
