import UIKit

protocol ChatViewModelProtocol {
}

protocol ChatViewModelDelegate: AnyObject {
}

final class ChatViewModel: ChatViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = Any
  
  // MARK: - Properties
  weak var delegate: ChatViewModelDelegate?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
