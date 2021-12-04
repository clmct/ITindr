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

// MARK: - TopicDB

extension TopicDB {
  convenience init(with context: NSManagedObjectContext, topic: Topic) {
    self.init(context: context)
    id = topic.id
    title = topic.title
  }
  
  func getModel() -> Topic {
    let contact = Topic(id: id ?? "",
                        title: title ?? "",
                        isSelect: isSelect)
    return contact
  }
}

// MARK: - ChatDB

extension ChatDB {
  convenience init(with context: NSManagedObjectContext, chat: ChatListCell) {
    self.init(context: context)
    id = chat.id
    title = chat.title
    avatar = chat.image
    lastMessage = chat.description
    
  }
  
  func getModel() -> ChatListCell {
    let chat = ChatListCell(id: id,
                            image: avatar,
                            title: title ?? "",
                            description: lastMessage ?? "")
    return chat
  }
}
