import Foundation
import CoreData

protocol CoreDataServiceProtocol {
}

final class CoreDataService: CoreDataServiceProtocol {
  // MARK: - Properties
  
  private let coreDataStack: CoreDataStackProtocol = CoreDataStack()
  
  // MARK: - Public Methods
  func getPeople(completion: @escaping (Result<Users, Error>) -> Void) {
    let context = coreDataStack.mainContext
    let request = ProfileDB.fetchRequest()
    do {
      let people = try context.fetch(request)
      DispatchQueue.main.async {
        completion(.success(people.map { user -> Profile in
          return user.getModel()
        }))
      }
    } catch let error {
      DispatchQueue.main.async {
        completion(.failure(error))
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
  
  func getTopics(completion: @escaping (Result<Topics, Error>) -> Void) {
    let context = coreDataStack.mainContext
    let request = TopicDB.fetchRequest()
    do {
      let topics = try context.fetch(request)
      DispatchQueue.main.async {
        completion(.success(topics.map { topic -> Topic in
          return topic.getModel()
        }))
      }
    } catch let error {
      DispatchQueue.main.async {
        completion(.failure(error))
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
