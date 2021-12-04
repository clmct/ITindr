import Foundation
import CoreData

protocol CoreDataServiceProtocol {
}

enum CoreDataError: Error {
  case notObject
  case error
}

final class CoreDataService: CoreDataServiceProtocol {
  // MARK: - Properties
  
  private let coreDataStack: CoreDataStackProtocol = CoreDataStack()
  
  // MARK: - Public Methods
  func getPeople(completion: @escaping (Result<Users, CoreDataError>) -> Void) {
    let context = coreDataStack.mainContext
    let request = ProfileDB.fetchRequest()
    do {
      let people = try context.fetch(request)
      DispatchQueue.main.async {
        completion(.success(people.map { user -> Profile in
          return user.getModel()
        }))
      }
    } catch {
      DispatchQueue.main.async {
        completion(.failure(.error))
      }
    }
  }
  
  func savePeople(with users: Users) {
    performSave { context in
      users.forEach { user in
        _ = ProfileDB(with: context, profile: user)
      }
    }
  }
  
  func getUser(with id: String, completion: @escaping (Result<Profile, CoreDataError>) -> Void) {
    let context = coreDataStack.mainContext
    let request = ProfileDB.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", id)
    do {
      let people = try context.fetch(request)
      DispatchQueue.main.async {
        guard let user = people.first else {
          completion(.failure(.notObject))
          return
        }
        completion(.success(user.getModel()))
      }
    } catch {
      DispatchQueue.main.async {
        completion(.failure(.error))
      }
    }
  }
  
  func getTopics(completion: @escaping (Result<Topics, CoreDataError>) -> Void) {
    let context = coreDataStack.mainContext
    let request = TopicDB.fetchRequest()
    do {
      let topics = try context.fetch(request)
      DispatchQueue.main.async {
        completion(.success(topics.map { topic -> Topic in
          return topic.getModel()
        }))
      }
    } catch {
      DispatchQueue.main.async {
        completion(.failure(.error))
      }
    }
  }
  
  func saveTopics(with topics: Topics) {
    performSave { context in
      topics.forEach { topic in
        _ = TopicDB(with: context, topic: topic)
      }
    }
  }
  
  func getChats(completion: @escaping (Result<[ChatListCell], CoreDataError>)  -> Void) {
    let context = coreDataStack.mainContext
    let request = ChatDB.fetchRequest()
    do {
      let topics = try context.fetch(request)
      DispatchQueue.main.async {
        completion(.success(topics.map { chat -> ChatListCell in
          return chat.getModel()
        }))
      }
    } catch {
      DispatchQueue.main.async {
        completion(.failure(.error))
      }
    }
  }
  
  func saveChats(with chats: [ChatListCell]) {
    performSave { context in
      chats.forEach { chat in
        _ = ChatDB(with: context, chat: chat)
      }
    }
  }
  
  
  // MARK: - Private Methods
  private func performSave(_ block: (NSManagedObjectContext) -> Void) {
    let context = coreDataStack.backgroundContext
    context.performAndWait {
      block(context)
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          context.rollback()
        }
      }
    }
  }
}
