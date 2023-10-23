//
//  TrafficHistory+CoreDataProperties.swift
//  TrafficLightCh
//
//  Created by M Ahmad on 23/10/2023.
//
//

import Foundation
import CoreData


extension TrafficHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrafficHistory> {
        return NSFetchRequest<TrafficHistory>(entityName: "TrafficHistory")
    }

    @NSManaged public var eventName: String?
    @NSManaged public var timestamp: Date?

}

extension TrafficHistory : Identifiable {

}
