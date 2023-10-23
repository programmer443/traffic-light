//
//  StopLightVM.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import CoreData
import Foundation

extension StopLightView {
    
    class ViewModel: ObservableObject {
        let viewContext: NSManagedObjectContext
        @Published var currentLight = LightColor.green
        @Published var timer: Timer?
        
        init(viewContext: NSManagedObjectContext) {
            self.viewContext = viewContext
        }
        
        func startTrafficLight() {
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                self.changeLight()
            }
        }
        
        func stopTrafficLight() {
            timer?.invalidate()
        }
        
        func restartTrafficLight() {
            timer?.invalidate()
            addRecord("Restart Pressed")
            currentLight = .red
            startTrafficLight()
        }
        
        func changeLight() {
            switch currentLight {
            case .red:
                currentLight = .yellow
                addRecord("Light Changed - Yellow")
                timer?.invalidate()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    self.changeLight()
                }
            case .yellow:
                currentLight = .green
                addRecord("Light Changed - Green")
                timer?.invalidate()
                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                    self.changeLight()
                }
            case .green:
                currentLight = .red
                addRecord("Light Changed - Red")
                timer?.invalidate()
                Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
                    self.changeLight()
                }
            }
        }
        
        func addRecord(_ changeEvent: String) {
            let newEvent = TrafficHistory(context: viewContext)
            newEvent.eventName = changeEvent
            newEvent.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }

    }
        
    enum LightColor {
        case red, yellow, green
    }
}
