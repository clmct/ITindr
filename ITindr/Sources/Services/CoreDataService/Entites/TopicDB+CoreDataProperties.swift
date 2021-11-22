//
//  TopicDB+CoreDataProperties.swift
//  ITindr
//
//  Created by Developer on 22.11.2021.
//
//

import Foundation
import CoreData


extension TopicDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicDB> {
        return NSFetchRequest<TopicDB>(entityName: "TopicDB")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: String?
    @NSManaged public var isSelect: Bool
    @NSManaged public var relationship: ProfileDB?

}
