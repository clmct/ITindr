import UIKit

protocol UsersViewModelProtocol {
  var onDidMatch: VoidClosure? { get set }
  func writeMessage()
  func reject()
  func like()
}

protocol UsersViewModelDelegate: AnyObject {
}

final class UsersViewModel: UsersViewModelProtocol {
  
  // MARK: - Types
  typealias Dependencies = Any
  var onDidMatch: VoidClosure?
  
  // MARK: - Properties
  weak var delegate: UsersViewModelDelegate?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Method
  func reject() {
    
  }
  
  func like() {
    onDidMatch?()
  }
  
  func writeMessage() {
    
  }
  // MARK: - Actions
  
  // MARK: - Private Methods
}
