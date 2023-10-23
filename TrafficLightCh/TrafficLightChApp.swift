//
//  TrafficLightChApp.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import SwiftUI

@main
struct TrafficLightChApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
