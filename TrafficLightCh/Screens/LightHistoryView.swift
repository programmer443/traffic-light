//
//  LightHistoryView.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//

import CoreData
import SwiftUI

struct LightHistoryView: View {
    @FetchRequest(
        entity: TrafficHistory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \TrafficHistory.timestamp, ascending: false)],
        animation: .default)
    private var events: FetchedResults<TrafficHistory>
    
    
    var body: some View {
        List {
            ForEach(events) { event in
                VStack(alignment: .leading) {
                    Text("Event Name")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    Text("\(event.eventName ?? "Empty")")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    
                    Text("TimeStamp")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    Text("\(event.timestamp ?? Date())")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
            }
        }.listStyle(.plain)
    }
}

#Preview {
    LightHistoryView()
}
