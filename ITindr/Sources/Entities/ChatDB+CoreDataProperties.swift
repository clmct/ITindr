//
//  ChatDB+CoreDataProperties.swift
//  ITindr
//
//  Created by Almat Kulbaev on 04.12.2021.
//
//

import Foundation
import CoreData


extension ChatDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChatDB> {
        return NSFetchRequest<ChatDB>(entityName: "ChatDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var avatar: String?
    @NSManaged public var lastMessage: String?

}
