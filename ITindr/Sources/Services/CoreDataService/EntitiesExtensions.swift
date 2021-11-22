//
//  EntitiesExtensions.swift
//  ITindr
//
//  Created by Developer on 22.11.2021.
//

import Foundation
import CoreData

// MARK: - ProfileDB

extension ProfileDB {
  convenience init(with context: NSManagedObjectContext,  profile: Profile) {
    self.init(context: context)
    id = profile.userID
    name = profile.name
    aboutMyself = profile.aboutMyself
    avatar = profile.avatar
  }
  
  func getModel() -> Profile {
    let contact = Profile(userID: id ?? "",
                          name: name ?? "",
                          aboutMyself: aboutMyself,
                          avatar: avatar,
                          topics: [])
    return contact
  }
}
