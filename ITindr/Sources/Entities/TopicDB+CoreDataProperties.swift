//
//  TopicDB+CoreDataProperties.swift
//  ITindr
//
//  Created by Almat Kulbaev on 04.12.2021.
//
//

import Foundation
import CoreData


extension TopicDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicDB> {
        return NSFetchRequest<TopicDB>(entityName: "TopicDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var isSelect: Bool
    @NSManaged public var title: String?
    @NSManaged public var relationship: ProfileDB?

}
