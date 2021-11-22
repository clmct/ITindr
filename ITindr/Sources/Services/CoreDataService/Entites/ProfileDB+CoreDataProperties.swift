//
//  ProfileDB+CoreDataProperties.swift
//  ITindr
//
//  Created by Developer on 22.11.2021.
//
//

import Foundation
import CoreData


extension ProfileDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProfileDB> {
        return NSFetchRequest<ProfileDB>(entityName: "ProfileDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var aboutMyself: String?
    @NSManaged public var avatar: String?
    @NSManaged public var topics: NSSet?

}

// MARK: Generated accessors for topics
extension ProfileDB {

    @objc(addTopicsObject:)
    @NSManaged public func addToTopics(_ value: TopicDB)

    @objc(removeTopicsObject:)
    @NSManaged public func removeFromTopics(_ value: TopicDB)

    @objc(addTopics:)
    @NSManaged public func addToTopics(_ values: NSSet)

    @objc(removeTopics:)
    @NSManaged public func removeFromTopics(_ values: NSSet)

}
