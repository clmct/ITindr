import Foundation
import CoreData

protocol CoreDataServiceProtocol {
}

final class CoreDataService: CoreDataServiceProtocol {
  // MARK: - Properties
  
  private let coreDataStack: CoreDataStackProtocol = CoreDataStack()
  
  // MARK: - Init
  
  init() {
  }
  
  // MARK: - Public Methods

  
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
