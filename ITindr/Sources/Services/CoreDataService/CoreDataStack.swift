import Foundation
import CoreData

protocol CoreDataStackProtocol {
  var backgroundContext: NSManagedObjectContext { get }
  var mainContext: NSManagedObjectContext { get }
}

final class CoreDataStack: CoreDataStackProtocol {
  // MARK: - Properties
  
  private var persistentContainer: NSPersistentContainer = NSPersistentContainer(name: "AppModel")
  
  lazy var backgroundContext: NSManagedObjectContext = {
    let context = persistentContainer.newBackgroundContext()
    context.automaticallyMergesChangesFromParent = true
    return context
  }()
  
  lazy var mainContext:  NSManagedObjectContext = {
    let context = persistentContainer.viewContext
    context.automaticallyMergesChangesFromParent = true
    return context
  }()
  
  // MARK: - Init
  
  init() {
    setupPersistentContainer()
  }
  
  // MARK: - Private Methods
  
  private func setupPersistentContainer() {
    persistentContainer.loadPersistentStores { _, error in
      if let error = error {
        print(error)
        print("Error in \(#function)")
      }
    }
    persistentContainer.viewContext.mergePolicy = NSOverwriteMergePolicy
  }
}
